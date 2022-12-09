mkdir log/
mkdir err/
mkdir out/


#Setup conda environment for condor scripts
conda create --name condor-env
conda activate condor-env
conda install -c conda-forge python-htcondor
