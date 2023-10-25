#!/usr/bin/bash

ARCH="`uname -m`"

if [[ "$ARCH" == "arm"* ]]; then
	echo "ARM!"
	case "$OSTYPE" in
	darwin*)
		echo "MacOS"
		;;
	linux*)
		echo "LINUX"
		;;
	win32 | msys* | cygwin*)
		echo "WINDOWS"
		;;
	esac
elif [[ "$ARCH" == "x86_64" ]]; then
	echo "x86_64"
	case "$OSTYPE" in
	darwin*)
		echo "MacOS"
		bash darwin_x86.sh
		;;
	linux*)
		echo "LINUX"
		bash linux_x86.sh
		;;
	win32 | msys* | cygwin*)
		echo "WINDOWS"
		;;
	esac
else
	echo "unknown arch: $ARCH - $OSTYPE"
fi

