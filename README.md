# X Server notes

## noVNC options

The noVNC application can be controlled by including certain settings in the query string.

See https://github.com/novnc/noVNC/blob/master/docs/EMBEDDING.md

Relevant ones:

- resize - How to resize the remote session if it is not the same size as the browser window. Can be one of off, scale and remote.
- autoconnect - Automatically connect as soon as the page has finished loading.

Example:
````
http://xserver/vnc.html?resize=scale&autoconnect
````

## GLX support

### Open**GL** Extension to the **X** Window System

https://en.wikipedia.org/wiki/GLX:

> **GLX** ([initialism](https://en.wikipedia.org/wiki/Acronym_and_initialism) for "Open**GL** Extension to the **X** Window System") is an extension to the [X Window System core protocol](https://en.wikipedia.org/wiki/X_Window_System_core_protocol) providing an [interface](https://en.wikipedia.org/wiki/Interface_(computing)) between [OpenGL](https://en.wikipedia.org/wiki/OpenGL) and the [X Window System](https://en.wikipedia.org/wiki/X_Window_System) as well as extensions to OpenGL itself. It enables programs wishing to use OpenGL to do so within a window provided by the X Window System. GLX distinguishes two "states": indirect state and direct state.

### Indirect and direct rendering

Indirect rendering means that the GLX protocol will be used to transmit OpenGL commands and the X.org will do the real drawing.

[Direct rendering](http://en.wikipedia.org/wiki/Direct_Rendering_Infrastructure) means that application can access hardware directly without communication with X.org first via mesa.

The direct rendering is faster as it does not require change of context into X.org process. 

### Issues

For some applications the following message may be generated:

````
Cannot create platform OpenGL context, neither GLX nor EGL are enabled
````

Correct functioning of GLX involves both the client side (the X application) and the server side (the X Server).

`Xdummy` appears to support GLX, however this is unclear for `Xvfb`. Client-side Mesa drivers provide limited support for GLX.

### Links to explore

- https://en.wikipedia.org/wiki/GLX
- https://en.wikipedia.org/wiki/Direct_Rendering_Infrastructure
- https://www.scm.com/doc/Installation/Remote_GUI.html
- https://unix.stackexchange.com/questions/1437/what-does-libgl-always-indirect-1-actually-do
- https://www.mesa3d.org/envvars.html
- https://doc.qt.io/qt-5/linux.html

### Useful commands

`glxinfo`: display information about a GLX extension and OpenGL renderer.
`xdpyinfo`: display information utility for X.
