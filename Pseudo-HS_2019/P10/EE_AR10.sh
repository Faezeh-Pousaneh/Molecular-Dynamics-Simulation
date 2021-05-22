#!/bin/bash 
#PBS -A nn9572k
#PBS -l walltime=01:05:00
#PBS -l select=4:ncpus=32:mpiprocs=16

module purge
module load intelcomp/17.0.0
module load mpt/2.14
module load gromacs/2016.1

case=$PBS_JOBNAME
cd $PBS_O_WORKDIR


 gmx grompp -f NVT2.mdp -c NPT.gro -p topol.top -o NVT2.tpr   -maxwarn 3  -t NPT.cpt
 mpiexec_mpt  mdrun   -s  NVT2.tpr    -deffnm NVT2  -table Table_HS_modif.xvg
