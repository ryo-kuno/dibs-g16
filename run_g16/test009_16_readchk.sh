#PBS -l walltime=0:01:00
#PBS -l select=1:ncpus=1:mem=2gb
#PBS -joe

module load gaussian/g16-c01-avx2 

echo 'test009_16_readchk.com'
which g16
g16 < $HOME/run_g16/test009_16_readchk.com > $HOME/run_g16/test009_16_readchk.log
echo 'finished test009_16_readchk.com'

