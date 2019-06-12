#!/bin/sh

# interval between probes (sec),    container default is 600
# INTERVAL

# absolute path + filename,         container default is /data/speedtest.csv
# CSVPATH

# absolute path + filename,         container default is /var/log/sampler.log
# LOGPATH


# directory structure on the host side
#
# To match defaults, create something like:
#
# /data/
# └── log
#
# Under SELinux you'll have to authorize the whole path for containers,
# so you would want to run:
#
# $ sudo chcon -Rt svirt_sandbox_file_t /data
#

# run container
sudo docker run \
    --restart always \
    --volume /data:/data \
    --volume /data/log:/var/log \
    --env INTERVAL=600 \
    --env CSVPATH=/data/speedtest.csv \
    --env LOGPATH=/var/log/sampler.log \
    --detach \
    --name speedtest_sampler_singleton \
    shuntingyard/speedtest_sampler
