#!/bin/bash

#At what time script is exceuted
TIMESTAMP=$(date)

echo "script executed at:: $TIMESTAMP"


#start time and end time of the script

START_TIME=$(date +%s)
echo "Start time of the script :: $START_TIME"

sleep 10

END_TIME=$(date +%s)
echo "End time of the script :: $END_TIME"

TOTAL_TIME=$(($START_TIME-$END_TIME))
echo "Total time taken to execute the script is $TOTAL_TIME"
