#!/bin/bash

# Inherits=Faenza-Cupertino,Faenza

#This requires:
# faenza-icon-theme-1.3-noarch-1_SBo
# kfaenza-icon-theme-0.8.9-noarch-1_SBo
# mate-icon-theme-1.8.0-noarch-1_msb
# mate-icon-theme-faenza-1.8.0-noarch-1_msb

DIR="$HOME/.icons"
DIRP="$DIR/Faenza-Cupertino-Patch_slack"

rm -rfv $DIRP
mkdir -p $DIRP

if [ -f /usr/share/icons/Faenza-Cupertino/index.theme ]; then
 cp -av /usr/share/icons/Faenza-Cupertino/index.theme $DIRP/index.theme
elif [ -f $DIR/Faenza-Cupertino/index.theme ]; then
 cp -av $DIR/Faenza-Cupertino/index.theme $DIRP/index.theme
else
 exit 1
fi

sed \
 -e "s|Name=Faenza-Cupertino|Name=Faenza-Cupertino-PatchSlack|" \
 -e "s|Inherits=Faenza|Inherits=Faenza-Cupertino,Faenza|" \
 -i $DIRP/index.theme

echo ""
cat $DIRP/index.theme | grep Faenza-Cupertino-Patch || exit 1
echo ""

#lndir /usr/share/icons/Faenza-Cupertino $DIRP

echo ""
cat $DIRP/index.theme | grep Inherits=Faenza-Cupertino
echo ""

# Scheme and idea: 
# d1 = dir w/ icons(-png)
# i1 -> i2


d1=""
d2=""
i1=""
i2=""
K=""

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
 ln -sfv \
  /usr/share/icons/${K}/${d1}/${s}/${i1}.png \
  $DIRP/${d2}/${s}/${i2}.png || exit 1
done
if [ -f /usr/share/icons/${K}/${d1}/scalable/${i1}.svg ]; then
 mkdir -p $DIRP/${d2}/scalable
 ln -sfv \
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

# gxkb
K="Faenza"
d1="apps"
d2="${d1}"
i1="preferences-desktop-keyboard"
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
i_faenza

# applications-education for xdg-menu-gen
K="Faenza"
d1="categories"
d2="${d1}"
i1="applications-science"
i2="applications-education"
i_faenza

# qt4config
K="KFaenza"
d1="apps"
d2="${d1}"
i1="qtlogo"
i2="qt-logo"
i_faenza

# transmission-tray-icon"
#
#
# matefaenza // mate-icon-theme-faenza - msb
K="matefaenza"
d1="status"
d2="status"
i1="transmission-tray-icon"
i2="transmission-tray-icon"
i_faenza



d1=""
d2=""
i1=""
i2=""
K=""

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
 ln -sfv \
  /usr/share/icons/${K}/${s}x${s}/${d1}/${i1}.png \
  $DIRP/${d2}/${s}/${i2}.png || exit 1
done
if [ -f /usr/share/icons/${K}/${d1}/scalable/${i1}.svg ]; then
 mkdir -p $DIRP/${d2}/scalable
 ln -sfv \
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


echo -e "\n______________________________________________________"
echo -e "Done, Enjoy new icon-theme: \e[1mFaenza-Cupertino-Patch\e[0m "

################################################################
################################################################
################################################################
##### Not Used
################################################################
################################################################

# First install mate-icon-theme , mint-x-icons and 
# faenza-cupertino from ppa:webupd8team/themes
# http://www.webupd8.org/2011/03/announcing-webupd8-themes-ppa.html
# recommended version 0.3.4-1~webupd8~oneiric

# gedit / mousepad / leafpad
K="KFaenza"
d1="apps"
d2="${d1}"
i1="leafpad"
i2="accessories-text-editor"
#i_faenza

# tray-square-transmission
K="Faenza"
d1="apps"
d2="status"
i1="transmission"
i2="transmission-tray-icon"
#i_faenza

# tray-square-transmission
K="Faenza"
d1="apps"
d2="status"
i1="transmission"
i2="transmission-tray-icon"
#i_faenza

# lxappearance
#d1="apps"
#i1="gnome-settings-theme"
#i2="preferences-desktop-theme"
#i_faenza

