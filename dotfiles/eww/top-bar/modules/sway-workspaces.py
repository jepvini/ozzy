#!/usr/bin/env python3
# Original Author: Elkowar https://github.com/elkowar/dots-of-war/blob/master/eww-bar/.config/eww-bar/swayspaces.py

import json
import subprocess


def get_workspaces():
    output = subprocess.check_output(["swaymsg", "-t", "get_workspaces"])
    return json.loads(output.decode("utf-8"))


def generate_workspace_data():
    data = []
    for wsp in get_workspaces():
        i = {
            "name": wsp["name"],
            "monitor": wsp["output"],
            "focused": wsp["focused"],
            "visible": wsp["visible"],
        }
        if wsp["focused"]:
            i["class"] = "focused"
            i["icon"] = ""
        elif wsp["visible"]:
            i["class"] = "visible"
            i["icon"] = ""
        elif wsp["output"] == "eDP-1":
            i["class"] = "eDP"
            i["icon"] = ""
        elif wsp["output"] == "HDMI-A-2":
            i["class"] = "HDMI"
            i["icon"] = ""
        else:
            i["class"] = "hidden"
            i["icon"] = "h"
        data.append(i)

    return data


if __name__ == "__main__":
    process = subprocess.Popen(
        ["swaymsg", "-t", "subscribe", "-m", '["workspace"]', "--raw"],
        stdout=subprocess.PIPE,
    )
    if process.stdout is None:
        print("Error: could not subscribe to sway events")
        exit(1)
    while True:
        print(json.dumps(generate_workspace_data()), flush=True)
        line = process.stdout.readline().decode("utf-8")
        if line == "":
            break
