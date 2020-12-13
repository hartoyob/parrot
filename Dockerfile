FROM parrotsec/core:latest
MAINTAINER suntzu (suntzu@theartofwar.org)
ENV DEBIAN_FRONTEND noninteractive

# Install components

RUN		sed -i 's/deb.parrot.sh/mirror.0x.sg/g' /etc/apt/sources.list.d/parrot.list 

RUN		apt-get update; apt-get -y dist-upgrade
RUN		apt-get -y install \
		curl \
		dirb \
		dirbuster \
		enum4linux \
		exploitdb \
		ftp \
		gobuster \
		hydra \
		ipcalc \
		man \
		metasploit-framework \
		mtr-tiny \
		nbtscan \
		netcat \
		nfs-common \
		nikto \
		nmap \
		onesixtyone \
		openvpn \
		oscanner \
		postgresql \
		python3-pip \
		smbclient \
		smbmap \
		smtp-user-enum \
		socat \
		sslscan \
		sqlmap \
		tmux \
		tnscmd10g \
		vim \
		webshells \
		wfuzz \
		whatweb \
		wordlists \
		zaproxy
RUN		apt-get -y autoremove
RUN		python3 -m pip install git+https://github.com/Tib3rius/AutoRecon.git
RUN		git clone --depth 1 https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite.git /usr/share/privesc
RUN		git clone --depth 1 https://github.com/danielmiessler/SecLists.git /usr/share/SecLists

ADD		https://raw.githubusercontent.com/ParrotSec/parrot-core/master/parrot-core/root/.bashrc /root/.bashrc

ENTRYPOINT bash $@
