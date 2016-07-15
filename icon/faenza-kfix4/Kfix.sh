#!/bin/bash

# NAME
pkgname=kfaenza-icon-theme


# KFaezna 
pkgver=0.8.9

# Icon patch for the KFaezna icon theme
pkgver_p=0.3


# mint-x-icons
pkgver_m=1.1.6

# SRC

#"http://omploader.org/vYjR0NQ" \
#"http://omploader.org/vYXgxbQ"

source=(
"http://pkgs.fedoraproject.org/repo/pkgs/kfaenza-icon-theme/kfaenza-icon-theme-${pkgver}.tar.gz/95e9f287da7a0fd76fb406d313eee77e/kfaenza-icon-theme-${pkgver}.tar.gz"
"http://kde-look.org/CONTENT/content-files/153813-kfaenza-icon-patch-${pkgver_p}.tar.gz"
"http://packages.linuxmint.com/pool/main/m/mint-x-icons/mint-x-icons_${pkgver_m}.tar.gz"
)


# KFaenza
if [ ! -d "KFaenza" ]; then
	echo "dir. KFaenza OR kfaenza not found!"
	exit 1
fi


# KFaenza-patch-fix
[ ! -d "KFaenza-patch-fix" ] && mkdir ./KFaenza-patch-fix



cd ./KFaenza-patch-fix
###
if [[ -d "../KFaenza-patch" ]]; then
 lndir ../KFaenza-patch/ ./
else
 lndir ../KFaenza/ ./
fi
##
rm -v ./index.theme
[ -f "INSTALL" ] && rm -v ./INSTALL
find -type l -name '.directory' -delete
#
cat ../KFaenza/index.theme > ./index.theme || exit 1
##
sed -i \
 -e "s|Name=KFaenza|Name=KFaenza-patch-fix|" \
 -e "s| KDE port| KDE port w/ Icon patch v${pkgver_p} + Nk's fixes|" \
 ./index.theme
###
cd -


pkgdir_i="."
I="`ls ${pkgdir_i}/KFaenza/apps/`"
M="`ls ${pkgdir_i}/KFaenza/mimetypes/`"
pkgdir_i_f="${pkgdir_i}/KFaenza-patch-fix"



###gajim
i_gajim (){
#
for i in $I; do
 if [[ -z "`echo $i | grep scalable`" \
 && ! -e "${pkgdir_i_f}/apps/$i/gajim.png" \
 && -e "/usr/share/icons/Faenza/apps/$i/gajim.png" \
 ]]; then
  cd ${pkgdir_i_f}/apps/$i
  ln -s ../../../Faenza/apps/$i/gajim.png gajim.png
 elif [[ ! -z "`echo $i | grep scalable`" \
 && ! -e "${pkgdir_i_f}/apps/scalable/gajim.svg" \
 && -e "/usr/share/icons/Faenza/apps/scalable/gajim.svg" \
 ]]; then
  cd ${pkgdir_i_f}/apps/scalable
  ln -s ../../../Faenza/apps/scalable/gajim.svg gajim.svg
 fi
done

# part of index.theme
cd $pkgdir_i_f || exit 1
if [[ -z "`cat ./index.theme | grep Dir | grep scalable`" ]]; then
sed -i \
 -e "s|places/256,status/256|places/256,status/256,apps/scalable|" \
 ./index.theme || exit 1
echo "" >> ./index.theme || exit 1
cat << EOF >> ./index.theme
[apps/scalable]
Size=96
Context=Apps
Type=Scalable
MinSize=8
MaxSize=512
EOF
fi
}


i_gajim
