#!/bin/sh

if [ "$PASSWORD" = "" ]; then
	# Start VNC Server in the home directory, without password
	(cd ~; x11vnc -quiet -forever -nopw -display $DISPLAY)
else
	# Set VNC password
	mkdir -p ~/.vnc
	x11vnc -storepasswd $PASSWORD ~/.vnc/passwd

	# Start VNC Server in the home directory, with password
	(cd ~; x11vnc -quiet -forever -usepw -display $DISPLAY)
fi
