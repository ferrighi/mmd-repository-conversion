#!/bin/bash

if [ -z "$1" ]; then
	echo "Usage: full_old2new.sh input_dir output_dir absolute_path_to_old-new.xslt"
	echo "Example: full_old2new.sh XML new_XML path-to-dir"
	exit
fi
if [ -z "$2" ]; then
	echo "Usage: full_old2new.sh input_dir output_dir absolute_path_to_old-new.xslt"
	echo "Example: full_old2new.sh XML new_XML path-to-dir"
	exit
fi
if [ -z "$3" ]; then
	echo "Usage: full_old2new.sh input_dir output_dir absolute_path_to_old-new.xslt dir"
	echo "Example: full_old2new.sh XML new_XML path-to-dir"
	exit
fi

echo "Downloading latest schema file" 
tempmmdxsd=$(tempfile)_mmd.xsd
curl https://raw.githubusercontent.com/metno/mmd/master/xsd/mmd.xsd -o $tempmmdxsd

echo "Downloading latest xslt file" 
curl https://raw.githubusercontent.com/metno/mmd/master/xslt/mmdv2-to-mmdv3.xsl -o $3/mmdv2-to-mmdv3.xsl

echo "Looping over XML files under $1 and generating new XMLs under $2"
for dotslashmmdpath in $(cd $1 && find . -type f); do 
	mmdpath=${dotslashmmdpath#./}
	mkdir -p $2/$(dirname $mmdpath)
	xsltproc $3/old-new.xslt $1/$mmdpath > $2/$mmdpath
	#xmllint --schema $tempmmdxsd --noout $2/$mmdpath
	xmllint --schema /home/laraf/Programs/mmd/xsd/mmd.xsd --noout $2/$mmdpath
done

rm $tempmmdxsd
