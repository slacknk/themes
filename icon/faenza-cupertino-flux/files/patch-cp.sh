#!/bin/bash

# Inherits=Faenza-Cupertino,Faenza

# This requires:
# 	faenza-icon-theme-1.3-noarch-1_SBo
# 	kfaenza-icon-theme-0.8.9-noarch-1_SBo
# 	mate-icon-theme-1.8.0-noarch-1_msb
# 	mate-icon-theme-faenza-1.8.0-noarch-1_msb
#	mint-x-icons-1.3.4_git20160422-noarch-3nk

NAME="Faenza-Cupertino-Flux"
DIR="$HOME/.icons"
DIRP="$DIR/$NAME"

set -e



#[ -d $DIRP ] && tar Jfcv $DIR/${NAME}_`date "+%Y%m%d-%H%M%S"`.tar.xz ${DIRP}*

cd $DIR
 #[ -d $DIRP ] && tar Jfcv ${NAME}_`date "+%Y%m%d-%H%M%S"`.tar.xz ${NAME}*
  [ -d $DIRP ] && tar Jfcv `date "+%y%m%d"`.tar.xz ${NAME}*
cd -

[ -d $DIRP ] && rm -rfv $DIRP



mkdir -p $DIRP


### ______________________________________________________
###
### index.theme
###


if [ -f /usr/share/icons/Faenza-Cupertino/index.theme ]; then
 cp -av /usr/share/icons/Faenza-Cupertino/index.theme $DIRP/index.theme
elif [ -f $DIR/Faenza-Cupertino/index.theme ]; then
 cp -av $DIR/Faenza-Cupertino/index.theme $DIRP/index.theme
else
 exit 1
fi

sed \
 -e "s|Name=Faenza-Cupertino|Name=$NAME|" \
 -e "s|Inherits=Faenza|Inherits=Faenza-Cupertino|" \
 -i $DIRP/index.theme

echo ""
cat $DIRP/index.theme | grep $NAME || exit 1
echo ""

#lndir /usr/share/icons/Faenza-Cupertino $DIRP

echo ""
cat $DIRP/index.theme | grep Inherits=Faenza-Cupertino
echo ""

# Scheme and idea: 
# d1 = dir w/ icons(-png)
# (i1 -> i2) == (old -> new)


d1=""
d2=""
i1=""
i2=""
K=""


### ______________________________________________________
###
### [K]-[MATE]-Faenza
### Mint-X
###

i_faenza (){
S="`\
find /usr/share/icons/${K}/ -name ${i1}.png \
| sed -e "s|/usr/share/icons/${K}/${d1}/||" \
| cut --complement -b '4-' \
| sed -e "s|/||" \
`"
if [ -z "$S" ]; then
 echo -e "\n${i1}.png - not found"
 S="`find /usr/share/icons/${K}/ -name ${i1}.svg \
 | sed -e "s|/usr/share/icons/${K}/${d1}/||" \
 | cut --complement -b '4-' \
 | sed -e "s|/||"`"
 [ -z "$S" ] && echo -e "${i1}.svg - not found\n" && exit 1 || echo -e "${i1}.svg - Yes\n"
else
 echo -e "\n$i1\n$S"
fi

for s in $S; do 
 [ ! -d "$DIRP/${d2}/$s" ] && mkdir -p $DIRP/${d2}/${s}
 cp -av \
  /usr/share/icons/${K}/${d1}/${s}/${i1}.png \
   $DIRP/${d2}/${s}/${i2}.png || \
 cp -av \
  /usr/share/icons/${K}/${d1}/${s}/${i1}.svg \
   $DIRP/${d2}/${s}/${i2}.svg \
 || exit 1
done

if [ -f /usr/share/icons/${K}/${d1}/scalable/${i1}.svg ]; then
 mkdir -p $DIRP/${d2}/scalable
 cp -av \
  /usr/share/icons/${K}/${d1}/scalable/${i1}.svg \
   $DIRP/${d2}/scalable/${i2}.svg || exit 1
fi
}
### ______________________________________________________

# OOo
K="Faenza"
d1="apps"
d2="${d1}"
for ooo in base calc draw impress math writer ; do
 i1="ooo-${ooo}"
 i2="openoffice4-${ooo}"
 i_faenza
done

# blueman-device
K="Faenza"
d1="apps"
d2="${d1}"
i1="preferences-system-bluetooth"
i2="blueman-device"
i_faenza

# engrampa
K="Faenza"
d1="apps"
d2="${d1}"
i1="file-roller"
i2="engrampa"
i_faenza

