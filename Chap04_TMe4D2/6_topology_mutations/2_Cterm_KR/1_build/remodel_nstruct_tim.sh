#!/bin/bash

#SBATCH --job-name=NCterm_TMe4D2
#SBATCH --partition=veryshort
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=06:0:00
#SBATCH --mem=5GB

module purge

module load apps/rosetta/3.12


srun remodel.static.linuxgccrelease -s 39257152nd_3903471TMe4D2_RK_YW24_0038_optimized_relaxed_00011_000637_002313_0003_copy.pdb \
-remodel:blueprint NCterm.bp \
-ex1 -ex2 \
-mp:setup:spanfiles span_TMe4D2.span \
-ignore_unrecognized_res true \
-database /mnt/storage/software/apps/Rosetta-3.12/rosetta_bin_linux_2020.08.61146_bundle/main/database \
-remodel:num_trajectory 1000 -remodel:save_top 10 \
-out:path:all output_2 -out:suffix $SLURM_JOBID \
-out:prefix NCterm_ \