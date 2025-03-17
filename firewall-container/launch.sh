docker build -t firewall-container .
docker run --name firewall --privileged -d firewall-container