# screengrab
K="Faenza"
d1="apps"
d2="${d1}"
i1="gnome-screenshot"
i2="screengrab"
i_faenza

# winecfg
K="Faenza"
d1="apps"
d2="${d1}"
i1="wine"
i2="winecfg"
i_faenza

# trash
K="Faience"
d1="status"
d2="${d1}"
i1="user-trash-full"
i2="user-trash-full"
#i_faenza

# gxkb > 0.7.5
K="Faenza"
d1="apps"
d2="${d1}"
i1="preferences-desktop-keyboard-shortcuts"
i2="gxkb"
i_faenza

# gdm
K="Faenza"
d1="apps"
d2="${d1}"
i1="gdm-setup"
i2="gdmsetup"
i_faenza

# ffox flux-panel-task
K="Faenza"
d1="apps"
d2="${d1}"
i1="firefox-original"
i2="mozilla-firefox"
#i_faenza

# MPlayer
K="Faenza"
d1="apps"
d2="${d1}"
i1="totem"
i2="mplayer"
i_faenza

# kplayer
K="Faenza"
d1="categories"
d2="apps"
i1="applications-multimedia"
i2="kplayer"
i_faenza

# juk
K="Faenza"
d1="apps"
d2="apps"
i1="library-internet-radio"
i2="juk"
i_faenza



# dragonplayer
K="Faenza"
d2="apps"
i2=dragonplayer

#d1="mimetypes"
#i1="video-x-generic"

d1="categories"
i1="applications-multimedia"

i_faenza


# applications-education for xdg-menu-gen
K="Faenza"
d1="categories"
d2="${d1}"
i1="applications-science"
i2="applications-education"
i_faenza

# KTorrent
K="Faenza"
d1="categories"
d2="apps"
i1="applications-internet"
i2="ktorrent"
i_faenza


#[+] Kget							(emblem-downloads - Faenza)
# KGet
K="Faenza"
d1="emblems"
d2="apps"
i1="emblem-downloads"
i2="kget"
#i_faenza


K="Faenza"
d1="emblems"
d2="apps"
i1="emblem-downloads"
i2="download"
i_faenza


# clipit
K="Faenza-Dark"
d1="status"
d2="${d1}"
i1="gtg-panel"
i2="clipit-trayicon"
#i_faenza


#[+] eom 							(eom - matefaenza)
# eom
K="matefaenza"
i2="eom"
d2="apps"

#d1="places"
#i1="distributor-logo-mate"

d1="apps"
i1="eom"

#i_faenza


# geany for panel
#K="matefaenza"
 K=Mint-X
d1="apps"
d2="${d1}"
i1="geany"
i2="${i1}"
i_faenza


# qPDFv
K=Mint-X
d1="apps"
d2="${d1}"
i1="qpdfview"
i2="${i1}"
i_faenza


# qb
K=Mint-X
d1="apps"
d2="${d1}"
i1="qbittorrent"
i2="${i1}"
i_faenza


# gimp
K=Mint-X
d1="apps"
d2="${d1}"
i1="gimp"
i2="${i1}"
i_faenza

# QtCreator
K=Faenza
d1="apps"
d2="${d1}"
i1="qtcreator"
i2="QtProject-qtcreator"
i_faenza

# iPhone
K=Mint-X
d1="devices"
d2="${d1}"
i1="phone"
i2="${i1}"
i_faenza


#  qmmp
d2="apps"
i2="qmmp"

qmmp_minty (){
 K=Mint-Y
 d1="apps"
 i1="lxmusic"
#i1="mpd"
 i_faenza
}

qmmp_faenza (){
 K="Faenza"
 
 #d1="mimetypes"
 #i1="audio-x-generic"
 
 #d1=devices
 #i1=multimedia-player-ipod-blue #grey
 
 d1=apps
 i1=preferences-desktop-sound
 
 #d1="emblems"
 #i1=emblem-sound
 
 #d1=apps
 #i1=minitunes
 
 #d1=apps
 #i1=rhythmbox
 
 i_faenza
}

#qmmp_minty
 qmmp_faenza


#  pulse
K="Faenza"
d1=apps
d2=apps
i1=rhythmbox
i2=multimedia-volume-control
i_faenza


### ______________________________________________________


# qt4config
K="KFaenza"
d1="apps"
d2="${d1}"

#i1="kmess"
i1=gnome-subtitles

i2="vacuum"
i_faenza


# qt4config
K="KFaenza"
d1="apps"
d2="${d1}"
i1="mame"
i2="mame"
i_faenza

# qt4config
K="KFaenza"
d1="apps"
d2="${d1}"
i1="qtlogo"
i2="qt-logo"
i_faenza

