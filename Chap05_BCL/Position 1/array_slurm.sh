#!/bin/bash

#SBATCH --job-name=BCL1
#SBATCH --partition=serial_verylong
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=7-00:0:00
#SBATCH --mem=6GB
#SBATCH --array=1-28

module load apps/rosetta/3.12

rosetta_scripts.static.linuxgccrelease @flags_flexbb -out:suffix ${SLURM_ARRAY_TASK_ID}_unsats -out:prefix $SLURM_JOBID -out:file:silent struct_28_$SLURM_ARRAY_TASK_ID

