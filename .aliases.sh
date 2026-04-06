#!/bin/bash

alias MIT="reuse download MIT -o LICENSE"
alias tmux="tmux new-session $(which zsh)"
alias python="python3"
alias bat="batcat"
alias batc="batcat -pp ${@}"
alias codeweb="code serve-web --port 2323 --connection-token $(cat /proc/sys/kernel/random/uuid) --verbose"
alias burp="$HOME/burp-suite/BurpSuiteCommunity"
alias reboot="sudo reboot"
alias shutdown="sudo shutdown now"
alias pom="pomodoro -focus=30m -relax=10m"
alias uuid="cat /proc/sys/kernel/random/uuid"

# git
alias gc="git commit -m ${@}"
alias ga="git add ."
alias gp="git push origin main"
