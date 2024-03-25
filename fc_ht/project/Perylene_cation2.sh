#!/bin/sh
#PBS -l walltime=07:58:59
#PBS -l select=1:ncpus=128:mem=916GB

module load "gaussian/g16-c01-avx2" 
cp "/rds/general/user/rk820/home/dibs-g16/fc_ht/project/./Perylene_cation1.gjf" ./

#convert old checkpoints to latest (i.e. for g03 checkpoints generated before ~Dec 2009)
#c8609 "Perylene_cation1.chk"

# no more pbsexec... running directly.
g16 Perylene_cation1.gjf

cp *.log  /rds/general/user/rk820/home/dibs-g16/fc_ht/project/./ 
cp *.chk  /rds/general/user/rk820/home/dibs-g16/fc_ht/project/./

echo "For us, there is only the trying. The rest is not our business. ~T.S.Eliot"
