import os
import shutil
import stat
import subprocess
import textwrap

import pytest

DOTFILES = os.path.join(os.path.dirname(__file__), "..")
FIXTURES = os.path.join(DOTFILES, "tests", "fixtures", "local_customizations")


@pytest.fixture
def zsh_cmd(tmp_path):
    """Bash-based shim standing in for zsh, since zsh isn't available in CI.
    Handles the zsh syntax used in this codebase: strips the (N) null-glob
    qualifier and enables bash's nullglob to replicate the same behaviour."""
    shim = tmp_path / "zsh"
    shim.write_text(
        "#!/usr/bin/env bash\n"
        'if [[ "$1" == "-c" ]]; then\n'
        '    tmpfile=$(mktemp /tmp/fake_zsh_XXXXXX.sh)\n'
        '    trap "rm -f $tmpfile" EXIT\n'
        '    echo "shopt -s nullglob" > "$tmpfile"\n'
        '    echo "${2//(N)/}" >> "$tmpfile"\n'
        '    exec bash "$tmpfile"\n'
        "fi\n"
        'exec bash "$@"\n'
    )
    shim.chmod(shim.stat().st_mode | stat.S_IEXEC | stat.S_IXGRP | stat.S_IXOTH)
    return str(shim)
INSTALL_SCRIPT = os.path.join(DOTFILES, "install")


# --- gitconfig tests ---


def _git_config_email(home_dir):
    result = subprocess.run(
        ["git", "config", "user.email"],
        env={
            "HOME": str(home_dir),
            "GIT_CONFIG_NOSYSTEM": "1",
            "PATH": os.environ.get("PATH", ""),
        },
        capture_output=True,
        text=True,
    )
    return result


def test_gitconfig_email_overridden(tmp_path):
    override_cfg = tmp_path / "override.gitconfig"
    override_cfg.write_text("[user]\n\temail = custom@example.com\n")

    home = tmp_path / "home"
    home.mkdir()
    (home / ".gitconfig").write_text(
        "[user]\n\temail = original@example.com\n"
        f"[include]\n\tpath = {override_cfg}\n"
    )

    result = _git_config_email(home)
    assert result.returncode == 0
    assert result.stdout.strip() == "custom@example.com"


def test_gitconfig_works_without_local_customizations(tmp_path):
    home = tmp_path / "home"
    home.mkdir()
    (home / ".gitconfig").write_text("[user]\n\temail = original@example.com\n")

    result = _git_config_email(home)
    assert result.returncode == 0
    assert result.stdout.strip() == "original@example.com"


# --- zsh tests ---


def test_zsh_sources_custom_lib_files(zsh_cmd):
    lib_dir = os.path.join(FIXTURES, "zsh", "lib")
    script = textwrap.dedent(f"""\
        for file in "{lib_dir}/"*.sh(N); do
            source "$file"
        done
        local_custom_lib_test
    """)
    result = subprocess.run(
        [zsh_cmd, "-c", script],
        capture_output=True,
        text=True,
    )
    assert result.returncode == 0
    assert "custom_lib_loaded" in result.stdout


def test_zsh_lib_sourcing_works_without_local_customizations(tmp_path, zsh_cmd):
    missing_dir = tmp_path / "nonexistent" / "lib"
    script = textwrap.dedent(f"""\
        for file in "{missing_dir}/"*.sh(N); do
            source "$file"
        done
        echo ok
    """)
    result = subprocess.run(
        [zsh_cmd, "-c", script],
        capture_output=True,
        text=True,
    )
    assert result.returncode == 0
    assert "ok" in result.stdout


def test_zsh_sources_custom_env(zsh_cmd):
    env_file = os.path.join(FIXTURES, "zsh", "env.sh")
    script = textwrap.dedent(f"""\
        source "{env_file}"
        echo "$LOCAL_CUSTOM_ENV_TEST"
    """)
    result = subprocess.run(
        [zsh_cmd, "-c", script],
        capture_output=True,
        text=True,
    )
    assert result.returncode == 0
    assert result.stdout.strip() == "loaded"


