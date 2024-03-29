#!/bin/bash -l
#SBATCH --job-name=UMa_AoA_debug
#SBATCH --account=def-rsadve
#SBATCH --time=20:10:30          # adjust this to match the walltime of your job
#SBATCH --nodes=1      
#SBATCH --ntasks=1
#SBATCH --output=UMa_AoA_debug-%j.out
#SBATCH --cpus-per-task=1      # adjust this if you are using parallel commands
#SBATCH --mem-per-cpu=2G             # adjust this according to the memory requirement per node you need
#SBATCH --mail-user=y.fei@mail.utoronto.ca # adjust this to match your email address
#SBATCH --mail-type=END


######  Run Multithreaded Job
module load matlab
matlab -nodisplay -r AoA_debug

######  Run Parallel Job
# MAIN="AoA_MultiP"
# NWORKERS=${SLURM_NTASKS}
# NTHREADS=${SLURM_CPUS_PER_TASK}
# ARGS="($NWORKERS,$NTHREADS)"
# MAIN_WITH_ARGS=${MAIN}${ARGS}

# module load matlab
# matlab -batch "${MAIN_WITH_ARGS}"