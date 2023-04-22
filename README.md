# The Phoenix

---

Utility for immortal jobs with slurm scheduler


## Usage

```
phnx.sh 

```

## Editing config

```
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

```

+ Note the different sbatch parameters to be set
+ Importantly set the path of the queue
+ the config file itself must be named `config.sh` and be at the current directory
+ the config.sh file must be executable

## Checking status

Run 

```
phnx_status.sh <newly_created_phnx_directory>


```
