#!/usr/bin/env python3

import json
import os
import subprocess
import sys

# TODO BW 2025-09-18: Could have Claude use its own Pushover app so
# notifications come through with its own name.


def main():
    input_data = json.load(sys.stdin)
    event = input_data["hook_event_name"].lower()
    cwd = path_relative_to_src_or_absolute(input_data["cwd"])
    alert_prefix = f"Claude in {cwd}"

    def pingme(message: str):
        # Send push notification
        subprocess.run(
            [
                "pingme",
                f"{alert_prefix}: {message}\n\n(debug: {input_data})",
            ]
        )

        # Sound terminal bell (which will also make Tmux highlight the window)
        with open("/dev/tty", "w") as tty:
            tty.write("\a")
            tty.flush()

    if event == "notification":
        pingme(input_data["message"])
    else:
        pingme("unhandled input")


def path_relative_to_src_or_absolute(path: str):
    abs_path = os.path.abspath(path)
    abs_base = os.environ.get("SRC")

    if abs_path.startswith(abs_base + os.sep):
        return os.path.relpath(abs_path, abs_base)
    return abs_path


if __name__ == "__main__":
    main()
