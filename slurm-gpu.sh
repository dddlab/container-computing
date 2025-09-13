#!/bin/bash

#SBATCH -J pytorch_matmul_scaling_test       # Job name
#SBATCH -o pytorch_matmul_scaling_test.%j    # stdout output file (%j is jobId)
#SBATCH -p h100                              # Queue name
#SBATCH -N 1                                 # Number of nodes requested
#SBATCH -n 1                                 # Number of mpi tasks requested
#SBATCH -t 00:10:00                          # Run time (hh:mm:ss)

cd $SCRATCH

module load tacc-apptainer

echo "### Using CPUs"
apptainer exec --nv pytorch.sif python pytorch_matmul_scaling_test.py --no-gpu

echo "### Using GPUs"
apptainer exec --nv pytorch.sif python pytorch_matmul_scaling_test.py
