# parrot
Dockerfile to build more up-to-date & customized parrotsec docker image

Command to run:

```
docker run -ti --rm -e DISPLAY=docker.for.mac.localhost:0 -p 4444:4444 -p 16800:16800 --mount src=parrot-root,dst=/root --mount src=parrot-postgres,dst=/var/lib/postgresql --cap-add=NET_ADMIN --cap-add=SYS_ADMIN --name parrot --device=/dev/net/tun suntzu/parrot`
```
Explanation:

To allow GUI to connect to X Windows 
`-e DISPLAY=docker.for.mac.localhost:0` 

To open ports
`-p 4444:4444 -p 16800:16800`

To create docker volume (data persistency)
`--mount src=parrot-root,dst=/root --mount src=parrot-postgres,dst=/var/lib/postgresql`

To make openvpn works from inside container
`--cap-add=NET_ADMIN device=/dev/net/tun`

To support NFS mount
`--cap-add=SYS_ADMIN`

In case subnet conflict, create a new docker network and then attach it to the container
docker network create --driver=bridge --subnet=192.168.2.0/24 --gateway=192.168.2.10 new_subnet

When run the docker, add --network=new_subnet
so "docker run --network=new_subnet"
