#!/bin/bash
# Ugly Kali Supplemental Bootstrapping Script
# Tested on latest Kali 2020.1b Release

# DO APT INSTALLS
# ----------------------------------------------------------
# upgrade used to be really broken, seems a better now in 2020.3 image
apt update && apt upgrade -y

# install pip for both python versions
apt install python-pip python3-pip -y

# pip install impacket
pip install impacket --yes
pip3 install impacket --yes

# Nixnote2 - nice note taking software w/ screenshots works with evernote
apt install nixnote2 -y

# Remmina RDP
apt install remmina -y

# Proxychains
apt install proxychains -y

# rinetd
apt install rinetd -y

# Shellter
apt install shellter -y

# B33f
apt install beef-xss -y

# Terminator term
apt install terminator -y

# Update Metasploit and make db up by default and start
apt install metasploit-framework -y
systemctl enable postgresql
systemctl start postgresql
msfdb init

# Update nmap to latest
apt install nmap -y

# Install Crackmapexec
apt install crackmapexec -y

# Install Gobuster
apt install gobuster -y

# Install BloodHound
apt install bloodhound -y

# Install Veil Framework
# Post install run veil and type y to complete
apt install veil -y

# install missing deps for Empire
apt install m2crypto swig -y

# Install Docker
apt install docker -y

# Install Go Lang and conf $GOPATH
apt install golang -y
mkdir -p /root/go/src
echo 'GOPATH=/root/go' >> /root/.bashrc

# FFUF
go get github.com/ffuf/ffuf
cp $GOPATH/bin/ffuf /usr/bin/

# STATIC BINS Win/Linux (payloads/tools for targets)
# ----------------------------------------------------------
# create directories for storing the bins
mkdir /opt/win
mkdir /opt/win/32
mkdir /opt/win/64
mkdir /opt/linux
mkdir /opt/linux/32
mkdir /opt/linux/64
# ----------------------------------------------------------
cd /opt

# Kerbrute
wget https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_linux_amd64
mv kerbrute_linux_amd64 /usr/bin/kerbrute

