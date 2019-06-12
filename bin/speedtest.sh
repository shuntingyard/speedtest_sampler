#!/bin/sh

# to configure from the environment
CSV_FILE="$CSV_OUT"
let interval=$INTERVAL      # interval between probes (sec)

# internal
let last=0                  # timestamp (secs since epoch)
let rc=0                    # return code after probe

# precondition
if [ ! -f "$CSV_FILE" ]
then
    speedtest --csv-header > $CSV_FILE
fi

while true
do
    let elapsed=$(date +"%s")-$last
    if [ $rc -eq 0 ]
    then
        echo -n " $elapsed"
    else
        echo -n " Error, time reset!"
        let last=0
        let rc=0
        sleep 2
    fi

    if [ $elapsed -ge $interval ]
    then
        let last=$(date +"%s")
        echo
        echo probing...
        speedtest --csv >> $CSV_FILE
        let rc=$?
    fi
    sleep 1
done
