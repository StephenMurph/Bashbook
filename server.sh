#!/bin/bash

create_user() {
local id=$1
./create.sh $id
echo "ok user created"  > "$id"_pipe #user created message sent to user pipe
}

add_friend() {
local id=$1
local friend=$2
./add_friend.sh $id $friend
}

post_messages() {
local id=$1
local friend=$2
local wall_message="$3"
./post_messages.sh $id $friend "$wall_message"
}

display_wall() {
local id=$1
local requester=$2
./display_wall.sh $id $requester
}

	read id request args "wall_message" < "server"_pipe #server reads variables and arguments from server pipe
	case "$request" in
		"create")
			create_user $id $args
			;;
		"add")
			add_friend $id $args
			;;
		"post")
			post_messages $id $args "$wall_message"
			;;
		"display")
			display_wall $args $id 
			;;
		*)
			echo "nok: bad request"
	esac
			
