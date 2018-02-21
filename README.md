# slurmr
Repository containing functionality to generate batch files for slurm cluster system

## Installation

To install, just use:
```
devtools::install_github("MansMeg/slurmr")
```

## Usage

The package is built upon the object `sbatch` that is one sbatch script file. To create a sbatch job just use the constructor `sbatch()`:

```
> a_job <- slurmr::sbatch(code = "Rscript -e \"print('Hello World')\"", add_status = TRUE)
> a_job
#!/bin/bash 
# 
#SBATCH -t 01:00:00 
#SBATCH --output="slurm-%j.out" 

# Run status sbatch script  
echo "username: $USER" 
date 
projinfo 
git log -n 1 
pwd 

# Main code 
Rscript -e "print('Hello World')"
```

See documentation for all installed arguments to the constructor. The main argument is code that is used to set the code to run.

To write the files to a folder together with a `run_all.sh` script to submit all sbatch files use: 

```
> slurmr::write_sbatch_list(a_job)
```

