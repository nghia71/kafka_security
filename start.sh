#!/bin/bash

# Exit if encounters non-zero (unsuccessful) status or unset environment variable(s)/parameter(s)
set -e -u

if [ ! -d "kafka-ce/zk" ]; then
    echo "The cluster is not setup yet ❌";
    exit 1
fi

echo "Start all services ...";
docker compose up -d
./utils/wait_for_kafka.sh
echo "All services have started ✅";
