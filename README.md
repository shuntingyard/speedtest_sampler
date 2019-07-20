# speedtest_sampler

Run [speedtest-cli](https://pypi.org/project/speedtest-cli/) at intervals
inside a Docker container.

![Docker build status](https://img.shields.io/docker/cloud/automated/shuntingyard/speedtest_sampler.svg)
![Docker pulls](https://img.shields.io/docker/pulls/shuntingyard/speedtest_sampler.svg)

## Install and run

### Getting started

```
docker pull shuntingyard/speedtest_sampler

docker run -d -e OUTFILE=/root/speedtest.csv -v ~:/root shuntingyard/speedtest_sampler
```

### Environment variables

| Name | Description | Unit | Default |
| --- | --- | --- | --- |
| INTERVAL | interval between probes | seconds | 600 |
| OUTFILE | absolute path to output file || /var/lib/speedtest/speedtest.csv |
| LOGFILE | absolute path to logfile || /var/lib/speedtest/sampler.log |

## Changelog

### 0.0.2

- On error, empty records (timestamp only) are written to OUTFILE.

### 0.0.1

- Containers log to a configurable path.
- Problems with container limiting tx speed are fixed.

## TODO

- [ ] New option: make output format configurable ( csv | json ).
- [ ] Expose a REST interface to read output remotely.
