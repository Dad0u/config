#!/bin/sh
# Pathogen is not necessary anymore!
mkdir -p ~/.vim/pack/plugins/start
cd ~/.vim/pack/plugins/start

# ALE
git clone --depth 1 https://github.com/dense-analysis/ale.git
# Slime
git clone https://github.com/jpalardy/vim-slime.git
