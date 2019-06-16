FROM python:3.7-slim
MAINTAINER Tobias Frei (shuntingyard@gmail.com)

# Install packages required.
RUN pip install --trusted-host pypi.python.org speedtest-cli

# Create data and log dirs.
RUN mkdir /data \
    mkdir -p /var/log

# Copy script to image.
COPY bin /bin

# Defaults settings for the container:
ENV INTERVAL 600
ENV CSVPATH /data/speedtest.csv
ENV LOGPATH /var/log/sampler.log

# Start probing on entry.
ENTRYPOINT ["/bin/speedtest.sh"]
