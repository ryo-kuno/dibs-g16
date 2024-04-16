#!/bin/sh
#PBS -l walltime=05:00:00
#PBS -l select=1:ncpus=128:mem=915GB

module load "gaussian/g16-c01-avx2" 
cp "/rds/general/user/rk820/home/dibs-g16/fc_ht/project/Perylene/basissets/STO-3G/./p_sto.gjf" ./

#convert old checkpoints to latest (i.e. for g03 checkpoints generated before ~Dec 2009)
#c8609 "p_sto.chk"

# no more pbsexec... running directly.
g16 p_sto.gjf

cp *.log  /rds/general/user/rk820/home/dibs-g16/fc_ht/project/Perylene/basissets/STO-3G/./ 
cp *.chk  /rds/general/user/rk820/home/dibs-g16/fc_ht/project/Perylene/basissets/STO-3G/./

echo "For us, there is only the trying. The rest is not our business. ~T.S.Eliot"