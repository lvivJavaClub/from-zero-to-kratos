#!/bin/bash

# Init login flow
curl -s -X GET "http://localhost:4433/self-service/login/api" > login_flow.json

# Getting Flow ID
FLOW_ID=$(cat login_flow.json | jq -r .id)
echo "Login Flow ID: $FLOW_ID"

# Performing a login and getting a session_token
curl -s -X POST "http://localhost:4433/self-service/login?flow=$FLOW_ID" \
  -H "Content-Type: application/json" \
  -d '{
    "method": "password",
    "identifier": "user12345@example.com",
    "password": "secure-password12345"
  }' > session.json


SESSION_TOKEN=$(cat session.json | jq -r .session_token)
echo "Session Token: $SESSION_TOKEN"
