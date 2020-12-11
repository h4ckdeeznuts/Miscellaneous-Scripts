# Required Package ---- bluez; bluez-utils
# A simple CLI based script to connect to your Bluetooth devices. Default timeout for searching can be changed.

#!/bin/bash

arg=$1

function chkPkg() {
    if [ -z "$(pacman -Qs bluez-utils)" ]
    then
        echo "You need to have -- bluez-utils -- package installed in order for this to work."
        exit
    fi

}

function powerOn() {

    bluetoothctl <<< x power on

}

function powerCycle() {

    echo 'power off' | bluetoothctl > /dev/null
    sleep 2
    echo 'power on' | bluetoothctl > /dev/null
    echo "remove $choice" | bluetoothctl > /dev/null
    echo "pair $choice" | bluetoothctl > /dev/null
    sleep 5
    echo "connect $choice" | bluetoothctl

}

function newDevice() {

    echo 'Here is a list of Available Devices: (Default timeout is at 7 seconds)'
    list=$(awk 'NR>1{print "["NR-1"]","--", $1, $3}' <(timeout 7s bluetoothctl <<<x scan on))
    echo "$list"
    echo ''
    read -p "Enter your choice:  -- " c
    device=$(echo "$list" | sed -n ${c}p)
    choice=$(echo $device | cut -d ' ' -f4)
    echo "You chose : $device "
}

function main() {

if [ $arg -e ]; then
    # working on incorporating env vars as memory for saved devices
    echo "Please re-launch this script with    -c    option"
    exit 1
    echo
elif [[ $arg == "-c" ]]; then
    newDevice
fi

}

chkPkg
powerOn
main
powerCycle
