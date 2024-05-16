#!/bin/bash

# URL of the running application
URL="http://localhost:9999"

# Function to test an endpoint and display the result
test_endpoint() {
    endpoint=$1
    echo "Testing ${endpoint}..."
    
    response=$(curl -s -w "HTTP_STATUS:%{http_code}" "${URL}${endpoint}")
    
    # Extract the body and status
    body=$(echo "${response}" | sed -e 's/HTTP_STATUS\:.*//g')
    status=$(echo "${response}" | tr -d '\n' | sed -e 's/.*HTTP_STATUS://')
    
    if [ "${status}" -eq "200" ]; then
        echo "Response: ${body}"
    else
        echo "Error: HTTP Status ${status}, Response: ${body}"
    fi
    
    echo
}

# Test all endpoints
test_endpoint "/good"
test_endpoint "/bad"
test_endpoint "/error-bug"
test_endpoint "/error-memory"
