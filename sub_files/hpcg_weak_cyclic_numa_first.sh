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
#SBATCH --nodes=1
#SBATCH --ntasks=64
#SBATCH --ntasks-per-core=1
#SBATCH --threads-per-core=1
#
#SBATCH --nodelist=node-101
#
module load openmpi/4.1.1
export OMPI_MCA_btl=^openib
srun --cpu-bind=map_cpu:0,8,16,24,32,40,48,56,1,9,17,25,33,41,49,57,2,10,18,26,34,42,50,58,3,11,19,27,35,43,51,59,4,12,20,28,36,44,52,60,5,13,21,29,37,45,53,61,6,14,22,30,38,46,54,62,7,15,23,31,39,47,55,63 hpcg/bin/xhpcg --nx=64 --ny=64 --nz=64 --rt=60
