#!/bin/sh

# TODO Change Dockerfile and speedtest.sh as CSV_OUT should rather be the
# file name (as opposed to the entire path).

# --env INTERVAL=seconds allows to override the image's
# default sampling rate (which is set to 600).

# This variable (possibly in combination with --env CSV_OUT=<path>/<filename>)
# allows to override the default output location (which is /data/speedtest.csv
# in the container's file system.
# DIR=/data

# Create DIR if required.
if [[ "$DIR" && ! -d "$DIR" ]]
then
    sudo mkdir -p "$DIR"
    # WARNING
    #
    # It seems best under SELinux to run the
    # policy label attach command manually, I don't
    # know why so far.
    #
    sudo chcon -Rt svirt_sandbox_file_t "$DIR"
fi

# Run a container
sudo docker run \
	--restart always \
	shuntingyard/speedtest_sampler

#    --env INTERVAL=600 \
#    --env CSV_OUT=/data/speedtest.csv \
#    --volume $DIR:/data \
