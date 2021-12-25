# socat

(https://hub.docker.com/r/xnohat/socat)

Alpine image for running socat (`socat`).

Use this when you don't have socat installed on your system or you want to use this image as a
base for simple service demos.

## Example using the host network

Start a socat port forwarding

    $ docker run -dit --restart=always --network=host --name=socat xnohat/socat tcp-l:3389,fork,reuseaddr tcp:192.168.0.100:3389

This command will start a container of socat that listen on port 3389 and forward all traffic to external ip 192.168.0.100 at port 3389

Read more: https://unix.stackexchange.com/a/293308\
\
Note: we use the host network stack (`host`) which means that port `3384` in the
container is available on port `3384` of the host machine. Since we are using the host
network stack directly it is not necessary to explicitly "publish" the port to the host
network (using the `-p|--publish` option). In any case, the netcat command itself still
needs to be told which port it is supposed to listen to, so `3384` is supplied as the
argument to the default process for the container (which is `socat`) created by the
`xnohat/socat` image at the end of the `docker run` command.


### TIP

You can set aliases in your shell configuration to reduce typing:

    $ alias socat="docker run -t --rm --network=host --name=socat xnohat/socat"
    
Then the example above looks like this:

    $ socat -h
