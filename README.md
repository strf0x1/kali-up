### Kali-up
This is a quick and dirty bootstrap script for Kali Linux. Found myself using a lot of supplmental 
tools for CTF and labs. There are some great utilities like Impacket that are not included by default.

The packages fall under the following categories:

# Additional apt repo packages:
Crackmapexec - swiss army knife pentesting tool. great for PTH across a subnet
Gobuster - fast go-based web server directory bruteforcing tool
BloodHound - amazing Active Directory recon and privesc suggestions

# Static Binaries (payloads/tools you can drop on the target machine that need no additional libs)
/opt/binaries (win32/64 and nix32/64)
Kerbrute - kerberos bruteforcing utility
PS Tools - Sysinternals toolset for things like remote exec'ing and dumping processes
GhostPack - collection of C# tools pw dumping, privesc, vulnerability identification
Impacket - statically compiled collection of impacket example tools (win/nix)

# Git pulls of various scripts etc to /opt:

Impacket - python library for working with Microsoft services, collection of really powerful
example scripts to help in pentesting.
Evil-WinRM - Windows Remote Management shell utility with lots of powerful features. Great for privesc
PowerSploit - Really useful powershell library for doing reconnaisance and general swiss army knife for AD Domains
Bloodhound - Same as desc above, but contains the source and collection scripts/binaries

Tested on 2020.1 and 2019.4.
