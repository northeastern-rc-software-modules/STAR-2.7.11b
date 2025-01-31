# STAR-2.7.11b
RNA-seq aligner

This repository contains the files that were used to generate the STAR--2.7.11b module on the Northeastern University Explorer HPC cluster and the output files from the deployment. 

## Research Computing Instructions
To install this module on the HPC cluster, verify the environmental variable `CLUSTER_DIRECTORY`is set in `env_star—2.7.11b.sh` to the directory you want to deploy the installation to and run:

```bash
sbatch install_star—2.7.11b.sh
```

## Project Directory/ Local Installation Instructions
To install this software in a /projects directory on the HPC cluster, verify the environmental variable `CLUSTER_DIRECTORY`is set in `env_star—2.7.11b.sh` to the directory you want to deploy the installation to such as `/projects/foo/bar` where `foo` is a `/project` directory you have access to and the installation will be completed in the directory `bar`. Please also comment out:

```bash
# mkdir -p $CLUSTER_DIRECTORY/modulefiles/$SOFTWARE_NAME
# cp $SOFTWARE_VERSION $CLUSTER_DIRECTORY/modulefiles/$SOFTWARE_NAME/$SOFTWARE_VERSION
```

To install, please run:

```bash
sbatch install_star—2.7.11b.sh
```

## Using a Local Installation
### `srun` Usage
From an `srun` session, run the `source` command from the directory with `env_star—2.7.11b.sh`:

```bash
srun --pty /bin/bash
source env_star—2.7.11b.sh
```

### `sbatch` Usage
An example of an `sbatch` script utilizing a local installation:

```bash
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -p short

source env_star—2.7.11b.sh

# Your code below
```
