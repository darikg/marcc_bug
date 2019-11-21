#!/bin/bash -l

#SBATCH
#SBATCH --job-name=marcc_bug
#SBATCH -t10
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=24
#SBATCH --partition=parallel

module restore matlab2019a


logfile="log$SLURM_ARRAY_TASK_ID.txt"

echo "Subjob $SLURM_ARRAY_TASK_ID" >> "$logfile"
pwd >> "$logfile"

matlab -nodesktop -nodisplay -nosplash -r save_some_data_parallel >> "$logfile"



