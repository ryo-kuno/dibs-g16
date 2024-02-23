#!/bin/sh
#PBS -l walltime=01:00:00
#PBS -l select=1:ncpus=32:mem=128GB

module load "gaussian/g16-c01-avx2" 
cp "/rds/general/user/rk820/home/dibs-g16/fc_ht/formaldehyde/link1_tests/6-31G/./manual_displacement_6-31G.gjf" ./

#convert old checkpoints to latest (i.e. for g03 checkpoints generated before ~Dec 2009)
#c8609 "manual_displacement_6-31G.chk"

# no more pbsexec... running directly.
g16 manual_displacement_6-31G.gjf

cp *.log  /rds/general/user/rk820/home/dibs-g16/fc_ht/formaldehyde/link1_tests/6-31G/./ 
cp *.chk  /rds/general/user/rk820/home/dibs-g16/fc_ht/formaldehyde/link1_tests/6-31G/./

echo "For us, there is only the trying. The rest is not our business. ~T.S.Eliot"
