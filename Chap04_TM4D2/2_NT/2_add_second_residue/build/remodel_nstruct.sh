#!/bin/bash

#SBATCH --job-name=nterm_TM4D2
#SBATCH --partition=serial
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=03-0:0:00
#SBATCH --mem=5GB

module purge
module load apps/rosetta/3.12


srun remodel.static.linuxgccrelease -s TM4D2_19_31_NtermMut_relaxed_0345_0001.pdb \
-remodel:blueprint TM4D2_19_31_NtermMut_relaxed.bp \
-ex1 -ex2 \
-ignore_unrecognized_res true \
-database /mnt/storage/software/apps/Rosetta-3.12/rosetta_bin_linux_2020.08.61146_bundle/main/database \
-remodel:num_trajectory 1000 -remodel:save_top 10 \
-out:path:all output_2ndPosAdd -out:suffix $SLURM_JOBID \
-out:prefix 2ndPosAdd_