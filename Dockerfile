FROM parrotsec/core:latest
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
		exploitdb \
		dirb \
		openvpn
RUN		apt-get -y install \
#		seclists \
		curl \
		enum4linux \
		gobuster \
		nbtscan \
 		nikto \
		nmap \
		onesixtyone \
		oscanner \
		smbclient \
		smbmap \
		smtp-user-enum \
		sslscan \
		tnscmd10g \
		whatweb \
		python3-pip
RUN 		apt-get -y autoremove
RUN		python3 -m pip install git+https://github.com/Tib3rius/AutoRecon.git
RUN		apt-get -y install \
		wordlists \
		hydra
RUN		git clone https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite.git /usr/share/privesc

ADD https://raw.githubusercontent.com/ParrotSec/parrot-core/master/parrot-core/root/.bashrc /root/.bashrc

ENTRYPOINT bash $@
