#!/usr/bin/env bash

# Wait for the Elasticsearch container to be ready before starting Kibana.
echo "Waiting for Elasticsearch"
while true; do
    nc -q 1 elasticsearch 9200 2>/dev/null && break
    sleep 1
done

echo "Starting Kibana"
kibana
