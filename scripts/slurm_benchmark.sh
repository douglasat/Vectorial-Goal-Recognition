#!/bin/bash -l

#SBATCH --job-name=Vector-Recognition
#SBATCH --nodes=1 # number of nodes
#SBATCH --ntasks=1 # number of tasks total
#SBATCH --cpus-per-task=30 # number of cores
#SBATCH --mem=64G # memory pool for all cores

#SBATCH --gres=gpu:0 # 0 GPU out of 3
#SBATCH --partition=uoa-compute

#SBATCH -o slurm.%j.out # STDOUT
#SBATCH -e slurm.%j.err # STDERR

#SBATCH --mail-type=ALL
#SBATCH --mail-user=felipe.meneguzzi@abdn.ac.uk


module load miniconda3

echo "Started running on $(hostname)"

conda activate ompl-env

# Parameters
topk=15
parallel=30
save_name=baseline
method=mirroring

if [ "$method" = "mirroring" ]; then
    CPUS=$((parallel))

elif [ "$method" = "vector" ]; then
    CPUS=$((topk * parallel))
else
    echo "Unknown method"
    exit 1
fi

pushd ../Continuous/vector_inference

srun --nodes=1 --mem=64G --ntasks=1 --cpus-per-task=${CPUS} \
    -e slurm.p${parallel}.t${topk}.n${save_name}.m${method}.err \
    -o slurm.p${parallel}.t${topk}.n${save_name}.m${method}.out \
    python3 compute_experiments.py -p $parallel -t $topk -n $save_name -m $method

wait