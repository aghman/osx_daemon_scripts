#!/bin/bash

. /etc/rc.common

DAEMON_NAME=coredns
DAEMON_PATH=/usr/local/bin/coredns
START_PARAMS=-conf /usr/local/conf/coredns/Corefile
 
# The start subroutine
StartService() {
    $(DAEMON_PATH) $(START_PARAMS)
}
 
# The stop subroutine
StopService() {
    killall -TERM $(DAEMON_NAME)
    sleep 10
    killall -9 $(DAEMON_NAME)
}

# The restart subroutine
RestartService() {
    killall -HUP $(DAEMON_NAME)
}
 
RunService "$1"
