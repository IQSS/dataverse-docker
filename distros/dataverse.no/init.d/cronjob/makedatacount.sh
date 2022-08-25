#!/bin/bash
export YEAR_MONTH=$(date '+%Y-%m')
cd /opt/payara/counter-processor/counter-processor-${COUNTERPROSVERSION}
python3.8 main.py
