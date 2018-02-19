# SAMPL6-Epik-pKa
This repo contains scripts and data for reference pKa calculations for the SAMPL6 pKa challenge using Epik.

## Sequential mode

`output/sequential` contains Epik `scan` mode pKa calculations starting from pH 7.4, getting all pKas between 2 and 12.

These were generated with [epik-sequential.sh](epik-sequential.sh) . Results were processed with the following notebook:

* [Type_III_analysis.ipynb](Type_III_analysis.ipynb)

Resulting files of the analysis:

#### Macroscopic pKa (type III) format as specified by SAMPL
* [typeIII-epik_sequential-1.csv](typeIII-epik_sequential-1.csv)

#### Raw csv file
* [typeIII-raw-sequential.csv](typeIII-raw-sequential.csv)

### Comparison to experiment

For the time being, the most complete experimental comparisons is found at
 [MobleyLab/SAMPL6](https://github.com/MobleyLab/SAMPL6/tree/master/physical_properties/pKa/analysis/analysis_of_typeIII_predictions)

The method is dubbed `nb007` for the purpose of identification in the SAMPL6 challenge.

This [plot](https://github.com/MobleyLab/SAMPL6/blob/master/physical_properties/pKa/analysis/analysis_of_typeIII_predictions/analysis_outputs_hungarian/pKaCorrelationPlots/nb007.pdf) shows comparison between experiment and this prediction type. This [table](https://github.com/MobleyLab/SAMPL6/blob/master/physical_properties/pKa/analysis/analysis_of_typeIII_predictions/analysis_outputs_hungarian/statistics_table.pdf) shows how the method compares to participants.


## Microscopic populations/pKa

Work in progress:

`output/microscopic` contains the results of full microstate calculations at every pH in the interval 3-11 with steps of .1 pH unit. These were generated with [epik-microscopic.sh](epik-microscopic.sh).

Results were processed with the following notebook:

* [Type_II_analysis.ipynb](Type_II_analysis.ipynb)

Resulting file:

#### Format as specified by SAMPL
* [typeII-epik_microscopic_populations-1.csv](typeII-epik_microscopic_populations-1.csv)

#### Raw csv file
* [typeii-raw-microscopic.csv](typeii-raw-microscopic.csv)
