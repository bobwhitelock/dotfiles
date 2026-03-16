import os
import shutil
import subprocess

import pytest

DOTFILES = os.path.join(os.path.dirname(__file__), "..")
TASKFILE = os.path.join(DOTFILES, "Taskfile.yml")
SYNC_EXCLUDE = os.path.join(DOTFILES, "obsidian-sync-exclude")
NOTES_ENV_VAR = "NOTES"


@pytest.fixture
def task_env(tmp_path):
    """Isolated working directory for running task commands, with minimal
    obsidian config files and a separate notes repo directory."""
    shutil.copy(TASKFILE, tmp_path / "Taskfile.yml")
    shutil.copy(SYNC_EXCLUDE, tmp_path / "obsidian-sync-exclude")

    obsidian_dir = tmp_path / "obsidian"
    obsidian_dir.mkdir()
    (obsidian_dir / "app.json").write_text('{"vimMode": true}')
    (obsidian_dir / "hotkeys.json").write_text("{}")

    (tmp_path / "obsidian.vimrc").write_text("set clipboard=unnamedplus\n")

    # notes_repo mimics the $NOTES dir; the actual vault is at notes_repo/notes/
    notes_repo = tmp_path / "notes_repo"
    notes_repo.mkdir()
    (notes_repo / "notes").mkdir()

    return {
        "cwd": tmp_path,
        "notes_repo": notes_repo,
        "vault": notes_repo / "notes",
        "obsidian_dir": obsidian_dir,
    }


def run_task(task_name, cwd, notes_repo=None):
    env = {k: v for k, v in os.environ.items() if k != NOTES_ENV_VAR}
    if notes_repo is not None:
        env[NOTES_ENV_VAR] = str(notes_repo)
    return subprocess.run(
        ["task", task_name],
        env=env,
        capture_output=True,
        text=True,
        cwd=str(cwd),
    )


# --- push-obsidian ---


def test_push_obsidian_copies_configs_to_vault(task_env):
    result = run_task("push-obsidian", task_env["cwd"], task_env["notes_repo"])

    assert result.returncode == 0, result.stderr
    assert (task_env["vault"] / ".obsidian" / "app.json").read_text() == '{"vimMode": true}'
    assert (task_env["vault"] / ".obsidian" / "hotkeys.json").exists()


def test_push_obsidian_copies_vimrc(task_env):
    result = run_task("push-obsidian", task_env["cwd"], task_env["notes_repo"])

    assert result.returncode == 0, result.stderr
    assert (task_env["vault"] / ".obsidian.vimrc").read_text() == "set clipboard=unnamedplus\n"


def test_push_obsidian_creates_obsidian_dir_if_missing(task_env):
    result = run_task("push-obsidian", task_env["cwd"], task_env["notes_repo"])

    assert result.returncode == 0, result.stderr
    assert (task_env["vault"] / ".obsidian").is_dir()


def test_push_obsidian_deletes_files_removed_from_dotfiles(task_env):
    (task_env["vault"] / ".obsidian").mkdir()
    (task_env["vault"] / ".obsidian" / "stale.json").write_text("{}")

    result = run_task("push-obsidian", task_env["cwd"], task_env["notes_repo"])

    assert result.returncode == 0, result.stderr
    assert not (task_env["vault"] / ".obsidian" / "stale.json").exists()


def test_push_obsidian_preserves_vault_specific_files(task_env):
    (task_env["vault"] / ".obsidian").mkdir()
    (task_env["vault"] / ".obsidian" / "graph.json").write_text('{"vault": "graph"}')
    (task_env["vault"] / ".obsidian" / "workspace.json").write_text('{"vault": "workspace"}')
    (task_env["vault"] / ".obsidian" / "workspace-mobile.json").write_text('{"vault": "workspace-mobile"}')

    result = run_task("push-obsidian", task_env["cwd"], task_env["notes_repo"])

    assert result.returncode == 0, result.stderr
    assert (task_env["vault"] / ".obsidian" / "graph.json").read_text() == '{"vault": "graph"}'
    assert (task_env["vault"] / ".obsidian" / "workspace.json").read_text() == '{"vault": "workspace"}'
    assert (task_env["vault"] / ".obsidian" / "workspace-mobile.json").read_text() == '{"vault": "workspace-mobile"}'


