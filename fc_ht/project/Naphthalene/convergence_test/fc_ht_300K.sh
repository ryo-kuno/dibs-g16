#!/bin/sh
#PBS -l walltime=03:00:00
#PBS -l select=1:ncpus=32:mem=256GB

module load "gaussian/g16-c01-avx2" 
cp "/rds/general/user/rk820/home/dibs-g16/fc_ht/project/Naphthalene/convergence_test/./fc_ht_300K.gjf" ./

#convert old checkpoints to latest (i.e. for g03 checkpoints generated before ~Dec 2009)
#c8609 "fc_ht_300K.chk"

# no more pbsexec... running directly.
g16 fc_ht_300K.gjf

cp *.log  /rds/general/user/rk820/home/dibs-g16/fc_ht/project/Naphthalene/convergence_test/./ 
cp *.chk  /rds/general/user/rk820/home/dibs-g16/fc_ht/project/Naphthalene/convergence_test/./

echo "For us, there is only the trying. The rest is not our business. ~T.S.Eliot"
