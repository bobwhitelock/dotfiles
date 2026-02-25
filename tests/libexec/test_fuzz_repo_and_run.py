import os
import subprocess
import stat
import pytest

SCRIPT = os.path.join(os.path.dirname(__file__), "..", "..", "libexec", "fuzz-repo-and-run")


@pytest.fixture
def env(tmp_path):
    fake_bin = tmp_path / "bin"
    fake_bin.mkdir()

    fzf_args_file = tmp_path / "fzf_args"
    fzf_stdin_file = tmp_path / "fzf_stdin"

    fzf = fake_bin / "fzf"
    fzf.write_text(
        "#!/usr/bin/env bash\n"
        f'echo "$@" > "{fzf_args_file}"\n'
        f'tee "{fzf_stdin_file}" | head -1\n'
    )
    fzf.chmod(fzf.stat().st_mode | stat.S_IEXEC | stat.S_IXGRP | stat.S_IXOTH)

    src = tmp_path / "src"
    src.mkdir()

    return {
        "PATH": f"{fake_bin}:{os.environ.get('PATH', '')}",
        "SRC": str(src),
        "HOME": os.environ.get("HOME", ""),
        "_tmp_path": tmp_path,
        "_src": src,
        "_fzf_args_file": fzf_args_file,
        "_fzf_stdin_file": fzf_stdin_file,
    }


def run_script(args, env):
    e = {k: v for k, v in env.items() if not k.startswith("_")}
    return subprocess.run(
        [SCRIPT] + args,
        env=e,
        capture_output=True,
        text=True,
    )


def test_runs_command_on_selected_repo(env):
    repo_dir = env["_src"] / "github.com" / "owner" / "repo"
    repo_dir.mkdir(parents=True)
    (repo_dir / ".git").mkdir()

    result = run_script(["echo"], env)

    assert result.returncode == 0, result.stderr
    assert str(env["_src"] / "github.com" / "owner" / "repo") in result.stdout


def test_exits_1_when_no_repo_selected(env):
    repo_dir = env["_src"] / "github.com" / "owner" / "repo"
    repo_dir.mkdir(parents=True)
    (repo_dir / ".git").mkdir()

    fzf = env["_tmp_path"] / "bin" / "fzf"
    fzf.write_text("#!/usr/bin/env bash\nexit 1\n")

    result = run_script(["echo"], env)

    assert result.returncode == 1


def test_passes_query_to_fzf(env):
    repo_dir = env["_src"] / "github.com" / "owner" / "repo"
    repo_dir.mkdir(parents=True)
    (repo_dir / ".git").mkdir()

    run_script(["echo", "my", "query"], env)

    fzf_args = env["_fzf_args_file"].read_text()
    assert "--query=" in fzf_args
    assert "my" in fzf_args
    assert "query" in fzf_args


def test_lists_all_repos(env):
    repos = [
        ("owner", "repo"),
        ("github.com", "alice", "foo"),
        ("github.com", "bob", "bar"),
        ("gitlab.example.com", "one", "two", "three"),
    ]
    for parts in repos:
        d = env["_src"].joinpath(*parts)
        d.mkdir(parents=True)
        (d / ".git").mkdir()

    run_script(["echo"], env)

    fzf_stdin = env["_fzf_stdin_file"].read_text()
    assert "owner/repo" in fzf_stdin
    assert "github.com/alice/foo" in fzf_stdin
    assert "github.com/bob/bar" in fzf_stdin
    assert "gitlab.example.com/one/two/three" in fzf_stdin


def test_lists_repos_alphabetically(env):
    repos = [
        ("owner", "repo"),
        ("github.com", "alice", "foo"),
        ("github.com", "bob", "bar"),
        ("gitlab.example.com", "one", "two", "three"),
    ]
    for parts in repos:
        d = env["_src"].joinpath(*parts)
        d.mkdir(parents=True)
        (d / ".git").mkdir()

    run_script(["echo"], env)

    fzf_stdin = env["_fzf_stdin_file"].read_text()
    lines = [line for line in fzf_stdin.splitlines() if line]
    assert lines == sorted(lines)


def test_does_not_list_repos_within_repos(env):
    repo_dir = env["_src"] / "github.com" / "owner" / "repo"
    repo_dir.mkdir(parents=True)
    (repo_dir / ".git").mkdir()
    nested = repo_dir / "submodules" / "nested"
    nested.mkdir(parents=True)
    (nested / ".git").mkdir()

    run_script(["echo"], env)

    fzf_stdin = env["_fzf_stdin_file"].read_text()
    assert "github.com/owner/repo" in fzf_stdin
    assert "github.com/owner/repo/submodules/nested" not in fzf_stdin
