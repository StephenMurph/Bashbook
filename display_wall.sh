#/bin/bash

id=$1
requester=$2
if [ ! -d "$id" ]; then
	echo "nok: user does not exist" > "$id"_pipe #error message if user not found sent to pipe
	exit 1
fi

wall="$id/wall"
if [ -f "$wall" ]; then

IFS=''

input="start_of_file
"
mapfile -d '_' -tO "${#input[@]}" input < "$id"/wall
input+=("end_of_file")

for line in "${input[@]}"; do
	echo "${input[*]}" > "$requester"_pipe	# input is printed to the pipe al in one go with line breaks
done
else
	echo "error" > "$id"_pipe #error message sent to pipe
fi
