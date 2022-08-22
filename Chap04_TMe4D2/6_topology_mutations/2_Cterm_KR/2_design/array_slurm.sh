#!/bin/bash

#SBATCH --job-name=NtermMet
#SBATCH --partition=veryshort
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=06:0:00
#SBATCH --mem=6GB

module purge
module load apps/rosetta/3.12

srun rosetta_scripts.static.linuxgccrelease @flags_mutate_repack
