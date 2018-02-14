##
# Make checkpoint
#
if [ $# -lt 2 ]
then
	echo "Usage: sh make_checkpoint <file.ckp> <machine>"
	exit 1
fi

echo "Creating checkpoint: " $1
bhyvectl --checkpoint $1 --vm=$2
