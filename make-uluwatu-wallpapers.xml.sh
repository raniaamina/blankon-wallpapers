#!/bin/bash
function create(){
  HEADER='<?xml version="1.0"?>
  \n<!DOCTYPE wallpapers SYSTEM "gnome-wp-list.dtd">
  \n<wallpapers>'

  CONTENTS='\t<wallpaper>
  \n\t\t<_name>XXX</_name>
  \n\t\t<filename>/usr/share/backgrounds/YYY</filename>
  \n\t\t<options>zoom</options>
  \n\t\t<pcolor>#000000</pcolor>
  \n\t\t<scolor>#000000</scolor>
  \n\t\t<shade_type>solid</shade_type>
  \n\t</wallpaper>'

  FOOTER='\n</wallpapers>'

  echo -e $HEADER
  for file in $(ls | grep 'png\|jpg')
  do
    name="`echo $file | sed 's/.png//; s/.jpg//; s/-/ /g; s/_/ /g; s/\<./\U&/g'`"
    # echo -e $CONTENTS;
    echo -e $CONTENTS | sed "s/XXX/${name}/; s/YYY/${file}/ "
  done
  echo -e $FOOTER;
}

rm -rf uluwatu-wallpapers.xml.in && create > uluwatu-wallpapers.xml.in
