#!/bin/bash
# Ugly Kali Supplemental Bootstrapping Script
# Tested on latest Kali 2020.1 Release

# DO APT INSTALLS
# ----------------------------------------------------------
# Update apt repos but don't upgrade, bad things happen in PWK Kali
apt update

# Nixnote2 - nice note taking software w/ screenshots works with evernote
apt install nixnote2 -y

# Remmina RDP
apt install remmina -y

# Update Metasploit and make db up by default and start
apt install metasploit-framework -y
systemctl enable postgresql
systemctl start postgresql

# Update nmap to latest
apt install nmap -y

# Install Crackmapexec
apt install crackmapexec -y

# Install Gobuster
apt install gobuster -y

# Install BloodHound
apt install bloodhound -y

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

# AutoRecon
git clone https://github.com/Tib3rius/AutoRecon.git

# Arjun
git clone https://github.com/s0md3v/Arjun.git

# Windows Exploit Suggester
git clone https://github.com/AonCyberLabs/Windows-Exploit-Suggester.git

# Windows Exploits (precompiled)
git clone https://github.com/abatchy17/WindowsExploits.git

# SecLists
git clone https://github.com/danielmiessler/SecLists.git

# Powerless
git clone https://github.com/M4ximuss/Powerless.git

# Linenum
git clone https://github.com/rebootuser/LinEnum.git

# Nikto2 latest
git clone https://github.com/sullo/nikto.git

# Payload All The Things
git clone https://github.com/swisskyrepo/PayloadsAllTheThings.git
