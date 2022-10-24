#!/bin/bash

#**************commands section**********************************************
#install prerequisits
setup()
{
 sudo apt-get install gawk wget git diffstat unzip texinfo gcc-multilib \
 build-essential chrpath socat cpio python python3 python3-pip python3-pexpect \
 xz-utils debianutils iputils-ping libsdl1.2-dev xterm libyaml-dev libssl-dev
 sudo apt-get install autoconf libtool libglib2.0-dev libarchive-dev \
 sed cvs subversion coreutils texi2html docbook-utils python-pysqlite2 \
 help2man make gcc g++ desktop-file-utils libgl1-mesa-dev libglu1-mesa-dev \
 mercurial automake groff curl lzop asciidoc u-boot-tools dos2unix mtd-utils pv \
 libncurses5 libncurses5-dev libncursesw5-dev libelf-dev zlib1g-dev bc rename git-lfs
 sudo apt-get install python3-git
 sudo apt install bmap-tools
 mkdir ~/bin
 curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
 chmod a+x ~/bin/repo
 export PATH=~/bin:$PATH
 sudo apt-get -y install vim
 sudo snap install --classic code
 code --install-extension ms-vscode.cpptools
}

#gets latest code update
get_update()
{
 repo init -u git@github.com:deadpoolcode1/blockstream_station_repo.git -b master
 repo sync
}

#build image
build_image_X86()
{
	echo "TBD"
}

#build image
build_image_cross()
{
        echo "TBD"
}

#deploy image to SD card 
deploy_image_to_device()
{
	echo "TBD"
}

help()
{
	echo $BASH_SOURCE "<parameter>"
	echo "setup - install all needed prerequisits for build"
	echo "get_update - gets update to current pulled repo xml version"
	echo "build_image_x86 - build image for PC"
	echo "build_image_cross - build image using cross compiler for the board"
	echo "deploy_image_to_device - copy image to the embedded device"
}


if [ -n "$*" ]; then
	eval "$*" # execute arguments
	#echo $* finished, ret=$?
else
	if [ "$0" != "$BASH_SOURCE" ]; then
		echo $BASH_SOURCE functions are loaded into the shell environment
	else
		echo $BASH_SOURCE - a library of shell utility functions
		echo To get help run \"$BASH_SOURCE _help\"
	fi
fi
