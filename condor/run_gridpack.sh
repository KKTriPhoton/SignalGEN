#Script to set up gridpack generation scripts
M_BKK=$1
M_R=$2
outputDir=$3

rm -rf genproductions
#Get genproductions code from KKTriPhoton fork
if [ -d "genproductions" ] 
then
    echo "Directory genproductions exists, remove it.."
    rm -rf genproductions 
else
    git clone https://github.com/KKTriPhoton/genproductions.git
fi

cd genproductions/bin/MadGraph5_aMCatNLO/

#Create cards from templates
cardsdir=cards/production/2017/13TeV/Res1ToRes2GluToGluVV
cd $cardsdir
python Res1ToRes2GluToGluVV_M1_R_gen_card.py $M_BKK $M_R
cd -

fragment="Res1ToRes2GluToGluVV_M1-${M_BKK}_R-${M_R}"

#Make gridpacks
./gridpack_generation.sh ${fragment} ${cardsdir}/${fragment}
cp ${fragment}_slc7_amd64_gcc10_CMSSW_12_4_8_tarball.tar.xz $outputDir

