#!/bin/bash

# Slack Webhook lives in the conf file. Load it. 
. ../load_config.sh

# change your channel from #notifications to match the one you used when you set up your webhook.
curl -X POST --data-urlencode 'payload={"channel": "#notifications", "username": "webhookbot", "text": "Torrent Complete", "icon_emoji": ":100:"}' ${SLACK_WEBHOOK_URL}

