#!/bin/sh
#PBS -l walltime=01:00:00
#PBS -l select=1:ncpus=1:mem=32GB

module load "gaussian/g16-c01-avx2" 
cp "/rds/general/user/rk820/home/dibs-g16/fc_ht/formaldehyde/./formaldehyde_es_STO-3G.gjf" ./

#convert old checkpoints to latest (i.e. for g03 checkpoints generated before ~Dec 2009)
#c8609 "formaldehyde_es_STO-3G.chk"

# no more pbsexec... running directly.
g16 formaldehyde_es_STO-3G.gjf

cp *.log  /rds/general/user/rk820/home/dibs-g16/fc_ht/formaldehyde/./ 
cp *.chk  /rds/general/user/rk820/home/dibs-g16/fc_ht/formaldehyde/./

echo "For us, there is only the trying. The rest is not our business. ~T.S.Eliot"
