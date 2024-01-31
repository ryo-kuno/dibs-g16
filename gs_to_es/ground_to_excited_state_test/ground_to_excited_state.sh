#PBS -l walltime=2:00:00
#PBS -l select=1:ncpus=1:mem=8gb
#PBS -joe

module load gaussian/g16-c01-avx2

echo 'ground_to_excited_state.gjf'
which g16
g16 < $HOME/ground_to_excited_state_test/ground_to_excited_state.gjf > $HOME/ground_to_excited_state_test/ground_to_excited_state.log
echo 'finished ground_to_excited_state.gjf'
~                                         