# get pstools from ms and sort the bins into respective dirs
mkdir tmp
cd tmp/
wget https://download.sysinternals.com/files/PSTools.zip
unzip PSTools.zip
# this is ugly, i know, but it works
for f in ./*64.exe; do if grep -l '64' "$f"; then mv "$f" /opt/win/64; fi; done
mv *.exe /opt/win/32

# Ghostpack
git clone https://github.com/r3motecontrol/Ghostpack-CompiledBinaries.git
cd Ghostpack-CompiledBinaries/
mv *.exe /opt/win/64/
cd ../
rm -rf Ghostpack-CompiledBinaries/

# get impacket, mimikatz and other misc. bins
# win
cd /opt/binaries/win/64/

# impacket
wget https://github.com/ropnop/impacket_static_binaries/releases/download/0.9.20-binaries/impacket_windows_binaries.zip
unzip impacket_windows_binaries.zip
cd dist
mv *.* ../
cd ../
rm -rf dist/
rm impacket_windows_binaries.zip
wget https://github.com/ropnop/impacket_static_binaries/releases/download/0.9.20-binaries/mimikatz_windows.exe
wget https://github.com/ropnop/impacket_static_binaries/releases/download/0.9.20-binaries/sniffer_windows.exe
wget https://github.com/ropnop/impacket_static_binaries/releases/download/0.9.20-binaries/sniff_windows.exe

# linux
cd /opt/linux/64/
wget https://github.com/ropnop/impacket_static_binaries/releases/download/0.9.20-binaries/impacket_linux_binaries.tar.gz
tar zxfv impacket_linux_binaries.tar.gz
rm impacket_linux_binaries.tar.gz
# cleanup tmp
rm -rf /opt/tmp/

# cleanup tmp
cd ../
rm -rf tmp/

# SUPPLEMENTAL SCRIPTS/TOOLS TO OPT
# ----------------------------------------------------------
cd /opt
# ----------------------------------------------------------
# Install Impacket and deps, then configure
git clone https://github.com/SecureAuthCorp/impacket.git
cd /opt/impacket
apt install python3-pip -y
pip3 install .
cd /opt

# Install Evil-WinRM
git clone https://github.com/Hackplayers/evil-winrm.git

# Powersploit
git clone https://github.com/PowerShellMafia/PowerSploit.git

# BloodHound Ingestors and Source
git clone https://github.com/BloodHoundAD/BloodHound.git

# windapsearch  - new go version
https://github.com/ropnop/go-windapsearch.git

# p0wny shell
git clone https://github.com/flozz/p0wny-shell.git

# AutoRecon
git clone https://github.com/Tib3rius/AutoRecon.git

# Arjun
git clone https://github.com/s0md3v/Arjun.git

# Nikto2 latest
git clone https://github.com/sullo/nikto.git

# Windows Exploits (precompiled)
git clone https://github.com/abatchy17/WindowsExploits.git

# SecLists
git clone https://github.com/danielmiessler/SecLists.git

# awesome burp wordlists
git clone https://github.com/SilverPoision/a-full-list-of-wordlists.git

# Powerless
git clone https://github.com/M4ximuss/Powerless.git

# Payload All The Things
git clone https://github.com/swisskyrepo/PayloadsAllTheThings.git

# windows privesc check
git clone https://github.com/pentestmonkey/windows-privesc-check.git

# Windows Exploit Suggester Next Generation
git clone https://github.com/bitsadmin/wesng.git

# Privilege Escalation Awesome Scripts
git clone https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite.git

# enum4linux
git clone https://labs.portcullis.co.uk/tools/enum4linux/

# unix privesc check
wget http://pentestmonkey.net/tools/unix-privesc-check/unix-privesc-check-1.4.tar.gz
tar zxfv unix-privesc-check-1.4.tar.gz

# Linux smart enumeration
git clone https://github.com/diego-treitos/linux-smart-enumeration.git

# dirsearch
git clone https://github.com/maurosoria/dirsearch.git

# Linenum
git clone https://github.com/rebootuser/LinEnum.git

# Linux priv checker
git clone https://github.com/sleventyeleven/linuxprivchecker.git

# Linux exploit suggester 2 NG
https://github.com/jondonas/linux-exploit-suggester-2

# windows kernel exploits
git clone https://github.com/egre55/windows-kernel-exploits.git

# PEAS Suite 
git clone https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite.git

# Reconnoitre
git clone https://github.com/codingo/Reconnoitre.git

# SUID3NUM
git clone https://github.com/Anon-Exploiter/SUID3NUM

# Pspy
git clone https://github.com/DominicBreuker/pspy.git

# Fingerprint2 JS
git clone https://github.com/Valve/fingerprintjs2.git

# Interlace
git clone https://github.com/codingo/Interlace.git

# BC Sec Empire
git clone https://github.com/BC-SECURITY/Empire.git
pip2 install pefile --yes

# g0x0dvibes kali lootbox
git clone https://github.com/g0x0dvibes/kali-lootbox.git

# Covenant
git clone --recurse-submodules https://github.com/cobbr/Covenant
wget -q https://packages.microsoft.com/config/ubuntu/19.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
apt-get update -y
apt-get install apt-transport-https -y
apt-get update -y
apt-get install dotnet-sdk-2.2 -y
cd Covenant/Covenant
dotnet build
echo '#!/bin/bash' > covenant
echo 'cd /opt/Covenant/Covenant' >> covenant
echo 'dotnet run > /dev/null 2>&1 &' >> covenant
echo 'echo "Starting Covenant..."' >> covenant
echo 'sleep 15' >> covenant
echo 'sudo -u brandon firefox-esr https://0.0.0.0:7443' >> covenant
chmod +x covenant
mv covenant /usr/bin

# fixes
# Fix for x86 Mingw-64
dpkg --add-architecture i386 && apt-get update 
apt-get install wine32 -y


#Post install tasks

echo "[*] Installation complete... There are a few post-install tasks that must be done manually."
echo "[*] 1. Run Veil, then follow prompts for setup. There may be an error, if so run once more. When complete it will complain it can't find AutoIT."
echo "Just: mv /var/lib/veil/wine/drive_c/Program\ Files\ \(x86\)/AutoIt3/ /var/lib/veil/wine/drive_c/Program\ Files/"
echo "[*] 2. To setup Empire, go to /opt/Empire/setup and run setup_database.py, the install script"
echo "[*] 3. To configure Bloodhound, type: neo4j console (then nav to the url it gives, set a password)"
