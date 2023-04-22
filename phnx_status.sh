#!/bin/bash

# Read the configuration file
source config.sh

# If an output directory is specified as an argument, use it; otherwise, use the current directory
if [ $# -eq 1 ]; then
    OUTDIR=$1
else
    OUTDIR="."
fi

# Read the original number of tasks and the start time from phnx_info.txt in the specified output directory
IFS=":" read -r ORIG_TASKS START_TIME < "${OUTDIR}/phnx_info.txt"

# Calculate the current number of tasks, tasks done, and percentage complete
CURR_TASKS=$(wc -l < $QUEUE)
TASKS_DONE=$((ORIG_TASKS - CURR_TASKS))
PERCENT_COMPLETE=$(awk "BEGIN {printf \"%.2f\", (${TASKS_DONE} / ${ORIG_TASKS}) * 100}")

# Calculate the total time elapsed, average time per iteration, and estimated time to completion
ELAPSED_TIME=$(($(date +%s) - START_TIME))
AVG_TIME_PER_ITERATION=$((ELAPSED_TIME / TASKS_DONE))
ESTIMATED_TIME_TO_COMPLETION=$((AVG_TIME_PER_ITERATION * CURR_TASKS))

# Convert times to human-readable format
ELAPSED_TIME_FORMAT=$(date -u -d @${ELAPSED_TIME} +"%T")
AVG_TIME_PER_ITERATION_FORMAT=$(date -u -d @${AVG_TIME_PER_ITERATION} +"%T")
ESTIMATED_TIME_TO_COMPLETION_FORMAT=$(date -u -d @${ESTIMATED_TIME_TO_COMPLETION} +"%T")

# Output the results
echo "Tasks: ${ORIG_TASKS}"
echo "Tasks done: ${TASKS_DONE}"
echo "Percentage complete: ${PERCENT_COMPLETE}%"
echo "Elapsed time: ${ELAPSED_TIME_FORMAT}"
echo "Average time per task: ${AVG_TIME_PER_ITERATION_FORMAT}"
echo "Estimated time to completion: ${ESTIMATED_TIME_TO_COMPLETION_FORMAT}"
