#!/bin/sh
#PBS -l walltime=10:00:00
#PBS -l select=1:ncpus=16:mem=64GB

module load "gaussian/g16-c01-avx2" 
cp "/rds/general/user/rk820/home/dibs-g16/fc_ht/exercise_8-7/./DPB_gs.chk" ./
cp "/rds/general/user/rk820/home/dibs-g16/fc_ht/exercise_8-7/./DPB_gs.gjf" ./

#convert old checkpoints to latest (i.e. for g03 checkpoints generated before ~Dec 2009)
#c8609 "DPB_gs.chk"

# no more pbsexec... running directly.
g16 DPB_gs.gjf

cp *.log  /rds/general/user/rk820/home/dibs-g16/fc_ht/exercise_8-7/./ 
cp *.chk  /rds/general/user/rk820/home/dibs-g16/fc_ht/exercise_8-7/./

echo "For us, there is only the trying. The rest is not our business. ~T.S.Eliot"
