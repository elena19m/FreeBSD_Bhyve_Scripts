##
# Restore virtual machine from checkpoint
#

if [ $# -lt 3 ]
then
	echo "Usage: sh $0 <guest.img> <file.ckp> <machine>"
	exit 1
fi


bhyve \
	-H \
	-P \
	-c 2 \
	-m 2048M \
	-s 0:0,hostbridge  \
	-s 31,lpc  \
	-l com1,stdio  \
	-l bootrom,/usr/local/share/uefi-firmware/BHYVE_UEFI.fd  \
	-s 29,fbuf,tcp=0.0.0.0:5901,w=800,h=600,wait,vga=off  \
	-s 30,xhci,tablet  \
	-s 4,virtio-blk,$1  \
	-s 5,virtio-net,tap0  \
	-r $2 \
	$3
