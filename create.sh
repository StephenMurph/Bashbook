#/bin/bash

if [ "$#" -ne 1 ]; then 
		echo "nok no identifier provided" #error if no identifier
		exit 1
fi

id=$1
./acquire.sh "$id" "$id"lock

if [ -e "$id" ]; then  
		echo "nok: user already exists" > "$id"_pipe #error if already friends sent to user pipe
		./release.sh "$id"lock
		exit 1
fi

mkdir "$id" #creates user directory

touch $id/friends #creates friends file
touch $id/wall #creates wall file

echo "ok user created"  > "$id"_pipe #user created message sent to user pipe
echo "$id" >> "$id/friends"
./release.sh "$id"lock
