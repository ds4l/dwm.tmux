setenv -g tmuxdwm_version 0.1.0
setenv -g killlast 0 # Toggle killing last pane
setenv -g mfact 50   # Main pane area factor

set -g command-alias[100] newpane='run-shell "dwm.tmux newpane"'
set -g command-alias[101] newpanecurdir='run-shell "dwm.tmux newpanecurdir"'
set -g command-alias[102] killpane='run-shell "dwm.tmux killpane"'
set -g command-alias[103] nextpane='run-shell "dwm.tmux nextpane"'
set -g command-alias[104] prevpane='run-shell "dwm.tmux prevpane"'
set -g command-alias[105] rotateccw='run-shell "dwm.tmux rotateccw"'
set -g command-alias[106] rotatecw='run-shell "dwm.tmux rotatecw"'
set -g command-alias[107] zoom='run-shell "dwm.tmux zoom"'
set -g command-alias[108] layouttile='run-shell "dwm.tmux layouttile"'
set -g command-alias[109] float='run-shell "dwm.tmux float"'
set -g command-alias[110] incmfact='run-shell "dwm.tmux incmfact"'
set -g command-alias[111] decmfact='run-shell "dwm.tmux decmfact"'
set -g command-alias[112] window0='run-shell "dwm.tmux window 0"'
set -g command-alias[113] window1='run-shell "dwm.tmux window 1"'
set -g command-alias[114] window2='run-shell "dwm.tmux window 2"'
set -g command-alias[115] window3='run-shell "dwm.tmux window 3"'
set -g command-alias[116] window4='run-shell "dwm.tmux window 4"'
set -g command-alias[117] window5='run-shell "dwm.tmux window 5"'
set -g command-alias[118] window6='run-shell "dwm.tmux window 6"'
set -g command-alias[119] window7='run-shell "dwm.tmux window 7"'
set -g command-alias[120] window8='run-shell "dwm.tmux window 8"'
set -g command-alias[121] window9='run-shell "dwm.tmux window 9"'
set -g command-alias[122] movepane0='run-shell "dwm.tmux movepane 0"'
set -g command-alias[123] movepane1='run-shell "dwm.tmux movepane 1"'
set -g command-alias[124] movepane2='run-shell "dwm.tmux movepane 2"'
set -g command-alias[125] movepane3='run-shell "dwm.tmux movepane 3"'
set -g command-alias[126] movepane4='run-shell "dwm.tmux movepane 4"'
set -g command-alias[127] movepane5='run-shell "dwm.tmux movepane 5"'
set -g command-alias[128] movepane6='run-shell "dwm.tmux movepane 6"'
set -g command-alias[129] movepane7='run-shell "dwm.tmux movepane 7"'
set -g command-alias[130] movepane8='run-shell "dwm.tmux movepane 8"'
set -g command-alias[131] movepane9='run-shell "dwm.tmux movepane 9"'

set-hook -g pane-exited 'run-shell "dwm.tmux layouttile"'

bind -n M-Enter newpane
bind -n M-w newpanecurdir
# bind -n M-c killpane
bind -n M-j nextpane
bind -n M-k prevpane
bind -n M-< rotateccw
bind -n M-> rotatecw
bind -n M-Space zoom
bind -n M-t layouttile
bind -n M-f float
bind -n M-h decmfact
bind -n M-l incmfact
bind -n M-0 window0
bind -n M-1 window1
bind -n M-2 window2
bind -n M-3 window3
bind -n M-4 window4
bind -n M-5 window5
bind -n M-6 window6
bind -n M-7 window7
bind -n M-8 window8
bind -n M-9 window9
bind M-0 movepane0
bind M-1 movepane1
bind M-2 movepane2
bind M-3 movepane3
bind M-4 movepane4
bind M-5 movepane5
bind M-6 movepane6
bind M-7 movepane7
bind M-8 movepane8
bind M-9 movepane9
