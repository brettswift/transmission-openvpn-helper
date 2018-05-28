#!/bin/bash

# set -x
# Slack Webhook lives in the conf file. Load it. 
# this script is intended to be run inside the docker image.  The load_config.sh exists at this path:
. /data/load_config.sh 2>&1 >/dev/null

# change your channel from #notifications to match the one you used when you set up your webhook.
curl -X POST --data-urlencode 'payload={"channel": "#notifications", "username": "webhookbot", "text": "Torrent Complete", "icon_emoji": ":100:"}' ${SLACK_WEBHOOK_URL}

