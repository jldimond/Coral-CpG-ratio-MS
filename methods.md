#Methods

_**Transcriptome data**_

Germline methylation patterns in the transcriptomes and environmental response genes of six scleractinian coral species were evaluated, including *Acropora hyacinthus*, *A. millepora*, *A. palmata*, *Orbicella faveolata, *Stylophora pistillata*, and *Pocillopora damicornis*. Table 1 (in progress) describes the data sources used in the analyses. 

#####Table 1. Data sources used in the study
Organism | Transcriptome reference 
--------- | ---------- 
*Acropora hyacinthus* | Barshis et al. (2013) 
*Acropora millepora* | Moya et al. (2012) 
*Acropora palmata* | Polato et al. (2011) 
*Montastraea faveolata* | Desalvo et al. (2008) 
*Pocillopora damicornis* | Vidal-Dupiol et al. (2013) 
*Stylophora pistillata* | Karako-Lampert et al. (2014) 

_**Transcriptome annotation**_

All transcriptomes were annotated using Blastx (version 2.2.29) for comparison to the UniProt/Swiss-Prot protein database (version 2/17/2015). Parameters for blastx were has follows: maximum number of target sequences = 1; maximum number of high-scoring pairs = 1; E-value = 10<sup>-5</sup>; number of threads = 8. The output file was uploaded to SQLShare and joined by Swiss-Prot ID to a GOslim annotation table. Only GOslim biological process (’P’) terms were included. This join process allowed an individual contig to fall into more than one GOslim bin, but did not allow it to occur in the same bin more than once. The result was an annotation file including contig IDs and GOslim IDs.

_**Predicted germline methylation**_

Germline methylation levels were inferred based on the hypermutability of methylated cytosines, which tend towards conversion to thymines over evolutionary time. This results in a reduction in CpG dinucleotides, meaning that historically heavily methylated genomic regions are associated with reduced numbers of CpGs. We used an IPython notebook workflow as a pipeline for analysis of CpG O/E. CpG O/E 
was calculated as:

CpG O/E = (number of CpG / number of C x number of G) x (l<sup>2</sup>/l-1)

where l is the number of nucleotides in the contig.

To permit analysis of these data based on GOslim terms, the data were joined with the GOslim annotation file described above based on common contig ID numbers. However, because the GOslim annotation file contained contigs that were duplicated if they fell into more than one GOslim bin, whole-transcriptome CpG O/E patterns were analyzed using the data generated prior to joining with GOslim annotation files.

Analyses were perfomed on a computer running Ubuntu 14.04 with Python 2.7.