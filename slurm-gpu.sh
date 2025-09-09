#!/bin/bash
#SBATCH --job-name=GPU_Job
#SBATCH --time=01:30:00
#SBATCH --ntasks=1
#SBATCH --mem=16G
#SBATCH --output=testing/gpu_test_output.%j
#SBATCH --partition=cpu
cd $SCRATCH
export SINGULARITY_CACHEDIR=$TMPDIR/.singularity
module load WebProxy
singularity pull customized_docker.sif docker://ghcr.io/392781/4-customized:latest
singularity exec customized_docker.sif radian --version
exit
