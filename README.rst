speedtest_sampler
=================

Run `speedtest-cli <https://pypi.org/project/speedtest-cli>`_ at intervals
inside a Docker container.

.. image:: https://img.shields.io/docker/cloud/automated/shuntingyard/speedtest_http.svg
        :target: https://cloud.docker.com/repository/docker/shuntingyard/speedtest_http/
        :alt: Docker Image

Install and run
---------------

::

   docker pull shuntingyard/speedtest_sampler

   docker run -d -e OUTFILE=/root/speedtest.csv -v ~:/root shuntingyard/speedtest_sampler

Environment variables
---------------------

Interval between probes (sec)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

INTERVAL  (container default: 600)
                                                              
Absolute path to output file
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

OUTFILE   (container default: /var/lib/speedtest/speedtest.csv)
                                                              
Absolute path to logfile
~~~~~~~~~~~~~~~~~~~~~~~~

LOGFILE   (container default: /var/lib/speedtest/sampler.log)

Changelog
---------

0.0.2
~~~~~

- On error, empty records (timestamp only) are written to OUTFILE.

0.0.1
~~~~~

- Problems with container limiting tx speed are fixed.

TODO
----

- New option: make output format configurable ( csv | json ).
