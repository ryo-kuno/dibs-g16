#!/bin/sh
#PBS -l walltime=05:00:00
#PBS -l select=1:ncpus=32:mem=256GB

module load "gaussian/g16-c01-avx2" 
cp "/rds/general/user/rk820/home/dibs-g16/fc_ht/project/Phenanthrene/./Phenanthrene_project.gjf" ./

#convert old checkpoints to latest (i.e. for g03 checkpoints generated before ~Dec 2009)
#c8609 "Phenanthrene_project.chk"

# no more pbsexec... running directly.
g16 Phenanthrene_project.gjf

cp *.log  /rds/general/user/rk820/home/dibs-g16/fc_ht/project/Phenanthrene/./ 
cp *.chk  /rds/general/user/rk820/home/dibs-g16/fc_ht/project/Phenanthrene/./

echo "For us, there is only the trying. The rest is not our business. ~T.S.Eliot"