# partitionmanager
K="KFaenza"
d1="apps"
d2="${d1}"
i1="gparted"
i2="partitionmanager"
i_faenza

# FB2 / application/x-fictionbook+xml
K="KFaenza"
d1="apps"
d2="mimetypes"
i1="accessories-dictionary"
i2="application-x-fictionbook+xml"
i_faenza


# clementine
K="KFaenza"
d1="apps"
d2="${d1}"
i1="clementine2"

i2="application-x-clementine"
i_faenza

i2="clementine"
i_faenza


#i1="clementine2"
#i2="clementine"
# i_faenza


# dolphin from wireshark
# Icon=system-file-manager
K="KFaenza"
d1="apps"
d2="${d1}"
i1="wireshark"
i2="system-file-manager"
i_faenza


# kopete
K="KFaenza"
d1="apps"
d2="${d1}"
i1="kopete"
i2="${i1}"
i_faenza


# preferences-system
#K="KFaenza"
#d1="places"
#d2="categories"
#i1="start-here-kde"
#i2="preferences-system"
#i_faenza


### ______________________________________________________


# transmission-tray-icon"    [*] transmission-tray-icon 			(transmission - matefaenza)
K="matefaenza"
d1="apps"
d2="status"
i1="transmission"
i2="transmission-tray-icon"
#i_faenza

# start-mate-menu
K="matefaenza"
d1="places"
d2="status"
i1="start-here-mate"
i2="start-here"
i_faenza




### ______________________________________________________
###
### size-x-size
###

i_x (){
SX="`\
find /usr/share/icons/${K}/ -name ${i1}.png \
| sed -e "s|/usr/share/icons/${K}/||" \
| cut --complement -b '4-' \
| sed -e "s|x||" \
`"
if [ -z "$SX" ]; then
 echo -e "\n$i1 - not found\n"
 exit 1
else
 echo -e "\n$i1\n$SX"
fi
for s in $SX; do 
 [ ! -d "$DIRP/${d2}/$s" ] && mkdir -p $DIRP/${d2}/${s}
 cp -av \
  /usr/share/icons/${K}/${s}x${s}/${d1}/${i1}.png \
   $DIRP/${d2}/${s}/${i2}.png || exit 1
done
if [ -f /usr/share/icons/${K}/${d1}/scalable/${i1}.svg ]; then
 mkdir -p $DIRP/${d2}/scalable
 cp -av \
  /usr/share/icons/${K}/scalable/${d1}/${i1}.svg \
   $DIRP/${d2}/scalable/${i2}.svg || exit 1
fi
}





K=mate
d1="mimetypes"
d2="${d1}"
i1="text-x-patch"
i2="${i1}"
i_x

K=KFaenza
d1=apps
d2=mimetypes
i1=preferences-plugin
i2=text-x-patch
#i_faenza



K=mate
d1="mimetypes"
d2="${d1}"
i1="application-x-perl"
i2="${i1}"
i_x


# djvu
i2="djvu"
d2="mimetypes"

#K=Mint-X
#d1="apps"
#i1="qpdfview"
#i_faenza

K=mate
d1=mimetypes
i1=x-office-document
#i_x


### ______________________________________________________
###

echo -e "\n______________________________________________________"
echo -e "Done, Enjoy new icon-theme: \e[1m$NAME\e[0m \n\n\n"


### ______________________________________________________
###

DIRD="$DIR/${NAME}-Dark"
[ -d $DIRD ] && rm -rf $DIRD
#cp -a 	$DIR/Faenza-Cupertino 				$DIRD
#cp -a 	$DIR/Faenza-Cupertino-Patch/* 		$DIRD
#cp -av 	$DIR/Faenza-Cupertino/index.theme 	$DIRD/index.theme

mkdir $DIRD
cd $DIRD
lndir ../Faenza-Cupertino 		./
lndir ../$NAME ./
rm -v ./index.theme
cat ../Faenza-Cupertino/index.theme > ./index.theme

sed \
 -e "s|Name=Faenza-Cupertino|Name=$NAME-Dark|" \
 -e "s|Inherits=Faenza|Inherits=Faenza-Dark|" \
 -i $DIRD/index.theme


DIRP=$DIRD


# folder-copy
K="Faenza-Darkest"
d1="actions"
d2="${d1}"

i1="folder-copy"
i2="${i1}"
i_faenza

i1="stock_folder-copy"
i2="${i1}"
i_faenza




echo -e "\n______________________________________________________"
echo -e "Done, Enjoy new icon-theme: \e[1m$NAME-Dark\e[0m "



