#!/bin/sh
#PBS -l walltime=71:58:02
#PBS -l select=1:ncpus=32:mem=64GB:gpfs=false

module load "gaussian/g16-c01-avx2" 
cp "/rds/general/user/rk820/home/dibs-g16/test_temp/./ground_to_excited_state.gjf" ./

#convert old checkpoints to latest (i.e. for g03 checkpoints generated before ~Dec 2009)
#c8609 "ground_to_excited_state.chk"

# no more pbsexec... running directly.
g16 ground_to_excited_state.gjf

cp *.log  /rds/general/user/rk820/home/dibs-g16/test_temp/./ 
cp *.chk  /rds/general/user/rk820/home/dibs-g16/test_temp/./

echo "For us, there is only the trying. The rest is not our business. ~T.S.Eliot"
