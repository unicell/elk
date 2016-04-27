#!/usr/bin/env bash

# workaround for https://github.com/docker/docker/issues/7198
chown -R elasticsearch:elasticsearch /repo
chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/data

echo "Starting ElasticSearch"
gosu elasticsearch elasticsearch
