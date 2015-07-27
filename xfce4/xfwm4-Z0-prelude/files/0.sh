#!/bin/bash

alias ln='ln -sfv'

echo ""
echo "buttons"
ln 0button-active.xpm close-active.xpm
ln 0button-active.xpm hide-active.xpm
ln 0button-active.xpm maximize-active.xpm
ln 0button-active.xpm close-inactive.xpm
ln 0button-active.xpm hide-inactive.xpm
ln 0button-active.xpm maximize-inactive.xpm


echo ""
echo "stick"
ln 0button-active.xpm stick-toggled-active.xpm
ln 0button-active.xpm stick-toggled-inactive.xpm

#ln 0button-stick-1.xpm stick-active.xpm
#ln 0button-stick-1.xpm stick-inactive.xpm
ln 0button-null.xpm stick-active.xpm
ln 0button-null.xpm stick-inactive.xpm


echo ""
echo "window"
[ ! -f "0window-lr.xpm" ] && echo "not found" && exit 1
ln 0window-lr.xpm left-active.xpm 
ln 0window-lr.xpm left-inactive.xpm 
ln 0window-lr.xpm right-inactive.xpm 
ln 0window-lr.xpm right-active.xpm 


echo ""
echo "title"
ln 0title.xpm title-1-active.xpm
ln 0title.xpm title-2-active.xpm
ln 0title.xpm title-3-active.xpm
ln 0title.xpm title-4-active.xpm
ln 0title.xpm title-5-active.xpm
ln 0title.xpm title-1-inactive.xpm
ln 0title.xpm title-2-inactive.xpm
ln 0title.xpm title-3-inactive.xpm
ln 0title.xpm title-4-inactive.xpm
ln 0title.xpm title-5-inactive.xpm

echo ""

