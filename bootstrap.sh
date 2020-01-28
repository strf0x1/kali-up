#!/bin/bash
# Ugly Kali Supplemental Bootstrapping Script
# Tested on latest Kali 2020.1 Release

# DO MISSING APT INSTALLS
# ----------------------------------------------------------

cd /opt/
# Install Crackmapexec
apt install crackmapexec -y

# Install Gobuster
apt install gobuster -y

# Install BloodHound
apt install bloodhound -y

# INSTALL STATIC BINS Win/Linux (payloads/tools for targets)
# ----------------------------------------------------------
# create directories for storing the bins
mkdir /opt/win
mkdir /opt/win/32
mkdir /opt/win/64
mkdir /opt/linux
mkdir /opt/linux/32
mkdir /opt/linux/64
# ----------------------------------------------------------
# Kerbrute
wget https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_linux_amd64
mv kerbrute_linux_amd64 /usr/bin/kerbrute

# get pstools from ms and sort the bins into respective dirs
mkdir tmp
cd tmp/
wget https://download.sysinternals.com/files/PSTools.zip
unzip PSTools.zip
# this is ugly, i know, but it works
for f in ./*64.exe; do if grep -l '64' "$f"; then mv "$f" ../win/64; fi; done
mv *.exe ../win/32

# Ghostpack
git clone https://github.com/r3motecontrol/Ghostpack-CompiledBinaries.git
cd Ghostpack-CompiledBinaries/
mv *.exe /opt/binaries/win/64/
cd ../
rm -rf Ghostpack-CompiledBinaries/

# get impacket, mimikatz and other misc. bins
# win
cd win/64/
# impacket
wget https://github.com/ropnop/impacket_static_binaries/releases/download/0.9.20-binaries/impacket_windows_binaries.zip
mv dist/* .
rm -rf dist/
rm impacket_windows_binaries.zip

wget https://github.com/ropnop/impacket_static_binaries/releases/download/0.9.20-binaries/mimikatz_windows.exe
wget https://github.com/ropnop/impacket_static_binaries/releases/download/0.9.20-binaries/sniffer_windows.exe
wget https://github.com/ropnop/impacket_static_binaries/releases/download/0.9.20-binaries/sniff_windows.exe
unzip impacket_windows_binaries.zip

# linux
cd ../../linux/64/
wget https://github.com/ropnop/impacket_static_binaries/releases/download/0.9.20-binaries/impacket_linux_binaries.tar.gz
tar zxfv impacket_linux_binaries.tar.gz
cd impacket_linux_binaries

# cleanup tmp
cd ../
rm -rf tmp/

# INSTALL SUPPLEMENTAL SCRIPTS/TOOLS TO OPT
cd /opt/

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