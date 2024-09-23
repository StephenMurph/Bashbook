#/bin/bash

id=$1
rec_id=$2 #recipient id
wall_message="$3"

if [ ! -d "$id" ]; then
	echo "nok: user does not exist" > "$id"_pipe #error if user not found sent to pipe
	exit 1
fi

if [ ! -d "$rec_id" ]; then
	echo "nok: user does not exist" > "$id"_pipe #error if recipient not found sent to pipe
	exit 1
fi

if ! grep -q "^$rec_id" "$id/friends" > /dev/null; then
	echo "nok: you are not friends with that user" > "$id"_pipe #error if not friends sent to pipe
	exit 1
fi

./acquire.sh $receiver/wall.txt "$receiver"walllock.txt
echo "$id says: $wall_message" >> "$rec_id/wall" #message sent to recipients wall
echo "ok: message posted" > "$id"_pipe  #success message posted sent to pipe
./release.sh "$receiver"walllock.txt
