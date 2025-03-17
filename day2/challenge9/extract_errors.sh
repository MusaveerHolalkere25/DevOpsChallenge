## Use awk or sed in a script to process a log file and extract only error messages.

#extract_errors.sh
#!/bin/bash

# Define log file path
LOG_FILE="/var/log/syslog"  # Change this to your log file
OUTPUT_FILE="error_messages.log"

# Check if log file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "❌ Error: Log file '$LOG_FILE' not found!"
    exit 1
fi

# Extract error messages using awk
awk '/error|ERROR|Error/ {print}' "$LOG_FILE" > "$OUTPUT_FILE"

# Alternatively, use sed:
# sed -n '/error\|ERROR\|Error/p' "$LOG_FILE" > "$OUTPUT_FILE"

echo "✅ Extracted error messages saved to '$OUTPUT_FILE'."
