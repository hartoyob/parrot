FROM parrotsec/core:rolling
MAINTAINER suntzu (suntzu@theartofwar.org)
ENV DEBIAN_FRONTEND noninteractive

# Install components

RUN apt-get update; apt-get -y dist-upgrade
RUN		apt-get -y install \
		socat \
		netcat \
		ipcalc \
		mtr-tiny \
		vim \
		man
RUN		apt-get -y install \
		metasploit-framework \
                postgresql \
                dirbuster \
                gobuster \
                enum4linux \
		exploitdb 
RUN 		apt-get -y autoremove

ADD https://raw.githubusercontent.com/ParrotSec/parrot-core/master/parrot-core/root/.bashrc /root/.bashrc

ENTRYPOINT bash $@
