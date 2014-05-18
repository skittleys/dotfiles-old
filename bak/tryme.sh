#!/bin/bash

for i in ~/dotfiles/bash/*
do 
	j="echo $i | sed 's/.*\/bash\/\(bash[a-z_]\+\)$|\.\1|i'"
	ln -s $i $j
done