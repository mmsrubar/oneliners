# Search for MS-* vulnerabilites using NSE scripts and nmap
nmap --script smb-vuln-ms* -sV -v -p445 -Pn 10.10.69.177
