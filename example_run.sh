#!/bin/sh

# interval between probes (sec),
# INTERVAL  container default is 600

# absolute path to output file
# OUTFILE   container default is /var/lib/speedtest/speedtest.csv

# absolute path to logfile
# LOGFILE   container default is /var/lib/speedtest/sampler.log


# If defaults don't suit your needs, create something of your own, e.g:
#
# /data/
# └── log
#
# Under SELinux don't forget to authorize the entire path for containers:
#
# $ sudo chcon -Rt svirt_sandbox_file_t /data
#
sudo docker run \
    --restart always \
    --volume /data:/data \
    --volume /data/log:/var/log \
    --env INTERVAL=600 \
    --env OUTFILE=/data/speedtest.csv \
    --env LOGFILE=/var/log/sampler.log \
    --detach \
    --name speedtest_sampler_1 \
    shuntingyard/speedtest_sampler
