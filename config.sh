#!/bin/bash

# Set sbatch parameters
TIME="0:15:00"
PARTITION="broadwl"
MEMORY="2G"
CPUS=1
CORES=28

# Set the maximum number of jobs allowed
MAXJOBS=99

# Set the QUEUE file path
QUEUE="queue/queue.txt"
