#!/bin/sh
# Your program should be placed in /home/ctf
# We use proot for isolating, make /home/ctf as root dir.
# Replace the "helloworld" with your filename
# If your program requiring shell command, add option "-b /bin" before filename
cd /home/ctf && su ctf -c "proot -r /home/ctf -w / -b /dev -b /proc -b /sys -b /lib -b /libx32 -b /lib32 -b /lib64 /helloworld"
