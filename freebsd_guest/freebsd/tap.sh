## Create a tap interface
# Source: https://www.freebsd.org/doc/handbook/virtualization-host-bhyve.html

ifconfig tap0 create
sysctl net.link.tap.up_on_open=1
ifconfig bridge0 create
ifconfig bridge0 addm em0 addm tap0
ifconfig bridge0 up
