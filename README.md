# mnasechip-cj2020

## Preparations

Install requirements :
* [python version 3.7.4 or newer](https://www.python.org)
* [bowtie2](http://bowtie-bio.sourceforge.net/bowtie2/index.shtml)
* [samtools](http://www.htslib.org)
* [bedtools](https://bedtools.readthedocs.io/en/latest/)
* [kentutils](https://github.com/ENCODE-DCC/kentUtils)
* [sra-toolkit](https://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?cmd=show&f=software&m=software&s=software)
* [vap](https://bitbucket.org/labjacquespe/vap_core/src/master/)
* [plot2do](https://github.com/rchereji/plot2DO)

Install seqtools.

```
pip install git+https://git@github.com/francoisrobertlab/seqtools.git
```

Download the MNase-ChIP data from GEO archive *(link to be supplied later)*.

```
seqtools download
```

Copy all files in the resources folder to the same folder as the MNase-ChIP data files.


## Method

### Align reads to the genome and create BED files containing fragments

```
bowtie2.sh
seqtools filterbam
seqtools bam2bed
```

### Merge fragments of replicates

```
seqtools merge
```

### Data visualization

```
mnasetools prepgenomecov -s merge.txt
seqtools genomecov -s merge.txt
```

### Aggregate and heatmap profiles

```
seqtools vap -s merge.txt
```

For the top 10% most transcribed genes

```
seqtools vap -s merge.txt --selection Top10percentTxbdGenes.txt
```

### Heatmaps of coverage over genes versus fragment size

```
split.sh -s merge.txt
mnasetools prepgenomecov -s merge.txt
seqtools genomecov -s merge.txt
seqtools vap -s merge.txt
```

For the top 10% most transcribed genes

```
seqtools vap -s merge.txt --selection Top10percentTxbdGenes.txt
```

### Two dimensional plots

Move to the plot2do folder. Replace `${mnase-chip-folder}` with the folder containing the MNase-ChIP data.

```
plot2do.sh -f ${mnase-chip-folder}/merge.txt
```

### Identification of coordinates of +2 nucleosomes

Those files are already supplied, but you can generate them again using the following instructions. 

[Manually download the BigWig files from Chereji from GeoArchive into the chereji folder](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE97290)

```
merge.sh
dyadposition.sh
```

### Distributions of MNase-ChIP-seq fragments relative to nucleosome dyads

Cleanup any data files generated by split, if necessary.

```
find . -regex ".*[0-9]*-[0-9]*-cov.bw" -exec rm {} \;
find . -regex ".*[0-9]*-[0-9]*-cov.bed" -exec rm {} \;
find . -regex ".*[0-9]*-[0-9]*-forcov.bed" -exec rm {} \;
find . -regex ".*[0-9]*-[0-9]*.bed" -exec rm {} \;
```

Generate Gaussian and double Gaussian fit images.

```
split-dyad.sh -s merge.txt
mnasetools prepgenomecov -s merge.txt
genomecov-dyad.sh -s merge.txt
dyadcoverage.sh -s merge.txt
fitgaussian.sh -s merge.txt
fitdoublegaussian.sh -s merge.txt
```
