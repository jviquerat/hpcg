# HPCG

HPCG is a widespread benchmark used to evalutate performance of HPC architectures. The project is hosted <a href="https://www.hpcg-benchmark.org/">here</a>. Below is just a short tutorial on how to use it.

## Compiling

To compile with Make with pure MPI support, move to `hpcg`, then: 

```
make arch=Linux_MPI
````

which should generate the `xhpcg` binary in the `bin` repository.

## Running

There are several ways to run `hpcg` from command line. The first option is to use the following command:

```
mpirun -n 4 xhpcg --nx=16 --nx=32 --nz=16 --rt=30
```

`nx`, `ny` and `nz` specify the size of the **local problems** (*i.e.* the problem size for each MPI process), while `rt` specifies the approximate duration. `n*` values below `16` are defaulted to `16`. Be aware that, due to the multigrid algorithm, **these numbers must be divisible by 8**. The above command will run the benchmark for approximately 30 seconds on 4 MPI processes, using local problem sizes of `16x32x16`. You can verify it by opening the ouput `.txt` file:

```
...
Machine Summary=
Machine Summary::Distributed Processes=8
Machine Summary::Threads per processes=1
Global Problem Dimensions=
Global Problem Dimensions::Global nx=32
Global Problem Dimensions::Global ny=64
Global Problem Dimensions::Global nz=32
Processor Dimensions=
Processor Dimensions::npx=2
Processor Dimensions::npy=2
Processor Dimensions::npz=2
Local Domain Dimensions=
Local Domain Dimensions::nx=16
Local Domain Dimensions::ny=32
Local Domain Dimensions::Lower ipz=0
Local Domain Dimensions::Upper ipz=1
Local Domain Dimensions::nz=16
...
```

Another possibility consists in also providing the number of processes per dimension:

```
mpirun -n 4 xhpcg --npx=2 --npy=2 --npz=2 --nx=16 --nx=32 --nz=16 --rt=30
```

This option is useful to perform strong scaling studies.

## Remarks and benchmarking

The local problem size can make a large difference, as small problems may more easily fit in cache, resulting in improved performances. It is important to account for it when interpreting performance results. As it is easy to specify local problem sizes, weak scaling benchmark is extremely easy to perform, while one has to select a valid global problem size to perform a strong scaling study. The default problem size is `104x104x104`.

Although the official duration of the benchmarks should be above 30 minutes, <a href="https://www.hpcadvisorycouncil.com/pdf/HPCG_Analysis_and_Profiling.pdf">some sources</a> suggest that it does not make a large difference. For quick testing, we suggest to use 1 minute.

## Slurm submission script

A slurm submission script:

```
#!/bin/bash
#
#SBATCH --job-name=hpcg
#SBATCH --output=hpcg.txt
#
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --ntasks-per-node=1
#SBATCH --ntasks-per-core=1
#SBATCH --threads-per-core=1
#SBATCH --account=calcul
#SBATCH --partition=equipment_typeC
#SBATCH --time=10:00
#SBATCH --export=ALL

module load openmpi/4.1.1
export OMPI_MCA_btl=^openib
mpirun hpcg/bin/xhpcg --nx=104 --ny=104 --nz=104 --rt=120
```
