#!/bin/bash -l
module load miniconda3 
pushd ..
conda create --name ompl-env python=3.10 -y
conda activate ompl-env
pip install -r requirements.txt
conda deactivate
popd