#!/bin/bash
#export YEAR_MONTH=$(date '+%Y-%m')
export YEAR_MONTH=2022-09
cd /opt/payara/counter-processor/counter-processor-${COUNTERPROSVERSION}
python3.8 main.py
