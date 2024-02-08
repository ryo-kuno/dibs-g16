#!/bin/sh
#PBS -l walltime=7:00:00
#PBS -l select=1:ncpus=32:mem=128GB

module load "gaussian/g16-c01-avx2" 
cp "/rds/general/user/rk820/home/dibs-g16/fc_ht/exercise_8-7/./DPB_TD_cpu.gjf" ./

#convert old checkpoints to latest (i.e. for g03 checkpoints generated before ~Dec 2009)
#c8609 "DPB_TD_cpu.chk"

# no more pbsexec... running directly.
g16 DPB_TD_cpu.gjf

cp *.log  /rds/general/user/rk820/home/dibs-g16/fc_ht/exercise_8-7/./ 
cp *.chk  /rds/general/user/rk820/home/dibs-g16/fc_ht/exercise_8-7/./

echo "For us, there is only the trying. The rest is not our business. ~T.S.Eliot"
