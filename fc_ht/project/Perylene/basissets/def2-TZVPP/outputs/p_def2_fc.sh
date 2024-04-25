#!/bin/sh
#PBS -l walltime=01:00:00
#PBS -l select=1:ncpus=8:mem=64GB

module load "gaussian/g16-c01-avx2"
cp "/rds/general/user/rk820/home/dibs-g16/fc_ht/project/Perylene/basissets/def2-TZVPP/*.gjf" .
cp "/rds/general/user/rk820/home/dibs-g16/fc_ht/project/Perylene/basissets/def2-TZVPP/*.chk" .

# List files to debug
ls -l /rds/general/user/rk820/home/dibs-g16/fc_ht/project/Perylene/basissets/def2-TZVPP/

# Assuming conversion is necessary and the tool is available
# ./c8609 "p_def2_fc.chk"

g16 p_def2_fc.gjf

cp *.log  /rds/general/user/rk820/home/dibs-g16/fc_ht/project/Perylene/basissets/def2-TZVPP/
cp *.chk  /rds/general/user/rk820/home/dibs-g16/fc_ht/project/Perylene/basissets/def2-TZVPP/

echo "For us, there is only the trying. The rest is not our business. ~T.S.Eliot"

