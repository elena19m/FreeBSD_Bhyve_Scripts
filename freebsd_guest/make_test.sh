##
# When using a virtual machine, first we need to load the kernel and then
# to run the virtual machine
#

if [ $# -lt 2 ]
then
	echo "Usage: sh make_test.sh <guest.img> <machine>"
	exit 1
fi

# We assure that we have the tap0 interface created
sh tap.sh

# Load vm module
kldload vmm

# Load kernel
bhyveload -c stdio -m 512M -d $1 $2

# Run virtual machine
bhyve -c 2 -m 512M -H -A -P -s 0:0,hostbridge -s 1:0,lpc \
	 -s 3:0,virtio-net,tap0 -s 4:0,virtio-blk,$1 -l com1,stdio $2
