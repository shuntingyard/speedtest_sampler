#!/bin/bash

# set and/or check environment variables
INTERVAL=${INTERVAL:-600}
[ ! "$OUTFILE" ] && { >&2 echo "No OUTFILE set, cannot start..."; exit 1; }
[ ! "$LOGFILE" ] && { >&2 echo "No LOGFILE set, cannot start..."; exit 1; }

# show values from env
#
echo 1>> "$LOGFILE"
echo "$(date): Starting" 1>> "$LOGFILE"

# interval between probes (sec)
echo INTERVAL $INTERVAL 1>> "$LOGFILE"
# absolute path + filename expected
echo OUTFILE: "$OUTFILE" 1>> "$LOGFILE"
# absolute path + filename expected
echo LOGFILE: "$LOGFILE" 1>> "$LOGFILE"

# set internal variables
#
# timestamp (secs since epoch)
let last=0
# return code after probe
let rc=0


# precondition
if [ ! -f "$OUTFILE" ]
then
    speedtest --csv-header > $OUTFILE
fi

while true
do
    let elapsed=$(date +"%s")-$last
    if [ $rc -eq 0 ]
    then
        let mod=$elapsed%10
        [ $mod -eq 0 ] && echo -n " $elapsed" 1>> "$LOGFILE"
    else
        echo "Error, writing empty record!" 1>> "$LOGFILE"
        # Ending Z: %Z would eval to timezone, maybe erroneous in speedtest-cli
        # and thus mimicked here.
        echo ",,,$(date -u +"%Y-%m-%dT%H:%M:%S.000000Z"),,,,,," >> $OUTFILE
        let rc=0
    fi

    if [ $elapsed -ge $INTERVAL ]
    then
        let last=$(date +"%s")
        echo 1>> "$LOGFILE"
        echo probing... 1>> "$LOGFILE"
        speedtest --csv >> $OUTFILE 2>> "$LOGFILE"
        let rc=$?
    fi
    sleep 1
done
