#!/bin/bash

id=$1
friend=$2

if [ ! -d "$id" ]; then
		echo "nok user does not exist" > "$id"_pipe #error if user not found sent to pipe
		exit 1
fi

if [ ! -d "$friend" ]; then
		echo "nok: user does not exist" > "$id"_pipe #error if friend not found sent to pipe
		exit 1
fi

if grep "^$friend" "$id/friends" > /dev/null; then
	echo "nok: you are already friends with this user" > "$id"_pipe #error if already friends sent to pipe
	exit 1
fi
./acquire.sh "$friend"/friends.txt "$friend"friendslock.txt

echo "$friend" >> "$id/friends"
echo "ok: friend added!" > "$id"_pipe #friend created and sent to pipe
	./release.sh "$friend"friendslock.txt
