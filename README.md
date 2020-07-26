# Kali-up
This is a quick and dirty bootstrap script for Kali Linux. Found myself using a lot of supplmental 
tools for CTF and labs. There are some great utilities like Impacket that are not included by default.

The packages fall under the following categories:

### Additional apt repo packages:
* Go - Great cross platform language. Prepares GOPATH etc. so you're good to go.
* Crackmapexec - swiss army knife pentesting tool. great for PTH across a subnet
* Gobuster - fast go-based web server directory bruteforcing tool
* BloodHound - amazing Active Directory recon and privesc suggestions
* Shellter - AV evasion
* Veil - tool to generate metasploit payloads that bypass AV
* Fuff - web application fuzzing tool written in go
* Nixnote - Evernote compatible note taking app
* Remmina - RDP client
* Proxychains - amazingly powerful proxy software with SOCKS support
* Rinetd - tcp port redirection tool
* Mingw-64 - prepare Kali for compiling x86 and x64 Windows binaries
* Beef - browser enumeration and exploitation framework
* Terminator - powerful tiling terminal


### Static Binaries (payloads/tools you can drop on the target machine that need no additional libs) found at /opt/win/ 32|64 and nix/32|64)
* Kerbrute - kerberos bruteforcing utility
* PS Tools - Sysinternals toolset for things like remote exec'ing and dumping processes
* GhostPack - collection of C# tools pw dumping, privesc, vulnerability identification
* Impacket - statically compiled collection of impacket example tools (win/nix)
* Go-Windapsearch - Ropnop's awesome ldap search tool. Way easier to use than ldapsearch

### Git pulls of various scripts etc to /opt:

* Impacket - python library for working with Microsoft services, collection of really powerful example scripts to help in pentesting.
* Burp wordlists - a great collection of Burp fuzzing wordlists
* Evil-WinRM - Windows Remote Management shell utility with lots of powerful features. Great for privesc
* Dirsearch.py - a great directory busting tool, with recursion and file extension checking
* PowerSploit - Really useful powershell library for doing reconnaisance and general swiss army knife for AD Domains
* Bloodhound - Same as desc above, but contains the source and collection scripts/binaries
* Nikto 2 - web vulnerability scanning software
* Windows Privesc Check - nice comprehensive privesc tool
* Windows Exploit Suggester NG - import systeminfo from windows box, suggest vulns
* Windows Exploits - nice collection of Win CVE PoC
* Privilege Escalation Awesome Scripts - some of the best privesc script for both win/linux
* PowerSploit - vast collection of powershell tools
* Powerless - Windows privesc tool
* Payload All the Things - vast resource of links, one-liners and enumeration techniques
* Pspy - a tool that view background processes such as root cron jobs and what those processes are doing
* Seclists - huge collection of wordlists and tools
* Linux Smart Enumeration - linux privesc tool
* Linenum - linux privesc tool
* Reconnoitre - Fast vuln scanning with mutli-threading
* Interlace - Automation framework
* Fingerprint2 JS - browser fingerprinting javascript
* BC Sec Empire - classic C2, latest update from Github
* Covenant - awsome C# c2

Tested on 2020.1 and 2019.4.
