#!/bin/bash

#SBATCH --job-name=loop_TM4D2
#SBATCH --partition=serial
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=03-0:0:00
#SBATCH --mem=5GB

module purge

module load apps/rosetta/3.12


srun remodel.static.linuxgccrelease -s optimized3779965transformed_leu4D219_0031_0001_noembed.pdb \
-remodel:blueprint TM4D2_19_03_reamploops.bp \
-ex1 -ex2 \
-mp:setup:spanfiles leu4D2_rosetta.span \ 
-ignore_unrecognized_res true
-database /mnt/storage/software/apps/Rosetta-3.12/rosetta_bin_linux_2020.08.61146_bundle/main/database \
-remodel:num_trajectory 1000 -remodel:save_top 10 \
-out:path:all output_reamploops_2 -out:suffix $SLURM_JOBID \
-out:prefix reamploops_