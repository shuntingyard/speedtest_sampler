FROM python:3.7-slim
MAINTAINER Tobias Frei (shuntingyard@gmail.com)

# Install packages required.
RUN pip install --trusted-host pypi.python.org speedtest-cli

# Create data and log dirs.
RUN mkdir -p /var/lib/speedtest

# Copy script to image.
COPY bin /bin

# Defaults settings for the container:
ENV INTERVAL 600
ENV OUTFILE /var/lib/speedtest/speedtest.csv
ENV LOGFILE /var/lib/speedtest/sampler.log

# Start probing on entry.
ENTRYPOINT ["/bin/speedtest.sh"]
