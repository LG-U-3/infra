#!/bin/sh

echo "Waiting for Redis..."
until redis-cli -h redis -p 6379 ping | grep -q PONG; do
  sleep 1
done

echo "Creating Redis Stream & Consumer Group..."

redis-cli -h redis -p 6379 \
  XGROUP CREATE message-stream message-group '$' MKSTREAM 2>/dev/null || true

echo "Redis Stream init done"
