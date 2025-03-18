## Create a script that monitors CPU and memory usage every 5 seconds and logs the results to a file.

#monitor_resources.sh
#!/bin/bash

# Define the log file
LOG_FILE="resource_usage.log"

echo "Monitoring CPU and Memory usage... Logs will be saved in $LOG_FILE"
echo "Timestamp          | CPU (%) | Memory (%)" > "$LOG_FILE"

# Infinite loop to log system usage every 5 seconds
while true; do
    TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
    
    # Get CPU usage
    CPU_USAGE=$(top -l  2 | grep -E "^CPU" | tail -1 | awk '{ print $3 + $5"%" }')
    
    # Get Memory usage
    MEM_USAGE=$(top -l 1 | grep -E "^Phys")
    
    # Write data to the log file
    echo "$TIMESTAMP |  $CPU_USAGE  |  $MEM_USAGE" >> "$LOG_FILE"
    
    # Wait for 5 seconds
    sleep 5
done