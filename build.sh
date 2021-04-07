docker run --rm -d -v squid:/data --name squid-deb-proxy squid-deb-proxy
docker build --no-cache \
--build-arg http_proxy=http://$(docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' squid-deb-proxy):8000 . -t suntzu/parrot
docker stop squid-deb-proxy 
