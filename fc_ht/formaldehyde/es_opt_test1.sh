#!/bin/sh
#PBS -l walltime=00:10:00
#PBS -l select=1:ncpus=1:mem=8GB

module load "gaussian/g16-c01-avx2" 
cp "/rds/general/user/rk820/home/dibs-g16/fc_ht/formaldehyde/./es_opt_test1.gjf" ./

#convert old checkpoints to latest (i.e. for g03 checkpoints generated before ~Dec 2009)
#c8609 "es_opt_test1.chk"

# no more pbsexec... running directly.
g16 es_opt_test1.gjf

cp *.log  /rds/general/user/rk820/home/dibs-g16/fc_ht/formaldehyde/./ 
cp *.chk  /rds/general/user/rk820/home/dibs-g16/fc_ht/formaldehyde/./

echo "For us, there is only the trying. The rest is not our business. ~T.S.Eliot"
