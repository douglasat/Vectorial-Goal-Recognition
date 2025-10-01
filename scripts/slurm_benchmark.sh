#!/bin/bash -l

module load miniconda3

echo "Started running on $(hostname)"

conda activate ompl-env

# Parameters
topk=15
parallel=1
save_name=multi_topk15
CPUS=$((topk * parallel))

cd Vectorial-Goal-Recognition/Continuous/vector_inference

srun --nodes=1 --mem=64G --ntasks=1 --cpus-per-task=${CPUS} \
    -e slurm.p${parallel}.t${topk}.n${save_name}.err \
    -o slurm.p${parallel}.t${topk}.n${save_name}.out \
    python3 compute_experiments.py -p $parallel -a $topk -n $save_name

wait
