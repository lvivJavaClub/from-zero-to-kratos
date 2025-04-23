#!/bin/bash

SESSION_TOKEN=$(cat session.json | jq -r .session_token)
echo "Session token: $SESSION_TOKEN"

curl -X DELETE \
  -H "Authorization: Bearer $SESSION_TOKEN" \
  "http://localhost:4433/sessions/self"

echo "Logout request successfully sent."


curl -s -X GET "http://localhost:4433/sessions/whoami" \
  -H "Authorization: Bearer $SESSION_TOKEN" | jq
