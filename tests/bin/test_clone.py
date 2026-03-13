import os
import subprocess
import stat
import sys
import pytest

CLONE_SCRIPT = os.path.join(os.path.dirname(__file__), "..", "..", "bin", "clone")
PYTHON = sys.executable


def _make_executable(path):
    path.chmod(path.stat().st_mode | stat.S_IEXEC | stat.S_IXGRP | stat.S_IXOTH)


@pytest.fixture
def env(tmp_path):
    fake_bin = tmp_path / "bin"
    fake_bin.mkdir()

    gh = fake_bin / "gh"
    gh.write_text(
        f"#!{PYTHON}\n"
        "import sys, os\n"
        f'open("{tmp_path}/gh_called", "w").close()\n'
        "name = os.path.basename(sys.argv[3])\n"
        "os.makedirs(name, exist_ok=True)\n"
    )
    _make_executable(gh)

    git = fake_bin / "git"
    git.write_text(
        f"#!{PYTHON}\n"
        "import sys, os\n"
        f'open("{tmp_path}/git_called", "w").close()\n'
        "url = sys.argv[2]\n"
        f'open("{tmp_path}/git_clone_url", "w").write(url)\n'
        'name = os.path.basename(url.removesuffix(".git"))\n'
        "os.makedirs(name, exist_ok=True)\n"
    )
    _make_executable(git)

    add_window = fake_bin / "add_window"
    add_window.write_text(f"#!{PYTHON}\n")
    _make_executable(add_window)

    src = tmp_path / "src"
    src.mkdir()

    return {
        "PATH": f"{fake_bin}:{os.environ.get('PATH', '')}",
        "SRC": str(src),
        "HOME": os.environ.get("HOME", ""),
        "_tmp_path": tmp_path,
        "_src": src,
    }


@pytest.fixture
def env_no_gh(env):
    fake_bin = env["_tmp_path"] / "bin"
    (fake_bin / "gh").unlink()
    (fake_bin / "python3").symlink_to(PYTHON)
    env["PATH"] = str(fake_bin)
    return env


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
        ("https://github.com/junegunn/fzf", "github.com/junegunn/fzf"),
        ("https://github.com/junegunn/fzf.vim", "github.com/junegunn/fzf.vim"),
        ("git@github.com:junegunn/fzf.git", "github.com/junegunn/fzf"),
        ("git@github.com:junegunn/fzf.vim.git", "github.com/junegunn/fzf.vim"),
        ("junegunn/fzf", "github.com/junegunn/fzf"),
        ("junegunn/fzf.vim", "github.com/junegunn/fzf.vim"),
        (
            "https://gitlab.example.com/junegunn/fzf/fzf.vim.git",
            "gitlab.example.com/junegunn/fzf/fzf.vim",
        ),
        (
            "git@gitlab.example.com:junegunn/fzf/fzf.vim.git",
            "gitlab.example.com/junegunn/fzf/fzf.vim",
        ),
    ],
)
def test_clone_creates_directory(repo_identifier, expected_subdir, env):
    result = run_clone(repo_identifier, env)
    assert result.returncode == 0, result.stderr
    expected = env["_src"] / expected_subdir
    assert expected.is_dir(), f"Expected {expected} to exist"


def test_already_cloned_skips_gh(env):
    repo_dir = env["_src"] / "github.com" / "junegunn" / "fzf"
    repo_dir.mkdir(parents=True)

    run_clone("junegunn/fzf", env)

    sentinel = env["_tmp_path"] / "gh_called"
    assert (
        not sentinel.exists()
    ), "gh should not have been called when repo already exists"


def test_already_cloned_skips_git(env):
    repo_dir = env["_src"] / "gitlab.example.com" / "junegunn" / "fzf" / "fzf.vim"
    repo_dir.mkdir(parents=True)

    run_clone("https://gitlab.example.com/junegunn/fzf/fzf.vim.git", env)

    sentinel = env["_tmp_path"] / "git_called"
    assert (
        not sentinel.exists()
    ), "git should not have been called when repo already exists"


@pytest.mark.parametrize(
    "repo_identifier,expected_url",
    [
        ("junegunn/fzf", "https://github.com/junegunn/fzf"),
        ("https://github.com/junegunn/fzf", "https://github.com/junegunn/fzf"),
        ("git@github.com:junegunn/fzf.git", "git@github.com:junegunn/fzf.git"),
    ],
)
def test_github_falls_back_to_git_when_no_gh(repo_identifier, expected_url, env_no_gh):
    result = run_clone(repo_identifier, env_no_gh)
    assert result.returncode == 0, result.stderr
    assert (env_no_gh["_tmp_path"] / "git_called").exists()
    url_file = env_no_gh["_tmp_path"] / "git_clone_url"
    assert url_file.read_text().strip() == expected_url
