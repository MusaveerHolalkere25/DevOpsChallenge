## Write a script that automatically deletes log files older than 7 days from /var/log.


#clean_old_logs.sh
#!/bin/bash

# Define log directory
LOG_DIR="/var/log"

# Define file age threshold (in days)
DAYS=7

# Find and delete log files older than 7 days
find "$LOG_DIR" -type f -name "*.log" -mtime +$DAYS -exec rm -f {} \;

# Print success message
echo "✅ Deleted log files older than $DAYS days from $LOG_DIR."
