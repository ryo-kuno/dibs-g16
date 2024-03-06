#!/bin/sh
#PBS -l walltime=01:00:00
#PBS -l select=1:ncpus=128:mem=920GB

module load "gaussian/g16-c01-avx2" 
cp "/rds/general/user/rk820/home/dibs-g16/fc_ht/exercise_8-7/proper/./HPC_limit_DPB.gjf" ./

#convert old checkpoints to latest (i.e. for g03 checkpoints generated before ~Dec 2009)
#c8609 "HPC_limit_DPB.chk"

# no more pbsexec... running directly.
g16 HPC_limit_DPB.gjf

cp *.log  /rds/general/user/rk820/home/dibs-g16/fc_ht/exercise_8-7/proper/./ 
cp *.chk  /rds/general/user/rk820/home/dibs-g16/fc_ht/exercise_8-7/proper/./

echo "For us, there is only the trying. The rest is not our business. ~T.S.Eliot"
