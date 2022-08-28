FROM nvidia/opengl:1.2-glvnd-runtime-ubuntu20.04

# Get packages
RUN apt-get update && apt-get install -y \
	fluxbox \
	x11vnc \
	xvfb \
	x11-xserver-utils \
	supervisor \
	python

# Set environment variables to default values
ENV DISPLAY=:0 \
	PASSWORD="" \
	XFB_SCREEN=1680x1050x24 \
	XFB_SCREEN_DPI=150 \
	HOME=/root

WORKDIR $HOME

# Install noVNC	and websockify, and create required links
ADD ./xserver/novnc/noVNC-1.1.0.tar.gz $HOME
ADD ./xserver/novnc/websockify-0.9.0.tar.gz $HOME

RUN ln -s $HOME/noVNC-1.1.0 $HOME/noVNC && \
	ln -s $HOME/websockify-0.9.0 $HOME/noVNC/utils/websockify

# Prepare supervisor log
RUN mkdir -p /var/log/supervisor

# Install configuration for supervisor
COPY ./xserver/supervisor-xhost $HOME

# Install configuration for fluxbox
COPY ./xserver/fluxbox $HOME/.fluxbox/

# Expose VNC, SUPERVISOR, and Websocker port 
EXPOSE 5900 9001 8080

# Set entrypoint
CMD ["/usr/bin/supervisord", "-c", "supervisord.conf"]
