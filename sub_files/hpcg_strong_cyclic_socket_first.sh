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
#SBATCH --nodes=16
#SBATCH --ntasks=1024
#SBATCH --ntasks-per-core=1
#SBATCH --threads-per-core=1
#
###SBATCH --nodelist=node-101
#
module load openmpi/4.1.1
export OMPI_MCA_btl=^openib
#1
#srun --cpu-bind=map_cpu:0,8,16,24,1,9,17,25,2,10,18,26,3,11,19,27,4,12,20,28,5,13,21,29,6,14,22,30,7,15,23,31,32,40,48,56,33,41,49,57,34,42,50,58,35,43,51,59,36,44,52,60,37,45,53,61,38,46,54,62,39,47,55,63 hpcg/bin/xhpcg --nx=256 --ny=256 --nz=256 --npx=1 --npy=1 --npz=1 --rt=60
#2
#srun --cpu-bind=map_cpu:0,8,16,24,1,9,17,25,2,10,18,26,3,11,19,27,4,12,20,28,5,13,21,29,6,14,22,30,7,15,23,31,32,40,48,56,33,41,49,57,34,42,50,58,35,43,51,59,36,44,52,60,37,45,53,61,38,46,54,62,39,47,55,63 hpcg/bin/xhpcg --nx=256 --ny=256 --nz=128 --npx=1 --npy=1 --npz=2 --rt=60
#4
#srun --cpu-bind=map_cpu:0,8,16,24,1,9,17,25,2,10,18,26,3,11,19,27,4,12,20,28,5,13,21,29,6,14,22,30,7,15,23,31,32,40,48,56,33,41,49,57,34,42,50,58,35,43,51,59,36,44,52,60,37,45,53,61,38,46,54,62,39,47,55,63 hpcg/bin/xhpcg --nx=256 --ny=128 --nz=128 --npx=1 --npy=2 --npz=2 --rt=60
#8
#srun --cpu-bind=map_cpu:0,8,16,24,1,9,17,25,2,10,18,26,3,11,19,27,4,12,20,28,5,13,21,29,6,14,22,30,7,15,23,31,32,40,48,56,33,41,49,57,34,42,50,58,35,43,51,59,36,44,52,60,37,45,53,61,38,46,54,62,39,47,55,63 hpcg/bin/xhpcg --nx=128 --ny=128 --nz=128 --npx=2 --npy=2 --npz=2 --rt=60
#16
#srun --cpu-bind=map_cpu:0,8,16,24,1,9,17,25,2,10,18,26,3,11,19,27,4,12,20,28,5,13,21,29,6,14,22,30,7,15,23,31,32,40,48,56,33,41,49,57,34,42,50,58,35,43,51,59,36,44,52,60,37,45,53,61,38,46,54,62,39,47,55,63 hpcg/bin/xhpcg --nx=128 --ny=128 --nz=64 --npx=2 --npy=2 --npz=4 --rt=60
#32
#srun --cpu-bind=map_cpu:0,8,16,24,1,9,17,25,2,10,18,26,3,11,19,27,4,12,20,28,5,13,21,29,6,14,22,30,7,15,23,31,32,40,48,56,33,41,49,57,34,42,50,58,35,43,51,59,36,44,52,60,37,45,53,61,38,46,54,62,39,47,55,63 hpcg/bin/xhpcg --nx=128 --ny=64 --nz=64 --npx=2 --npy=4 --npz=4 --rt=60
#64
#srun --cpu-bind=map_cpu:0,8,16,24,1,9,17,25,2,10,18,26,3,11,19,27,4,12,20,28,5,13,21,29,6,14,22,30,7,15,23,31,32,40,48,56,33,41,49,57,34,42,50,58,35,43,51,59,36,44,52,60,37,45,53,61,38,46,54,62,39,47,55,63 hpcg/bin/xhpcg --nx=64 --ny=64 --nz=64 --npx=4 --npy=4 --npz=4 --rt=60
#128
#srun --cpu-bind=map_cpu:0,8,16,24,1,9,17,25,2,10,18,26,3,11,19,27,4,12,20,28,5,13,21,29,6,14,22,30,7,15,23,31,32,40,48,56,33,41,49,57,34,42,50,58,35,43,51,59,36,44,52,60,37,45,53,61,38,46,54,62,39,47,55,63 hpcg/bin/xhpcg --nx=64 --ny=64 --nz=32 --npx=4 --npy=4 --npz=8 --rt=60
#256
#srun --cpu-bind=map_cpu:0,8,16,24,1,9,17,25,2,10,18,26,3,11,19,27,4,12,20,28,5,13,21,29,6,14,22,30,7,15,23,31,32,40,48,56,33,41,49,57,34,42,50,58,35,43,51,59,36,44,52,60,37,45,53,61,38,46,54,62,39,47,55,63 hpcg/bin/xhpcg --nx=64 --ny=32 --nz=32 --npx=4 --npy=8 --npz=8 --rt=60
#512
#srun --cpu-bind=map_cpu:0,8,16,24,1,9,17,25,2,10,18,26,3,11,19,27,4,12,20,28,5,13,21,29,6,14,22,30,7,15,23,31,32,40,48,56,33,41,49,57,34,42,50,58,35,43,51,59,36,44,52,60,37,45,53,61,38,46,54,62,39,47,55,63 hpcg/bin/xhpcg --nx=32 --ny=32 --nz=32 --npx=8 --npy=8 --npz=8 --rt=60
#1024
srun --cpu-bind=map_cpu:0,8,16,24,1,9,17,25,2,10,18,26,3,11,19,27,4,12,20,28,5,13,21,29,6,14,22,30,7,15,23,31,32,40,48,56,33,41,49,57,34,42,50,58,35,43,51,59,36,44,52,60,37,45,53,61,38,46,54,62,39,47,55,63 hpcg/bin/xhpcg --nx=32 --ny=32 --nz=16 --npx=8 --npy=8 --npz=16 --rt=60
