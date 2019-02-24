#!/bin/sh -ex

###
## install packages via Homebrew
## require MacOS or Linux
###

# install packages
brew install git wget curl gron parallel                             ## utils
brew install vim && curl -sLf https://spacevim.org/install.sh | bash ## editor
brew install fish tmux && curl -L https://get.oh-my.fish | fish      ## shell

trap "echo 'packages were installed'" 0
