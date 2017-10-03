##
# Firstly, we need to create a virtual machine using vmrun.sh and to install
# guest OS in <guest.img> virtual file system
# In this script core's number is hardcodded to 2 (-c 2)
# and VM's RAM is limitted to 512M.
# We suppose that tap interface is tap0 (created using tap.sh script).
#

if [ $# -lt 3]
then
	echo "Usage: sh  make_first_create_command.sh <guest.img> <file.iso> <machine>"
	exit 1
fi

sh /usr/share/examples/bhyve/vmrun.sh -c 2 -m 512M -t tap0 -d $1 -i -I $2 $3