# --- install tests ---


def _make_install_env(tmp_path, with_local_env=False):
    """Set up a minimal fake environment for running the install script."""
    fake_bin = tmp_path / "fake_bin"
    fake_bin.mkdir()

    sentinel = tmp_path / "sudo_called"

    for name in ("git", "cpan", "vim"):
        fake = fake_bin / name
        fake.write_text("#!/usr/bin/env bash\nexit 0\n")
        fake.chmod(fake.stat().st_mode | stat.S_IEXEC | stat.S_IXGRP | stat.S_IXOTH)

    sudo_script = fake_bin / "sudo"
    sudo_script.write_text(
        "#!/usr/bin/env bash\n"
        f'touch "{sentinel}"\n'
        "exit 0\n"
    )
    sudo_script.chmod(
        sudo_script.stat().st_mode | stat.S_IEXEC | stat.S_IXGRP | stat.S_IXOTH
    )

    basedir = tmp_path / "dotfiles"
    basedir.mkdir()

    # Copy install script
    shutil.copy(INSTALL_SCRIPT, basedir / "install")
    (basedir / "install").chmod(
        (basedir / "install").stat().st_mode | stat.S_IEXEC | stat.S_IXGRP | stat.S_IXOTH
    )

    # Mock bin/sync_dotbot
    bin_dir = basedir / "bin"
    bin_dir.mkdir()
    sync_dotbot = bin_dir / "sync_dotbot"
    sync_dotbot.write_text("#!/usr/bin/env bash\nexit 0\n")
    sync_dotbot.chmod(
        sync_dotbot.stat().st_mode | stat.S_IEXEC | stat.S_IXGRP | stat.S_IXOTH
    )

    # Mock ~/.tmux/plugins/tpm/bin/install_plugins
    tpm_bin = tmp_path / ".tmux" / "plugins" / "tpm" / "bin"
    tpm_bin.mkdir(parents=True)
    install_plugins = tpm_bin / "install_plugins"
    install_plugins.write_text("#!/usr/bin/env bash\nexit 0\n")
    install_plugins.chmod(
        install_plugins.stat().st_mode | stat.S_IEXEC | stat.S_IXGRP | stat.S_IXOTH
    )

    # Stub zsh/env.sh and zsh/env.private.sh
    zsh_dir = basedir / "zsh"
    zsh_dir.mkdir()
    (zsh_dir / "env.sh").write_text("#!/usr/bin/env bash\nexport DOTFILES_LOADED=1\n")
    (zsh_dir / "env.private.sh").write_text("")

    if with_local_env:
        local_dir = basedir / ".local-customizations" / "zsh"
        local_dir.mkdir(parents=True)
        (local_dir / "env.sh").write_text(
            "#!/usr/bin/env bash\nexport DOTFILES_SUDO=false\n"
        )

    env = {
        "PATH": f"{fake_bin}:{os.environ.get('PATH', '')}",
        "HOME": str(tmp_path),
        "BASH_SOURCE": str(basedir / "install"),
    }
    return basedir, sentinel, env


def test_install_skips_sudo_when_dotfiles_sudo_false(tmp_path):
    basedir, sentinel, env = _make_install_env(tmp_path, with_local_env=True)

    result = subprocess.run(
        ["bash", str(basedir / "install")],
        env=env,
        capture_output=True,
        text=True,
        cwd=str(basedir),
    )

    assert not sentinel.exists(), (
        f"sudo should not have been called. stdout={result.stdout!r} stderr={result.stderr!r}"
    )
    assert "Skipping (sudo disabled by DOTFILES_SUDO=false)" in result.stdout


def test_install_calls_sudo_by_default(tmp_path):
    basedir, sentinel, env = _make_install_env(tmp_path, with_local_env=False)

    result = subprocess.run(
        ["bash", str(basedir / "install")],
        env=env,
        capture_output=True,
        text=True,
        cwd=str(basedir),
    )

    assert sentinel.exists(), (
        f"sudo should have been called. stdout={result.stdout!r} stderr={result.stderr!r}"
    )
