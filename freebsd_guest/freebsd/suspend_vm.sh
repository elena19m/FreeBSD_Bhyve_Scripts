##
# Make checkpoint
#
if [ $# -lt 2 ]
then
	echo "Usage: sh $0 <file.ckp> <machine>"
	exit 1
fi

echo "Suspending virtual machine to file: $1"

[ ${VERBOSE} -eq 1 ] && set -x

bhyvectl --suspend $1 --vm=$2
