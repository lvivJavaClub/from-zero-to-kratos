#!/bin/bash

SESSION_TOKEN=$(cat session.json | jq -r .session_token)
echo "Session token: $SESSION_TOKEN"

# Using the Authorization header
curl -s -X GET "http://localhost:4433/sessions/whoami" \
  -H "Authorization: Bearer $SESSION_TOKEN" | jq

echo "\n"
# Alternative option with X-Session-Token
curl -s -X GET "http://localhost:4433/sessions/whoami" \
  -H "X-Session-Token: $SESSION_TOKEN" | jq
