#!/bin/sh

##
# Make checkpoint
#
if [ $# -lt 2 ]
then
	echo "Usage: sh $0 <file.ckp> <machine>"
	exit 1
fi

echo "Creating checkpoint: " $1

[ ${VERBOSE} -eq 1 ] && set -x

bhyvectl --checkpoint $1 --vm=$2
