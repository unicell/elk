Overview
========

This repo contains my ELK toolstack to do various log analysis work. It comes
along with the Dockerfiles and Docker-compose files to build relavant images and
to start services.

Current this repo includes components of:

- ElasticSearch (2.1)
- Kibana 4
- Kibana 3 (managed in separate folder as it is built differently than Kibana 4)
- Logstash (2.1)
- Logstash-forwarder (0.4.0)
- Smokeping
- Graphite (0.9.12) / StatsD (0.7.2)
- Grafana (2.5.0)
- logsout
- cadvisor
- beats (1.0.1)

Image Management
================

Based on the needs, images are managed in different ways. Some are just vanilla
upstream Docker images (logspout / cadvisor). Some are upstream images with
minor updates mostly related to configs (es / logstash / kibana). Some are
upstream fork managed by git submodules (grafana, smokeping, graphite / statsd).

As time goes by, images need most customization needs will evolve to the 3rd
way of management.

Use Cases
=========

Comes along with the logstash, there're several processing pipelines I hacked to
parse OpenStack component logs for analysis / troubleshooting purpose.

Currently two pipelines are added into the repo.

nova-scheduler
--------------

To visualize or drill down the data of:

    * single request passing filters and weighers, with time duration
    * winning (chosen) candidate hosts with request id and timestamp
    * aggregated time cost (min, max, avg) for scheduling requests
    * when and how many times a single host being picked
    * resource snapshot view of scheduler for a single host
    * weight value distribution for winning hosts
    * how hot is a hypervisor? (e.g top 100 hosts being picked in last 1k
      scheduling requests)
    * how many successful requests per hour

swift-proxy
-----------

To visualize or drill down the data of:

    * overall request number and request number breakdown by backend nodes
    * overall throughput (upload / download) and breakdown by backend nodes
    * request method statistics
    * response code statistics
    * user agent top list
    * request by account top list
