#!/bin/sh

# usage:
#----------------------------------------------------------------
# ./customLog.sh filename directory delay width height
#----------------------------------------------------------------

# init defaults

defaultFILENAME="log-"$(date +%s)".jpg" # filename cam12345678.jpg
defaultDIR="/home/pi/logs"

#----------------------------------------------------------------

# echo $0 #name of the script
# echo $1 #parameter 1
# echo $2 #parameter 2
# echo $3 #parameter 3
# echo $4 #parameter 4

# filename parameter
if [ -z "$1" ]
then
	FILE=$defaultFILENAME
else
	FILE=$1
fi

# directory parameter
if [ -z "$2" ]
then
	DIR=$defaultDIR
else
	DIR=$2
fi

# delay parameter
if [ -z "$3" ]
then
	DELAY=$defaultDELAY
else
	DELAY=$3
fi

# width parameter
if [ -z "$4" ]
then
	WIDTH=$defaultWIDTH
else
	WIDTH=$4
fi

# height parameter
if [ -z "$5" ]
then
	HEIGHT=$defaultHEIGHT
else
	HEIGHT=$5
fi


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

raspistill -o $DIR/$FILE -t 1000 -w 1920 -h 1080

# check if file is created
if [ -f "$DIR/$FILE" ]
then
	echo "Picture succesfully taken"
	echo "Please check the $DIR folder, picture: $FILE"
else
	echo "ERROR:"	
	echo "Picture could not be taken"
fi


