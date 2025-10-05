import subprocess
import os
import argparse

if __name__ == "__main__":
    directory_path = os.path.dirname(__file__)

    parser = argparse.ArgumentParser(description="Run Vector Estimation experiments")
    parser.add_argument("-p", "--parallel", type=int, required=True, help="Number of parallel problems")
    parser.add_argument("-t", "--topk", type=int, required=False, help="Number of tok-k solutions used")
    parser.add_argument("-n", "--save_name", type=str, required=True, help="Name to register solution")
    parser.add_argument("-m", "--method", type=str, required=True, help="Method of goal recognition inference")
    args = parser.parse_args()
    num_cores = args.parallel
    topk = args.topk
    save_name = args.save_name
    method = args.method

    # Get all files in the directory dataset
    scenarios = [file[:-4] for file in os.listdir('../starcraft_dataset/scenarios')]
    scenarios = sorted(scenarios)
   
    for scenario in scenarios:
        if method  == 'mirroring':
            print(f'Computing Mirroring Recognition on Scenario {scenario}')
            subprocess.run(f'python3 baseline_method.py -s {scenario} -p {num_cores} -n {save_name}', shell=True)
        
        if method  == 'vector':
            print(f'Computing Vector Recognition on Scenario {scenario}')
            subprocess.run(f'python3 estimation_method_multiple_mod.py -s {scenario} -p {num_cores} -t {topk} -n {save_name}', shell=True)
   