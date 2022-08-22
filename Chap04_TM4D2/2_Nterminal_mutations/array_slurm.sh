#!/bin/bash

#SBATCH --job-name=nterm_mut
#SBATCH --partition=serial
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=3-00:0:00
#SBATCH --mem=6GB
#SBATCH --array=1-10

module load apps/rosetta/3.12

srun rosetta_scripts.static.linuxgccrelease @flags_mutate_repack -out:suffix $SLURM_ARRAY_TASK_ID -out:prefix $SLURM_JOBID -out:file:silent struct_100_$SLURM_ARRAY_TASK_ID

