#!/bin/sh

CRTSCRIPT=`readlink -f $0`
BASEDIR=${CRTSCRIPT%/*}

if [ $# -lt 2 ]
then
	echo "Usage: sh $0 <guest.img> <machine>"
	exit 1
fi

# We assure that we have the tap0 interface created
${BASEDIR}/tap.sh

# Load vm module
kldload vmm

bhyve \
    -H \
    -P \
    -c 2 \
    -m 2048M \
    -s 0:0,hostbridge  \
    -s 31,lpc  \
    -l com1,stdio  \
    -l bootrom,/usr/local/share/uefi-firmware/BHYVE_UEFI.fd  \
    -s 29,fbuf,tcp=172.19.7.207:5901,w=800,h=600,wait,vga=off  \
    -s 30,xhci,tablet  \
    -s 4,virtio-blk,$1  \
    -s 5,virtio-net,tap0  \
    $2
