To make gridpacks you need to:

-Get the genproductions code from KKTriPhoton/genproductions (git@github.com:KKTriPhoton/genproductions.git)
-Generate cards for input BKK_mass and Radion_mass using genproductions/bin/MadGraph5_aMCatNLO/cards/production/2017/13TeV/Res1ToRes2GluToGluVV/Res1ToRes2GluToGluVV_M1_R_gen_card.py
-Run genproductions/bin/MadGraph5_aMCatNLO/gridpack_generation.sh with the correct fragment name for the mass point you want.


Condor:

-Define mass grid in condor/make_gridpacks.py
-Run condor/setup_condor_env.sh to setup log, err, out directories and conda environment (or do yourself)
-Run condor/make_gridpacks.py


