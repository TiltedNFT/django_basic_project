#!/usr/bin/env bash

host="$1"
shift
port="$1"
shift
cmd="$@"

echo "Waiting for $host:$port..."

until nc -z "$host" "$port"; do
  >&2 echo "Waiting for $host:$port..."
  sleep 1
done

>&2 echo "$host:$port is up - executing command"
exec $cmd
