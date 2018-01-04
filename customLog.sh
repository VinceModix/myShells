#!/bin/sh

# usage:
#----------------------------------------------------------------
# ./customLog.sh filename directory delay width height
#----------------------------------------------------------------

# init defaults


DATE=`date +%Y-%m-%d:%H:%M:%S`
UNIX=$(date +%s)
FILE="log-"$DATE.txt" # filename log12345678.txt
DIR="/home/pi/logs" # add 'pwd' command to construct '/home/pi'

#----------------------------------------------------------------

# echo $0 #name of the script
# echo $1 #parameter 1
# echo $2 #parameter 2
# echo $3 #parameter 3
# echo $4 #parameter 4


# check if directory excists
if [ -d "$DIR" ]
then
	echo "$DIR directory  created, continue with picture"
else
	echo "$DIR directory not found..."
	mkdir $DIR
	echo "$DIR directory created..."	
	chmod u=rwx,g=rwx,o=rwx $DIR
	echo "$DIR directory permissions set..."
fi

echo "Custom Loggin File" -> $DIR/$FILE
echo "-------------------------------------------------------------------------" >> $DIR/$FILE
echo "Custom Loggin File" -> $DIR/$FILE
echo "-------------------------------------------------------------------------" >> $DIR/$FILE
echo "Custom Loggin File" -> $DIR/$FILE



chmod u=rwx,g=rwx,o=rwx $DIR

# check if file is created
if [ -f "$DIR/$FILE" ]
then
	echo "Picture succesfully taken"
	echo "Please check the $DIR folder, picture: $FILE"
else
	echo "ERROR:"	
	echo "Picture could not be taken"
fi


# pause the script
sleep 60

#continue logging

IFCONFIG >> $DIR/$FILE
