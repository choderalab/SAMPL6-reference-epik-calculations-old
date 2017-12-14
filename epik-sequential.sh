#!/usr/bin/env bash
# to run
molecule_name="SM01 SM03 SM05 SM07 SM09 SM11 SM13 SM15 SM17 SM19 SM21 SM23 SM02 SM04 SM06 SM08 SM10 SM12 SM14 SM16 SM18 SM20 SM22 SM24"

# Centered around pH 7.0
phrange="7.0"

function run_epik_at_pH {
    file_prefix=$1
    ph=$2
    mkdir -p output/sequential/${file_prefix}
    cp input/${file_prefix}.smi output/sequential/${file_prefix}/.
    pushd output/sequential/${file_prefix}
    $SCHRODINGER/ligprep -ismi ${file_prefix}.smi -omae ${file_prefix}.mae -WAIT -i 1 # neutralize and store as mae
    $SCHRODINGER/epik -imae ${file_prefix}.mae -omae ${file_prefix}.epik.${ph}.mae -scan -ph ${ph} -highest_pka 12.0 -lowest_pka 2.0 -WAIT -NO_JOBCONTROL

    # extract atom properties
    $SCHRODINGER/utilities/proplister ${file_prefix}.epik.${ph}.mae -atom_bond_props -o ${file_prefix}.epik.${ph}.prop.csv -c  
    popd 
}

# make func available to parallel
export -f run_epik_at_pH
# Run Epik to enumerate all "reasonable" protomers/tautomers
parallel -j12 run_epik_at_pH ::: ${molecule_name}  ::: ${phrange} 

