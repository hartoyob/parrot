# parrot
Dockerfile to build more up-to-date & customized parrotsec docker image

Command to run:

docker run -ti --rm --mount src=kali-root,dst=/root --mount src=kali-postgres,dst=/var/lib/postgresql suntzu/parrot
