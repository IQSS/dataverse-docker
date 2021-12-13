#!/bin/bash

# Running python script to invoke webhooks
if [ "${WEBHOOK}" ]; then
    /usr/bin/python3.6 ${WEBHOOK} &
    echo 'Setting webhook on ' + ${WEBHOOK} >> /tmp/status.log
fi
