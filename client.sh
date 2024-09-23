#!/bin/bash

id=$1

if [ "$#" -ne 1 ]; then
	echo "nok: no identifier provided"
	exit 1
fi



while true; do

	read -p "Enter your request (or 'exit to quit'): " request
	
	if [ "$request" == "exit" ]; then
		exit 0
	fi
	
	echo "$id" "$request" "$args" "$wall_message" > ./"server"_pipe
	./server.sh
	
	message=$( < "$id"_pipe)	
	
	case "$message" in
				"ok user created") echo "SUCCESS: user created";;
				"nok: user already exists") echo "ERROR: user already exists";;
				"nok: user does not exist") echo "ERROR: user does not exist";;
				"nok: no identifier provided") echo "ERROR no identifier provided";;
				"ok: friend added!") echo "SUCCESS: friend added";;
				"ok: message posted") echo "SUCCESS: message posted";;
				"nok: you are already friends with this user") echo "ERROR already friends";;
				"start_of_file"*"end_of_file") new_message="${message/start_of_file/}" newer_message="${new_message/end_of_file/}"  
				echo "$newer_message";;
	*) echo "Unknown response from server : $message";;
	esac
	
done
