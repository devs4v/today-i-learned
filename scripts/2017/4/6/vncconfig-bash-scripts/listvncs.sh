#! /bin/bash
for DISPLAYNUM in {1..9}
do
	DISPLAYNAME=$(vncconfig -display :$DISPLAYNUM -get desktop 2>/dev/null) # ignore any errors and just print blank on stdout

	# treat display 5 specially as shared one
	if [ "$DISPLAYNUM" = "5" ]
	then	
		DISPLAYNUM="sh"
	fi
	
	if [ "$DISPLAYNAME" = "" ]  # did it error out?
	then
		echo -e "vnc$DISPLAYNUM&\t: <?>"
	else
		echo -e "vnc$DISPLAYNUM&\t: $DISPLAYNAME"
	fi
done
