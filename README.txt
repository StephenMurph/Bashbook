CT213 Assignment - How to run scripts


bash create.sh $id
- Where $id is the name of the user and their directory.
Example: bash create.sh Conor


bash add_friend $id $friend
- $id will have $friend added to their friends.txt file.
Example: bash add_friend Conor Stephen


bash post_messages.sh $id $rec_id $wall_message
- The $receiver will have a $message added to their wall.txt by the $sender. 
- In order to account for messages with more than one word in them, $message should be written in quotation marks.
Example: bash post_messages.sh Conor Stephen "How are you?"


bash.display_wall.sh $id $requester
- The contents of the wall.txt belonging to the user $id is printed. It will be sent through the $requester's pipe.
Example: bash display_wall.sh Conor Stephen


bash server.sh
- Command can no longer be run from this script. client.sh has taken its place for that purpose.

bash client.sh $id

- $id will be the user accessing BashBook.

client.sh runs scripts through server.sh. Thus, it will use the same keywords, but the arguments are slightly different.
create - N/A, since a user needs to already exist to access client.sh it wouldn't make sense to be here.
add $friend - $id is added to $friend's friends.txt file.
post $args $other - $other is added to $args's wall.txt file.
display $args - $args' wall file will be printed.
