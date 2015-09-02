#!/usr/bin/env sh

# Wait for the Elasticsearch container to be ready before starting Kibana.
echo "Waiting for Elasticsearch"
while ! nc -vz ${ES_HOST} 9200; do
    sleep 1
done

sed -i -e "s/ES_HOST/${ES_HOST}/g" /opt/kibana/config.js

echo "Starting Kibana"
/usr/bin/twistd -n web --path /opt/kibana/
