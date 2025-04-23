#!/bin/bash

# Init registration flow
curl -s -X GET "http://localhost:4433/self-service/registration/api" > registration_flow.json

# Getting flow id
FLOW_ID=$(cat registration_flow.json | jq -r .id)
echo "Registration Flow ID: $FLOW_ID"

# Registration execution
curl -s -X POST "http://localhost:4433/self-service/registration?flow=$FLOW_ID" \
  -H "Content-Type: application/json" \
  -d '{
    "method": "password",
    "password": "demo-password1000",
    "traits": {
      "email": "demo1@example.com"
    }
  }' > registration.json
