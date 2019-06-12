FROM alpine:3.8
MAINTAINER Tobias Frei (shuntingyard@gmail.com)

# One run to install packages required and create data dir.
RUN apk add --no-cache \
    speedtest-cli && \
    mkdir "/data"

# Copy context to image.
COPY . /

# Defaults settings for the container:
ENV INTERVAL 600
ENV CSV_OUT /data/speedtest.csv

# Start probing on entry.
ENTRYPOINT ["/bin/speedtest.sh"]
