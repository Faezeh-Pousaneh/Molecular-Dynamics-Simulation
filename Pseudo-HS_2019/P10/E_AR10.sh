#!/bin/bash 
#PBS -A nn9572k
#PBS -l walltime=07:05:00
#PBS -l select=1:ncpus=32:mpiprocs=16

module purge
module load intelcomp/17.0.0
module load mpt/2.14
module load gromacs/2016.1

case=$PBS_JOBNAME
cd $PBS_O_WORKDIR

rm MM_*
rm NPT.gro

 gmx convert-tpr  -s  NPT.tpr -extend  10000  -o NPT.tpr
 mpiexec_mpt  mdrun   -s  NPT.tpr    -deffnm NPT  -table Table_HS_modif.xvg  -append    -cpi  NPT.cpt


 gmx grompp -f NVT.mdp -c NPT.gro -p topol.top -o NVT.tpr   -maxwarn 3 -t NPT.cpt
 mpiexec_mpt  mdrun   -s  NVT.tpr    -deffnm NVT  -table Table_HS_modif.xvg


echo 0 | gmx tcaf  -f NVT.trr -s NVT.tpr -normalize -b 1000  -ov  MM_1000.xvg
echo 0 | gmx tcaf  -f NVT.trr -s NVT.tpr -normalize -b 2000  -ov  MM_2000.xvg
echo 0 | gmx tcaf  -f NVT.trr -s NVT.tpr -normalize -b 3000  -ov  MM_3000.xvg
echo 0 | gmx tcaf  -f NVT.trr -s NVT.tpr -normalize -b 4000  -ov  MM_4000.xvg

rm NVT.t*
rm NVT.x*


rm *#*

