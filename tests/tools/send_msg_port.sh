#!/usr/bin/env bash
#
#send message to port 

msg=$1
port=$2

failexit() {
    echo $1
    exit 1
}

if [ "x$msg" == "x" ] ; then
    failexit "message empty"
fi
if [ "x$port" == "x" ] ; then
    failexit "port empty"
fi

exec 3<>/dev/tcp/localhost/$port || failexit "no listener in port $port"

echo $msg >&3

exec 3>&- #close output connection
exec 3<&- #close input connection
