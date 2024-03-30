import os
import subprocess   

profiles = ["docked", "laptop", "mirror", "extend"]

output = subprocess.check_output("autorandr --current", shell=True).decode("utf-8").strip()

for i in range(len(profiles)):
    if profiles[i] == output:
        i = (i + 1) % len(profiles)
        subprocess.run(["notify-send", "Monitor profile changed to: " + profiles[i]])
        subprocess.run(["autorandr", "--load", profiles[i]])
