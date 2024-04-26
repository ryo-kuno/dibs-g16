#!/bin/sh
#PBS -l walltime=04:00:00
#PBS -l select=1:ncpus=64:mem=256GB

module load "gaussian/g16-c01-avx2" 
cp "/rds/general/user/rk820/home/dibs-g16/fc_ht/project/Perylene/basissets/def2-TZVPP/./p_def2_fix.gjf" ./

#convert old checkpoints to latest (i.e. for g03 checkpoints generated before ~Dec 2009)
#c8609 "p_def2_fix.chk"

# no more pbsexec... running directly.
g16 p_def2_fix.gjf

cp *.log  /rds/general/user/rk820/home/dibs-g16/fc_ht/project/Perylene/basissets/def2-TZVPP/./ 
cp *.chk  /rds/general/user/rk820/home/dibs-g16/fc_ht/project/Perylene/basissets/def2-TZVPP/./

echo "For us, there is only the trying. The rest is not our business. ~T.S.Eliot"
