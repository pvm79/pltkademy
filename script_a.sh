#!/bin/bash
#Script for changing server name in 100 conf file on server in one folder.

# Variables
#old server name
server_name_old=nginx-001.com
#new server name
server_name_new=nginx-002.com 
# q-ty of iteration
q=100
c=0
#searching folder 
fold=/home/rtt/pltkademy/test/test

	for file in $(ls -A $fold/*.conf);do
		if [ -n "$(grep $server_name_old $file)" ] && [ "$c" -lt "$q" ]; then 
			sed -i "s/${server_name_old}/${server_name_new}/" $file
			c=$(( $c + 1 ))
		fi
			
	done
echo "Script compleated. $c configuration files changed."
