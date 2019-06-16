#!/bin/bash

# show values from env
#
echo 1>> "$LOGPATH"
echo "$(date): Starting" 1>> "$LOGPATH"

# interval between probes (sec)
echo INTERVAL $INTERVAL 1>> "$LOGPATH"
# absolute path + filename expected
echo CSVPATH: "$CSVPATH" 1>> "$LOGPATH"
# absolute path + filename expected
echo LOGPATH: "$LOGPATH" 1>> "$LOGPATH"

# set internal variables
#
# timestamp (secs since epoch)
let last=0
# return code after probe
let rc=0


# precondition
if [ ! -f "$CSVPATH" ]
then
    speedtest --csv-header > $CSVPATH
fi

while true
do
    let elapsed=$(date +"%s")-$last
    if [ $rc -eq 0 ]
    then
        echo -n " $elapsed" 1>> "$LOGPATH"
    else
        echo -n " Error, time reset!" 1>> "$LOGPATH"
        let last=0
        let rc=0
        sleep 2
    fi

    if [ $elapsed -ge $INTERVAL ]
    then
        let last=$(date +"%s")
        echo 1>> "$LOGPATH"
        echo probing... 1>> "$LOGPATH"
        speedtest --csv >> $CSVPATH 2>> "$LOGPATH"
        let rc=$?
    fi
    sleep 1
done
