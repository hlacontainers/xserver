# X Server

Build the X Server via the available Dockerfile in this repository.

Run the X Server with the following docker-compose file:

````
version: '3'

services:
 xserver:
  image: hlacontainers/xserver
  ports:
  - "8080:8080"
````

