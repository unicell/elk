#!/usr/bin/env bash

# workaround for https://github.com/docker/docker/issues/7198
chown -R elasticsearch:elasticsearch /repo

echo "Starting ElasticSearch"
gosu elasticsearch elasticsearch
