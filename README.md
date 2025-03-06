# Vector Method Docker Repository

This repository provides the code and dataset from the paper: [Real-Time Goal Recognition Using Approximations in Euclidean](https://ebooks.iospress.nl/doi/10.3233/FAIA240914)

## Docker Image

The Docker image contains all required code and dependencies. You can pull it using:

```
docker pull douglasat/vector_method
```

## Running the Docker Image in Interactive Mode

To run the Docker container in interactive mode, use:

```
docker run -it douglasat/vector_method
```

This will give you access to a shell where you can execute commands inside the container.

## Running Methods Inside the Interactive Docker

### Running the Continuous Domain Method
To execute the continuous domain method, run:

```
python3 ~/app/Vector-Estimation/Continuous/python3 estimation_method_multiple.py Caldera 2 5
```

The example above runs the method on the scenario "Caldera", computing two problems in parallel and using the top 5 solutions in the inference process.

A list of available scenarios is found on the directory:
```
~/app/Vector-Estimation/Continuous/scenarios
```

### Running the Discrete Domain Method
To execute the discrete domain method, run:

```
python3 ~/app/Vector-Estimation/Discrete/python3 test_domain.py "experiments/" ferry-optimal "vector_inference" 5
```
The example above runs the method on the ferry-optimal dataset experiments using the top 5 solutions in the inference process.

A list of available experiments is found on the directory:
```
~/app/Vector-Estimation/Discrete/experiments
```
