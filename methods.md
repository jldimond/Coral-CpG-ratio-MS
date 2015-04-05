

_**Transcriptome data sources**_

Transcriptomes of six scleractinian coral species were evaluated to determine germlline methylation patterns in relation to gene function and activity. These transcriptomes including *Acropora hyacinthus*, *A. millepora*, *A. palmata*, *Orbicella faveolata, *Stylophora pistillata*, and *Pocillopora damicornis*. Table 1 (in progress) describes the data sources used in the analyses. 

#####Table 1.Transcriptomes used in the study
Organism | Transcriptome reference | Data link | # Contigs
--------- | ---------- | --------- | --------
*Acropora hyacinthus* | Barshis et al. (2013) | [URL](http://palumbi.stanford.edu/data/33496_Ahyacinthus_CoralContigs.fasta.zip) | 33,496
*Acropora millepora* | Moya et al. (2012) | [URL](http://www.ncbi.nlm.nih.gov/nuccore?term=74409%5BBioProject%5D) | 52,963
*Acropora palmata* | Polato et al. (2011) | [URL](https://usegalaxy.org/datasets/cb51c4a06d7ae94e/display?to_ext=fasta) | 88,020
*Pocillopora damicornis* | Vidal-Dupiol et al. (2013) | [URL](http://2ei.univ-perp.fr/telechargement/transcriptomes/blast2go_fasta_Pdamv2.zip) | 72,890
*Stylophora pistillata* | Karako-Lampert et al. (2014) | [URL](http://data.centrescientifique.mc/Data/454Isotigs.fas.zip) | 15,052


_**Differentially expressed gene datasets**_

In addition to analyzing whole transcriptomes we also examined corresponding differentially expressed gene sets. For x spxx these gene sets were described in the manuscripts mentioned above (citations), and for xxxx sp xxx differentially expressed genes sets were reported in xxxxx, respectively. Table 2 summarizes these data.










_**Annotation**_

In order to maintain consistency in comparing datasets, all transcriptomes, and in some cases differentially expressed gene sets, were compared to the UniProt/Swiss-Prot protein database (version 2/17/2015) using Blastx (version 2.2.29) using a evalue threshold E-value = 10<sup>-5</sup>. 

Corresponding Gene Ontology Slim terms were identified by joining iwth <<<<>>> and <<<>>>>> using SQLShare (citation). 

Complete details of annotation are provided in accompanying jupyter notebook (ref)


_**Predicted germline methylation**_

Germline methylation levels were inferred based on the hypermutability of methylated cytosines, which tend towards conversion to thymines over evolutionary time. This results in a reduction in CpG dinucleotides, meaning that historically heavily methylated genomic regions are associated with reduced numbers of CpGs. Specifically, CpG O/E 
was calculated as:

CpG O/E = (number of CpG / number of C x number of G) x (l<sup>2</sup>/l-1)

where l is the number of nucleotides in the contig.




Details of germline methylation prediction are provided in accompanying jupyter notebook (ref)

**Statiscal Analysis**       
Mean  CpG O/E values were calculated for each GOslim biological process???
~~~~NEED means to determine if bimodal~~~~
