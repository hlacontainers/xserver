#!/bin/sh

if [ -z "$PASSWORD" ]; then
	# Start VNC Server in the home directory, without password
	x11vnc -quiet -shared -forever -nopw -display $DISPLAY &
else
	# Start VNC Server in the home directory, with password
	x11vnc -quiet -shared -forever -passwd $PASSWORD -display $DISPLAY &
fi

# Sleep to allow application to start
sleep 1

# xhost can only be performed after x11vnc has started and there is an X session
# Allow anybody to connect to the X-Server
xhost +

# Wait for x11vnc to terminate
wait %1
