#!/bin/bash

# Inherits=Faenza-Cupertino,Faenza

# This requires:
# 	faenza-icon-theme-1.3-noarch-1_SBo
# 	kfaenza-icon-theme-0.8.9-noarch-1_SBo
# 	mate-icon-theme-1.8.0-noarch-1_msb
# 	mate-icon-theme-faenza-1.8.0-noarch-1_msb

NAME="Faenza-Cupertino-Flux"
DIR="$HOME/.icons"
DIRP="$DIR/$NAME"

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
### [K]Faenza
###

i_faenza (){
S="`\
find /usr/share/icons/${K}/ -name ${i1}.png \
| sed -e "s|/usr/share/icons/${K}/${d1}/||" \
| cut --complement -b '4-' \
| sed -e "s|/||" \
`"
if [ -z "$S" ]; then
 echo -e "\n$i1 - not found\n"
 exit 1
else
 echo -e "\n$i1\n$S"
fi
for s in $S; do 
 [ ! -d "$DIRP/${d2}/$s" ] && mkdir -p $DIRP/${d2}/${s}
 cp -av \
  /usr/share/icons/${K}/${d1}/${s}/${i1}.png \
   $DIRP/${d2}/${s}/${i2}.png || exit 1
done
if [ -f /usr/share/icons/${K}/${d1}/scalable/${i1}.svg ]; then
 mkdir -p $DIRP/${d2}/scalable
 cp -av \
  /usr/share/icons/${K}/${d1}/scalable/${i1}.svg \
   $DIRP/${d2}/scalable/${i2}.svg || exit 1
fi
}


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

# applications-education for xdg-menu-gen
K="Faenza"
d1="categories"
d2="${d1}"
i1="applications-science"
i2="applications-education"
i_faenza

# clipit
K="Faenza-Dark"
d1="status"
d2="${d1}"
i1="gtg-panel"
i2="clipit-trayicon"
#i_faenza


### ______________________________________________________

# qt4config
K="KFaenza"
d1="apps"
d2="${d1}"
i1="qtlogo"
i2="qt-logo"
i_faenza

# FB2 / application/x-fictionbook+xml
K="KFaenza"
d1="apps"
d2="mimetypes"
i1="accessories-dictionary"
i2="application-x-fictionbook+xml"
i_faenza

### ______________________________________________________

# transmission-tray-icon"
K="matefaenza"
d1="apps"
d2="status"
i1="transmission"
i2="transmission-tray-icon"
i_faenza

# start-mate-menu
K="matefaenza"
d1="places"
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

K=mate
d1="mimetypes"
d2="${d1}"
i1="application-x-perl"
i2="${i1}"
i_x


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


echo -e "\n______________________________________________________"
echo -e "Done, Enjoy new icon-theme: \e[1m$NAME-Dark\e[0m "



