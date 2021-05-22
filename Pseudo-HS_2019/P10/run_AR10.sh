#!/bin/bash 
#PBS -A nn9572k
#PBS -l walltime=12:05:00
#PBS -l select=1:ncpus=32:mpiprocs=16

module purge
module load intelcomp/17.0.0
module load mpt/2.14
module load gromacs/2016.1

case=$PBS_JOBNAME
cd $PBS_O_WORKDIR


rm *#*

# gmx grompp -f em.mdp -c box.gro  -p topol.top -o em.tpr  -maxwarn 3
# mpiexec_mpt  mdrun   -s  em.tpr    -deffnm em   -table Table_HS_modif.xvg

# gmx grompp -f NVT_e.mdp -c em.gro -p topol.top -o NVT_e.tpr -maxwarn 3
# mpiexec_mpt  mdrun   -s  NVT_e.tpr    -deffnm NVT_e   -table Table_HS_modif.xvg

# gmx grompp -f NPT_e.mdp -c NVT_e.gro -p topol.top -o NPT_e.tpr   -maxwarn 3
# mpiexec_mpt  mdrun   -s  NPT_e.tpr    -deffnm NPT_e   -table Table_HS_modif.xvg

# gmx grompp -f NPT.mdp -c NPT_e.gro -p topol.top -o NPT.tpr   -maxwarn 3
# mpiexec_mpt  mdrun   -s  NPT.tpr    -deffnm NPT   -table Table_HS_modif.xvg

# gmx grompp -f NVT.mdp -c NPT.gro -p topol.top -o NVT.tpr   -maxwarn 3
# mpiexec_mpt  mdrun   -s  NVT.tpr    -deffnm NVT  -table Table_HS_modif.xvg


 gmx grompp -f NVT2.mdp -c NPT.gro -p topol.top -o NVT2.tpr   -maxwarn 3
  mpiexec_mpt  mdrun   -s  NVT2.tpr    -deffnm NVT2  -table Table_HS_modif.xvg
