FROM parrotsec/core:latest
MAINTAINER suntzu (suntzu@theartofwar.org)
ENV DEBIAN_FRONTEND noninteractive

# Install components

RUN		echo "deb http://kartolo.sby.datautama.net.id/parrot/ rolling main contrib non-free\ndeb http://kartolo.sby.datautama.net.id/parrot/ rolling-security main contrib non-free" >> /etc/apt/sources.list.d/z-indo.list
RUN		sed -i 's/https:\/\/deb.parrot.sh/http:\/\/mirror.0x.sg/g' /etc/apt/sources.list.d/parrot.list 
RUN		apt-get update; apt-get -y dist-upgrade
RUN		apt-get -y install \
		curl \
		dirb \
		dirbuster \
		enum4linux \
		exploitdb \
		ftp \
		ffuf \
		gcc-10-multilib \
		gdb \
		gobuster \
		hashcat \
		hydra \
		ipcalc \
		impacket-scripts \
		lynx \
		man \
		metasploit-framework \
		mtr-tiny \
		nbtscan \
		netcat \
		net-tools \
		nfs-common \
		nikto \
		nmap \
		onesixtyone \
		openvpn \
		oscanner \
		postgresql \
		python3-pip \
		radare2 \
		responder \
		smbclient \
		smbmap \
		smtp-user-enum \
		socat \
		sslscan \
		sqlmap \
		squid \
		tmux \
		tnscmd10g \
		vim \
		webshells \
		wfuzz \
		whatweb \
		wordlists 
RUN		apt-get -y autoremove
RUN		python3 -m pip install git+https://github.com/Tib3rius/AutoRecon.git
RUN		git clone --depth 1 https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite.git /usr/share/privesc
RUN		git clone --depth 1 https://github.com/danielmiessler/SecLists.git /usr/share/SecLists
RUN		sed -i 's/#http/http/' /etc/squid/conf.d/debian.conf
RUN		sed -i 's/^\#.*$//g' /usr/share/SecLists/Discovery/Web-Content/directory-list-*.txt && sed -i  '/^$/d' /usr/share/SecLists/Discovery/Web-Content/directory-list-*.txt
RUN		curl -L https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_linux_amd64 -o /usr/bin/kerbrute && chmod a+x /usr/bin/kerbrute
RUN		gem install evil-winrm
ADD		https://raw.githubusercontent.com/ParrotSec/parrot-core/master/parrot-core/root/.bashrc /root/.bashrc

ENTRYPOINT bash $@

