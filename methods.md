

_**Transcriptome data sources**_

Predicted germline methylation patterns in the transcriptomes of six scleractinian coral species were evaluated based on gene function. including *Acropora hyacinthus*, *A. millepora*, *A. palmata*, *Orbicella faveolata, *Stylophora pistillata*, and *Pocillopora damicornis*. Table 1 (in progress) describes the data sources used in the analyses. 

#####Table 1.Transcriptomes used in the study
Organism | Transcriptome reference | Data link | # Contigs
--------- | ---------- | --------- | --------
*Acropora hyacinthus* | Barshis et al. (2013) | [URL](http://palumbi.stanford.edu/data/33496_Ahyacinthus_CoralContigs.fasta.zip) | 33,496
*Acropora millepora* | Moya et al. (2012) | [URL](http://www.ncbi.nlm.nih.gov/nuccore?term=74409%5BBioProject%5D) | 52,963
*Acropora palmata* | Polato et al. (2011) | [URL](https://usegalaxy.org/datasets/cb51c4a06d7ae94e/display?to_ext=fasta) | 88,020
*Pocillopora damicornis* | Vidal-Dupiol et al. (2013) | [URL](http://2ei.univ-perp.fr/telechargement/transcriptomes/blast2go_fasta_Pdamv2.zip) | 72,890
*Stylophora pistillata* | Karako-Lampert et al. (2014) | [URL](http://data.centrescientifique.mc/Data/454Isotigs.fas.zip) | 15,052





_**Annotation**_

In order to maintain consistancy in comparing dataset all transcriptomes were annotated using Blastx (version 2.2.29) for comparison to the UniProt/Swiss-Prot protein database (version 2/17/2015). Parameters for blastx were as follows: maximum number of target sequences = 1; maximum number of high-scoring pairs = 1; E-value = 10<sup>-5</sup>; number of threads = 8. 

SQLShare was used to join annotation results with associated GO terms (Gene Ontology database: http://www.geneontology.org) to categorize genes into parent categories and assign them a functional group based on the MGI GO Slim database (URL:http://www.informatics.jax.org). All code used for transcriptome annotation is available (URLURLURL).

_**Predicted germline methylation**_

Germline methylation levels were inferred based on the hypermutability of methylated cytosines, which tend towards conversion to thymines over evolutionary time. This results in a reduction in CpG dinucleotides, meaning that historically heavily methylated genomic regions are associated with reduced numbers of CpGs. We used an IPython notebook workflow as a pipeline for analysis of CpG O/E. CpG O/E 
was calculated as:

CpG O/E = (number of CpG / number of C x number of G) x (l<sup>2</sup>/l-1)

where l is the number of nucleotides in the contig.

To permit analysis of these data based on GOslim terms, the data were joined with the GOslim annotation file described above based on common contig ID numbers. However, because the GOslim annotation file contained contigs that were duplicated if they fell into more than one GOslim bin, whole-transcriptome CpG O/E patterns were analyzed using the data generated prior to joining with GOslim annotation files.

