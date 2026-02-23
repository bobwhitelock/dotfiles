import os
import subprocess
import stat
import pytest

CLONE_SCRIPT = os.path.join(os.path.dirname(__file__), "..", "..", "bin", "clone")


@pytest.fixture
def env(tmp_path):
    fake_bin = tmp_path / "bin"
    fake_bin.mkdir()

    gh = fake_bin / "gh"
    gh.write_text(
        "#!/usr/bin/env bash\n"
        f'touch "{tmp_path}/gh_called"\n'
        'mkdir -p "$(basename "$3")"\n'
    )
    gh.chmod(gh.stat().st_mode | stat.S_IEXEC | stat.S_IXGRP | stat.S_IXOTH)

    add_window = fake_bin / "add_window"
    add_window.write_text("#!/usr/bin/env bash\nexit 0\n")
    add_window.chmod(
        add_window.stat().st_mode | stat.S_IEXEC | stat.S_IXGRP | stat.S_IXOTH
    )

    src = tmp_path / "src"
    src.mkdir()

    return {
        "PATH": f"{fake_bin}:{os.environ.get('PATH', '')}",
        "SRC": str(src),
        "HOME": os.environ.get("HOME", ""),
        "_tmp_path": tmp_path,
        "_src": src,
    }


def run_clone(repo_identifier, env):
    e = {k: v for k, v in env.items() if not k.startswith("_")}
    result = subprocess.run(
        [CLONE_SCRIPT, repo_identifier],
        env=e,
        capture_output=True,
        text=True,
    )
    return result


@pytest.mark.parametrize(
    "repo_identifier,expected_subdir",
    [
        ("https://github.com/junegunn/fzf", "junegunn/fzf"),
        ("https://github.com/junegunn/fzf.vim", "junegunn/fzf.vim"),
        ("git@github.com:junegunn/fzf.git", "junegunn/fzf"),
        ("git@github.com:junegunn/fzf.vim.git", "junegunn/fzf.vim"),
        ("junegunn/fzf", "junegunn/fzf"),
        ("junegunn/fzf.vim", "junegunn/fzf.vim"),
    ],
)
def test_clone_creates_directory(repo_identifier, expected_subdir, env):
    result = run_clone(repo_identifier, env)
    assert result.returncode == 0, result.stderr
    expected = env["_src"] / expected_subdir
    assert expected.is_dir(), f"Expected {expected} to exist"


def test_already_cloned_skips_gh(env):
    repo_dir = env["_src"] / "junegunn" / "fzf"
    repo_dir.mkdir(parents=True)

    run_clone("junegunn/fzf", env)

    sentinel = env["_tmp_path"] / "gh_called"
    assert not sentinel.exists(), "gh should not have been called when repo already exists"
