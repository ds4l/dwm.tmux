#!/bin/sh

window_panes=
killlast=
mfact=
window_index=
pane_index=

newpane() {
  tmux \
    split-window -t :.0\; \
    swap-pane -s :.0 -t :.1\; \
    select-layout main-vertical\; \
    resize-pane -t :.0 -x ${mfact}%
}

newpanecurdir() {
  tmux \
    split-window -t :.0 -c "#{pane_current_path}"\; \
    swap-pane -s :.0 -t :.1\; \
    select-layout main-vertical\; \
    resize-pane -t :.0 -x ${mfact}%
}

killpane() {
  if [ $window_panes -gt 1 ]; then
    tmux kill-pane -t :.\; \
         select-layout main-vertical\; \
         resize-pane -t :.0 -x ${mfact}%
  else
    if [ $killlast -ne 0 ]; then
      tmux kill-window
    fi
  fi
}

nextpane() {
  tmux select-pane -t :.+
}

prevpane() {
  tmux select-pane -t :.-
}

movepane() {
  window=$1
  if tmux has-session -t ":${window}"; then
    tmux join-pane -t ":${window}"
    layouttile
    # back to previous window
    tmux selectw -t "${window_index}" && layouttile || true
  else
    tmux break-pane -t ":${window}" -d && layouttile || true
  fi
}

rotateccw() {
  tmux rotate-window -U\; select-pane -t 0
}

rotatecw() {
  tmux rotate-window -D\; select-pane -t 0
}

zoom() {
  if [ $pane_index -eq 0 ]; then
    tmux swap-pane -s :. -t :.1\; select-pane -t :.0
  else
    tmux swap-pane -s :. -t :.0\; select-pane -t :.0
  fi
}

layouttile() {
  tmux select-layout main-vertical\; resize-pane -t :.0 -x ${mfact}%
}

float() {
  tmux resize-pane -Z
}

incmfact() {
  fact=$((mfact + 5))
  if [ $fact -le 95 ]; then
    tmux \
      setenv mfact $fact\; \
      resize-pane -t :.0 -x ${fact}%
  fi
}

decmfact() {
  fact=$((mfact - 5))
  if [ $fact -ge 5 ]; then
    tmux \
      setenv mfact $fact\; \
      resize-pane -t :.0 -x ${fact}%
  fi
}

window() {
  window=$1
  tmux selectw -t $window || tmux new-window -t $window
}

if [ $# -lt 1 ]; then
  echo "dwm.tmux.sh [command]"
  exit
fi

command=$1;shift
args=$*
set -- $(tmux display -p "#{window_panes} #{killlast} #{mfact} #{window_index} #{pane_index}")
window_panes=$1
killlast=$2
mfact=$3
window_index=$4
pane_index=$5

case $command in
  newpane) newpane;;
  newpanecurdir) newpanecurdir;;
  killpane) killpane;;
  nextpane) nextpane;;
  prevpane) prevpane;;
  movepane) movepane $args;;
  rotateccw) rotateccw;;
  rotatecw) rotatecw;;
  zoom) zoom;;
  layouttile) layouttile;;
  float) float;;
  incmfact) incmfact;;
  decmfact) decmfact;;
  window) window $args;;
  *) echo "unknown command"; exit 1;;
esac