def test_push_obsidian_fails_without_notes_env_var(task_env):
    result = run_task("push-obsidian", task_env["cwd"], notes_repo=None)

    assert result.returncode != 0
    assert NOTES_ENV_VAR in result.stdout + result.stderr


def test_push_obsidian_uses_overridden_notes_env_var(task_env, tmp_path):
    other_repo = tmp_path / "other_notes_repo"
    (other_repo / "notes").mkdir(parents=True)

    result = run_task("push-obsidian", task_env["cwd"], other_repo)

    assert result.returncode == 0, result.stderr
    assert (other_repo / "notes" / ".obsidian" / "app.json").exists()
    assert not (task_env["vault"] / ".obsidian").exists()


# --- pull-obsidian ---


def test_pull_obsidian_copies_configs_from_vault(task_env):
    (task_env["vault"] / ".obsidian").mkdir()
    (task_env["vault"] / ".obsidian" / "edited.json").write_text('{"edited": true}')
    (task_env["vault"] / ".obsidian.vimrc").write_text("set number\n")

    result = run_task("pull-obsidian", task_env["cwd"], task_env["notes_repo"])

    assert result.returncode == 0, result.stderr
    assert (task_env["cwd"] / "obsidian" / "edited.json").read_text() == '{"edited": true}'


def test_pull_obsidian_copies_vimrc(task_env):
    (task_env["vault"] / ".obsidian").mkdir()
    (task_env["vault"] / ".obsidian.vimrc").write_text("set number\n")

    result = run_task("pull-obsidian", task_env["cwd"], task_env["notes_repo"])

    assert result.returncode == 0, result.stderr
    assert (task_env["cwd"] / "obsidian.vimrc").read_text() == "set number\n"


def test_pull_obsidian_does_not_pull_vault_specific_files(task_env):
    (task_env["vault"] / ".obsidian").mkdir()
    (task_env["vault"] / ".obsidian" / "graph.json").write_text('{"vault": "graph"}')
    (task_env["vault"] / ".obsidian" / "workspace.json").write_text('{"vault": "workspace"}')
    (task_env["vault"] / ".obsidian" / "workspace-mobile.json").write_text('{"vault": "workspace-mobile"}')
    (task_env["vault"] / ".obsidian.vimrc").write_text("set number\n")

    result = run_task("pull-obsidian", task_env["cwd"], task_env["notes_repo"])

    assert result.returncode == 0, result.stderr
    assert not (task_env["cwd"] / "obsidian" / "graph.json").exists()
    assert not (task_env["cwd"] / "obsidian" / "workspace.json").exists()
    assert not (task_env["cwd"] / "obsidian" / "workspace-mobile.json").exists()


def test_pull_obsidian_deletes_files_removed_from_vault(task_env):
    (task_env["obsidian_dir"] / "stale.json").write_text("{}")
    (task_env["vault"] / ".obsidian").mkdir()
    (task_env["vault"] / ".obsidian.vimrc").write_text("set number\n")

    result = run_task("pull-obsidian", task_env["cwd"], task_env["notes_repo"])

    assert result.returncode == 0, result.stderr
    assert not (task_env["cwd"] / "obsidian" / "stale.json").exists()


def test_pull_obsidian_fails_without_notes_env_var(task_env):
    result = run_task("pull-obsidian", task_env["cwd"], notes_repo=None)

    assert result.returncode != 0
    assert NOTES_ENV_VAR in result.stdout + result.stderr


def test_pull_obsidian_uses_overridden_notes_env_var(task_env, tmp_path):
    other_repo = tmp_path / "other_notes_repo"
    (other_repo / "notes" / ".obsidian").mkdir(parents=True)
    (other_repo / "notes" / ".obsidian" / "from_other.json").write_text('{"other": true}')
    (other_repo / "notes" / ".obsidian.vimrc").write_text("set relativenumber\n")

    result = run_task("pull-obsidian", task_env["cwd"], other_repo)

    assert result.returncode == 0, result.stderr
    assert (task_env["cwd"] / "obsidian" / "from_other.json").exists()
    assert (task_env["cwd"] / "obsidian.vimrc").read_text() == "set relativenumber\n"
