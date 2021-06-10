#!/bin/bash
#
#SBATCH --job-name=hpcg
#SBATCH --output=hpcg.txt
#SBATCH --time=10:00
#
#SBATCH --qos=normal
#SBATCH --partition=CPU
#SBATCH --export=ALL
#SBATCH --exclusive
#
#SBATCH --nodes=2
#SBATCH --ntasks=128
#SBATCH --ntasks-per-core=1
#SBATCH --threads-per-core=1
#
###SBATCH --nodelist=node-101
#
module load openmpi/4.1.1
#
#module load intel/mpi
#module load intel/compiler
#
srun --cpu-bind=map_cpu:0,8,16,24,1,9,17,25,2,10,18,26,3,11,19,27,4,12,20,28,5,13,21,29,6,14,22,30,7,15,23,31,32,40,48,56,33,41,49,57,34,42,50,58,35,43,51,59,36,44,52,60,37,45,53,61,38,46,54,62,39,47,55,63 hpcg/bin/xhpcg --nx=16 --ny=16 --nz=16 --rt=60
