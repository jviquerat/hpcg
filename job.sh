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
#SBATCH --ntasks=16
#SBATCH --ntasks-per-core=1
#SBATCH --threads-per-core=1
#
#SBATCH --nodelist=node-102
#
source job_source.sh
#
srun --cpu-bind=map_cpu:$PIN_OPTS hpcg/bin/xhpcg --nx=64 --ny=64 --nz=64 --rt=60
