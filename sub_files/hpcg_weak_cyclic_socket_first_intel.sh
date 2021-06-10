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
#SBATCH --nodes=4
#SBATCH --ntasks=256
#SBATCH --ntasks-per-core=1
#SBATCH --threads-per-core=1
#
##SBATCH --nodelist=node-102
#
source /etc/profile.d/modules.sh
module load intel/mpi/latest
module load intel/compiler/latest
#
PINNING_OPTS="-genv OMP_NUM_THREADS=1 -genv I_MPI_PIN_PROCESSOR_LIST=0,8,16,24,1,9,17,25,2,10,18,26,3,11,19,27,4,12,20,28,5,13,21,29,6,14,22,30,7,15,23,31,32,40,48,56,33,41,49,57,34,42,50,58,35,43,51,59,36,44,52,60,37,45,53,61,38,46,54,62,39,47,55,63"
NET_OPTS="-genv FI_PROVIDER=mlx -genv I_MPI_OFI_PROVIDER=mlx -genv I_MPI_FABRICS=shm:ofi -genv I_MPI_SHM=clx_avx2 -genv I_MPI_HYDRA_IFACE=ib0 -genv I_MPI_HYDRA_PMI_CONNECT=alltoall -genv FI_MLX_TLS=rc,rc_x,shm,self -genv I_MPI_HYDRA_BRANCH_COUNT=-1 -genv I_MPI_MALLOC=1 -genv I_MPI_SHM_HEAP=1 -bootstrap ssh $PINNING_OPTS"
#
mpiexec.hydra -np $SLURM_NTASKS $NET_OPTS hpcg/bin/xhpcg --nx=64 --ny=64 --nz=64 --rt=60