# folder-copy
#K=""
#d1="actions"
#i1="stock_folder-copy"
#i2="stock_folder-copy"
#i_faenza

# SublimeText
K=""
d1="apps"
i1="menu-editor"
i2="sublime_text"
#i_faenza

# clipit-trayicon
K="Faenza-Dark"
d1="status"
i1="clipit-trayicon"
i2="clipit-trayicon"
#i_faenza

# start-mate-menu
K=""
d1="places"
i1="start-here-gnome"
i2="start-here"
#i_faenza

old (){
# patch and diff // mate-icon-theme
SP="`find /usr/share/icons/mate/ -name text-x-patch.png | sed -e "s|/usr/share/icons/mate/||" | cut --complement -b '4-' | sed -e "s|x||"`"
for s in $SP; do 
 [ ! -d "$DIRP/mimetypes/$s" ] && mkdir -p $DIRP/mimetypes/$s
 ln -sfv \
	/usr/share/icons/mate/${s}x${s}/mimetypes/text-x-patch.png \
	$DIRP/mimetypes/${s}/text-x-patch.png || rm -rf $DIRP
done

# https://raw.githubusercontent.com/mate-desktop/mate-icon-theme/master/mate/48x48/mimetypes/text-x-patch.png
SP="`\
find /usr/share/icons/mate/ -name text-x-patch.png \
| sed -e "s|/usr/share/icons/mate/||" \
| cut --complement -b '4-' \
| sed -e "s|x||"`"
for s in $SP; do 
 [ ! -d "$DIRP/mimetypes/$s" ] && mkdir -p $DIRP/mimetypes/$s
 #cp -afv
 ln -sfv \
	/usr/share/icons/mate/${s}x${s}/mimetypes/text-x-patch.png \
	$DIRP/mimetypes/${s}/text-x-patch.png || rm -rf $DIRP
done

# geany // mint-x-icons
# https://raw.githubusercontent.com/linuxmint/mint-x-icons/master/usr/share/icons/Mint-X/apps/48/geany.png
SG="`find /usr/share/icons/Mint-X/ -name geany.png | sed -e "s|/usr/share/icons/Mint-X/apps/||" | cut --complement -b '4-' | sed -e "s|/||"`"
for s in $SG; do 
 [ ! -d "$DIRP/apps/$s" ] && mkdir -p $DIRP/apps/$s
 ln -sfv \
	/usr/share/icons/Mint-X/apps/${s}/geany.png \
	$DIRP/apps/${s}/geany.png || rm -rfv $DIRP
done
}
#old

#SG="`find /usr/share/icons/Mint-X/ -name geany.png | sed -e "s|/usr/share/icons/Mint-X/apps/||" | cut --complement -b '4-' | sed -e "s|/||"`"
#for s in $SG; do 
# [ ! -d "$DIRP/apps/$s" ] && mkdir -p $DIRP/apps/$s
# cp -afv \
#	/usr/share/icons/Mint-X/apps/${s}/geany.png \
#	$DIRP/apps/${s}/geany.png || rm -rfv $DIRP
#done

# QPDFView // nuvola
#S="`find /usr/share/icons/nuvola/ -name kpdf.png | sed -e "s|/usr/share/icons/nuvola/||" | sed -r 's/x.+//'`"
#for s in $S; do 
# [ ! -d "$DIRP/apps/$s" ] && mkdir -p $DIRP/apps/$s
# cp -afv \
#	/usr/share/icons/nuvola/${s}x${s}/apps/kpdf.png \
#	$DIRP/apps/${s}/qpdfview.png || rm -rf $DIRP
#done

# antimicro // faenza
#S="`find /usr/share/icons/Faenza/ -name applications-games.png | sed -e "s|/usr/share/icons/Faenza/categories/||" | cut --complement -b '4-' | sed -e "s|/||"`"
#for s in $S; do 
# [ ! -d "$DIRP/categories/$s" ] && mkdir -p $DIRP/categories/$s
# ln -sfv \
#	/usr/share/icons/Faenza/categories/${s}/applications-games.png \
#	$DIRP/categories/${s}/antimicro.png || rm -rfv $DIRP
#done
