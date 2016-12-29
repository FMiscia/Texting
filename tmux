#tmux is a terminal multiplexer
tmux

#key binding
ctrl+b [command]

#split top and bottom
ctrl+b "

#split left and right
ctrl+b %

#move between panels
ctrl+b arrow

#kill the current panel
ctrl+b x

#show the time
ctrl+b t

#create new window
ctrl+b c

#kill the current window
ctrl+b &

#resize 
#in order to use ctrl+arrow on mac go to pref->keyboard->add 
#key=arrow
#modifier=^Ctrl
#press Esc so it appears \033 then add [1;5 followed by:
#A for UP
#B for DOWN
#C for RIGHT
#D for LEFT
ctrl-b ctrl+arrow

#rename session
ctrl+b $

#open a previous session
tmux a
