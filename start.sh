#!/bin/sh
# container startup script
# DO NOT EDIT
echo $FLAG>/home/ctf/flag
export FLAG=NULL
FLAG=NULL
/busybox telnetd -p 2333 -F -l /run.sh
#sleep infinity;
