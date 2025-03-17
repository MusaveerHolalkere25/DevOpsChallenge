## Create a script that checks if a website (e.g., https://www.learnxops.com) is reachable using curl or ping. Print a success or failure message.

#!/bin/bash

# Define the website to check
WEBSITE="https://www.learnxops.com"
DOMAIN="learnxops.com"

# Check website availability using curl
if curl -Is "$WEBSITE" --max-time 5 | head -n 1 | grep -q "200\|301\|302"; then
    echo "✅ Success: $WEBSITE is reachable via curl!"
else
    echo "⚠️ Curl check failed, trying ping..."
    
    # Check website availability using ping
    if ping -c 2 -W 2 "$DOMAIN" > /dev/null 2>&1; then
        echo "✅ Success: $DOMAIN is reachable via ping!"
    else
        echo "❌ Failure: $WEBSITE is not reachable via curl or ping."
    fi
fi