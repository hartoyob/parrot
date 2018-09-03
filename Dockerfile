FROM parrotsec/parrot:latest
MAINTAINER suntzu (suntzu@theartofwar.org)
ENV DEBIAN_FRONTEND noninteractive

# Install components
RUN 	apt-get update && \
	apt-get -y dist-upgrade && \
	apt-get -y install parrot-pico \
	metasploit-framework \
	postgresql \
	parrot-mini \
	parrot-tools-cloud \
	parrot-menu \
	ipcalc \
	mtr-tiny \
	vim \
	man && \
 	apt-get -y autoremove

ADD https://raw.githubusercontent.com/ParrotSec/parrot-core/master/parrot-core/root/.bashrc /root/.bashrc

ENTRYPOINT bash $@
