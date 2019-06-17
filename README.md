# speedtest_sampler

## Purpose

Run [speedtest-cli](https://pypi.org/project/speedtest-cli/) at intervals
inside a Docker container.

## New features in 0.0.1

- Containers log to a configurable path.

## TODO

- New option: make output format configurable ( csv | json ).

## Fixed

- Problems with limited tx speed (happens with recent `alpine` images
(e.g. `3.8` and `latest` at the time of writing).
