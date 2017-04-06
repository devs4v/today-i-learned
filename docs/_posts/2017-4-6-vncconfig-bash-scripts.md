# VNCConfig and Bash scripts

So I usually work on separate vnc sessions in order to isolate the work that I do under different themes.
That becomes tedious sometimes since you have so many sessions running because you don't want to lose the status of the task in each of the windows. Hence, I end up creating more and more sessions. Now that also becomes an issue when you see that the number of sessions is too much.

At the beginning I did start to keep track through a text file, but that didn't scale much since it uses a text editor window everytime to do that, and if there's something that I open up in addition to that, then the vnc assignment file just doesn't match up properly.

So I used a sticky note app. Did work for some time, but then I got tired of that too.

So I turned to look for what could give me a proper kind of output with minimal overhead. I'm all up for to do lists, but then this goes back to something similar to maintaining the text file.

Hence the solution should have to do something with the VNC instances themselves.

I got to know that there's a command called `vncconfig` that does that. The command is pretty simple:

vncconfig -display <displaynumber> -get desktop

The above returns the name of the VNC session which you can set through -name option while starting up the vnc session.

I also figured that vncconfig can even let you set the name dynamically. This was like a charm to me. Yes yes! I would like to be able to set the name of the vnc session just to make sure that I am using the right vnc session for the task at hand and when I am done with that task, I don't have to just do away with the vnc session completely and make a new one with the -name switch.

The command is:

vncconfig -display <displaynumber> -set desktop <sessionname>

This was just awesome.

Tied it up with a bash script and an alias for the bash script and we are up for the fun.

So now I do:
vncls                   # shows me the list of VNC sessions with their names
vncset 1 integration    # sets the vnc name of display 1 to "integration"
vncfree 1				# sets the vnc name of display 1 to "[]" which signifies it is free of any tasks. I have a separate vnckill command to shutdown the vncserver.

The scripts are in the folder /scripts/2017/4/6/vncconfig-bash-scripts/ folder in this repo.

That's enough for today! :P

Shivam
