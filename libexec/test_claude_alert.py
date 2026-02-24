#!/usr/bin/env python3

import json
import subprocess
import sys
import tempfile
import os

# TODO BW 2025-09-18: make this better, use pytest, test all branches of script


def test_claude_alert():
    """Test that claude_alert.py runs successfully with the provided test data."""

    test_data = {
        "session_id": "61495b1f-3b0e-4d82-b06d-9aacca4a7b7b",
        "transcript_path": "/home/bob/.claude/projects/-home-bob-src-bobwhitelock-dotfiles/61495b1f-3b0e-4d82-b06d-9aacca4a7b7b.jsonl",
        "cwd": "/home/bob/src/github.com/bobwhitelock/dotfiles",
        "hook_event_name": "Notification",
        "message": "Claude needs your permission to use Write",
    }

    # Get the directory of this test file
    script_dir = os.path.dirname(os.path.abspath(__file__))
    claude_alert_path = os.path.join(script_dir, "claude_alert.py")

    # Run the claude_alert.py script with test data as stdin
    process = subprocess.run(
        [sys.executable, claude_alert_path],
        input=json.dumps(test_data),
        text=True,
        capture_output=True,
    )

    # Check that the script runs with success exit code
    if process.returncode == 0:
        print("✓ claude_alert.py ran successfully")
        return True
    else:
        print(f"✗ claude_alert.py failed with exit code {process.returncode}")
        print(f"stdout: {process.stdout}")
        print(f"stderr: {process.stderr}")
        return False


if __name__ == "__main__":
    success = test_claude_alert()
    sys.exit(0 if success else 1)
