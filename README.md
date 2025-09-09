# Supplement for "Container-driven Reproducible Research Made Simple"

![Container Build Status](https://img.shields.io/github/actions/workflow/status/392781/containerized-research-computing/build-image.yml?style=flat-square&logo=docsdotrs&label=Container%20Builds)

The following repository contains a number of example Docker based [Development Containers](https://containers.dev/) from our paper. All containers are listed under the `.devcontainer` directory with an additional SLURM script each can be tested on the following systems:

- Listing 1-6: Any system using Docker container engine
- Listing 9: Any system with a CUDA 12 enabled Nvidia GPU
- `slurm-gpu.sh`: Texas A&M University's FASTER cluster

## Usage

Before using this, you must have [Visual Studio Code](https://code.visualstudio.com/) (VS Code) and the [Dev Container extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) downloaded and installed. **Note:** Multiple container profiles used in this repository are not supported by GitHub Codespaces and therefore are only compatible with VS Code. *There is a default container that follows `4-customized` schema that will launch if using Codespaces.*


1. Clone the repository on your desired system:

```sh
git clone git@github.com:392781/containerized-research-computing.git
```

2. Open the cloned folder using VS Code.

3. Using the "Remote Window" interface, select "Reopen in Container":

![alt text](imgs/image.png)

![alt text](imgs/image-2.png)

4. Select the desired container to build:

![alt text](imgs/image-3.png)

5. If you wish to run the SLURM script, simply schedule it to be run by using `sbatch slurm-gpu.sh` on a compatible system. 
