# Vector Method Docker Repository

This repository provides the code and dataset from the paper: [Real-Time Goal Recognition Using Approximations in Euclidean](https://ebooks.iospress.nl/doi/10.3233/FAIA240914)


## Requirements

- Python 3.10.12 
- Create a conda environment: `conda create -n ompl-env python=3.10.12`
- Conda activate: `conda activate ompl-env` 
- Required Python packages (install via `pip install -r requirements.txt`)  

## Continuous Domain 

### Running Experiments on All Scenarios

Run the scripts on the directory: `Vectorial-Goal-Recognition/Continuous/vector_inference`

```
python3 compute_experiments.py -p <num_parallel> -t <topk> -n <save_name>
```

| Argument          | Description                                              |
| ----------------- | -------------------------------------------------------- |
| `-p, --parallel`  | Number of parallel problems                              |
| `-t, --topk`      | Number of top-k solutions used in the vector estimation  |
| `-n, --save_name` | Name used to save the results                            |

### Running on a particular scenario
```
python3 estimation_method_multiple_mod.py -s <scenario> -p <num_cores> -t <topk> -n <save_name>
```
| Argument          | Description                                              |
| ----------------- | -------------------------------------------------------- |
| `-s, --scenario`  | Scenario name                                            |
| `-p, --parallel`  | Number of parallel problems                              |
| `-t, --topk`      | Number of top-k solutions used in the vector estimation  |
| `-n, --save_name` | Name used to save the results                            |

A list of available scenarios is found on the directory:
```
Vectorial-Goal-Recognition/Continuous/starcraft_dataset/scenarios
```
### Results directory
```
Vectorial-Goal-Recognition/Continuous/vector_inference/results
```
