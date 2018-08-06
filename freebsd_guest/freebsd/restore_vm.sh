##
# Restore virtual machine from checkpoint
#

if [ $# -lt 3 ]
then
	echo "Usage: sh $0 <guest.img> <file.ckp> <machine>"
	exit 1
fi

echo "Load VM"
bhyveload -c stdio -m 512M -d $1 $3

echo "Restore from checkpoint $2"
bhyve \
	-c 2 \
	-m 512M \
	-H \
	-A \
	-P \
	-s 0:0,hostbridge \
	-s 1:0,lpc \
	-s 3:0,virtio-net,tap0 \
	-s 4:0,virtio-blk,$1 \
	-l com1,stdio \
	-r $2 \
	$3
