#!/bin/bash -l
# created: Feb 14, 2020 2:22 PM
# author: lizinan1
#SBATCH --account=project_2001353
#SBATCH --partition=large
#SBATCH --time=71:30:00
#SBATCH -N 16
#SBATCH --cpus-per-task=2
#SBATCH -J test
#SBATCH -e test
#SBATCH --mail-type=ALL
#SBATCH --mail-user=rongfei.juan@aalto.fi
 
### Change to the work directory
cd /scratch/project_2001353/Rongfei/DBNon/1/TDUni

### load modules and execute 
module load intel/19.0.4
module load gcc/8.3.0
module load pgi/19.7
module load openmpi/4.0.2

export DAMASK_NUM_THREADS=$SLURM_CPUS_PER_TASK
export LD_LIBRARY_PATH="/appl/opt/cluster_studio_xe2019/compilers_and_libraries_2019.4.243/linux/tbb/lib/intel64_lin/gcc4.7:/appl/opt/cluster_studio_xe2019/compilers_and_libraries_2019.4.243/linux/compiler/lib/intel64_lin:/appl/opt/cluster_studio_xe2019/compilers_and_libraries_2019.4.243/linux/mkl/lib/intel64_lin:/appl/spack/install-tree/intel-19.0.4/hpcx-mpi-2.4.0-keuon4/lib:/appl/opt/cluster_studio_xe2019/compilers_and_libraries_2019.4.243/linux/mpi/intel64/lib:/appl/opt/cluster_studio_xe2019/compilers_and_libraries_2019.4.243/linux/ipp/lib/intel64:/appl/opt/cluster_studio_xe2019/compilers_and_libraries_2019.4.243/linux/tbb/lib/intel64/gcc4.7:/appl/opt/cluster_studio_xe2019/debugger_2019/libipt/intel64/lib:/appl/opt/cluster_studio_xe2019/compilers_and_libraries_2019.4.243/linux/daal/lib/intel64_lin:/appl/opt/cluster_studio_xe2019/compilers_and_libraries_2019.4.243/linux/daal/../tbb/lib/intel64_lin/gcc4.4:/projappl/project_2001353/Zinan/damask2.0.2/petsc-3.9.4/linux-gnu-intel/lib/:/projappl/project_2001353/Zinan/damask2.0.2/fftw-3.3.8/mpi/.libs:/projappl/project_2001353/Zinan/damask2.0.2/fftw-3.3.8/.libs"
ulimit -s unlimited 

srun -n 8 /projappl/project_2001353/Zinan/damask2.0.2/DAMASK/bin/DAMASK_spectral -l tensionX.load -g RVE_1_40_D.geom > damask-log.txt
