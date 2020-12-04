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
		nfs-common \
		man
RUN		apt-get -y install \
		metasploit-framework \
		postgresql \
		dirbuster \
		gobuster \
		enum4linux \
		exploitdb \
		dirb \
		openvpn \
		wordlists \
		webshells \
		hydra \
		tmux
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
RUN 	apt-get -y autoremove
RUN		python3 -m pip install git+https://github.com/Tib3rius/AutoRecon.git
RUN		git clone https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite.git /usr/share/privesc
RUN 	git clone https://github.com/danielmiessler/SecLists.git /usr/share/SecLists
ADD https://raw.githubusercontent.com/ParrotSec/parrot-core/master/parrot-core/root/.bashrc /root/.bashrc

ENTRYPOINT bash $@
