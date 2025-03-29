#!/bin/bash

while true; do
  # Random values to mimic CPU, memory, and disk usage
  cpu_usage=$(shuf -i 10-90 -n 1)
  mem_usage=$(shuf -i 30-95 -n 1)
  disk_usage=$(shuf -i 20-99 -n 1)

  # Write the metrics to a temporary file
  echo "# TYPE bash_cpu_usage gauge" > metrics.txt
  echo "bash_cpu_usage $cpu_usage" >> metrics.txt

  echo "# TYPE bash_memory_usage gauge" >> metrics.txt
  echo "bash_memory_usage $mem_usage" >> metrics.txt

  echo "# TYPE bash_disk_usage gauge" >> metrics.txt
  echo "bash_disk_usage $disk_usage" >> metrics.txt

  # Send the file to Pushgateway
  curl --data-binary @metrics.txt http://pushgateway:9091/metrics/job/bash_monitoring

  echo "Pushed -> CPU: $cpu_usage | MEM: $mem_usage | DISK: $disk_usage"
  sleep 10
done
