#Methods

_**Transcriptome data sources**_

The transcriptomes of six scleractinian coral species were evaluated to determine germline methylation patterns in relation to gene function and activity. Species examined included *Acropora hyacinthus*, *A. millepora*, *A. palmata*, *Pocillopora damicornis*, *Porites astreoides*, and *Stylophora pistillata* (Table 1).  In order to remove *Symbiodinium* sequences from these transcriptomes, they were compared to *Symbiodinium* clade A and B transcriptomes from Bayer et al. (2012) using Blastn (version 2.2.29). An evalue threshold of of 10<sup>-5</sup> was used for these queries, and all matched sequences were removed from further analyses. $$$SHOULD ALSO NORMALIZE FOR SIZE??$$, LINK TO NOTEBOOK$$


Table 1. Transcriptomes used in this study 

Organism | Life history stage | Method | No. Contigs | Reference  
--------- | ---------- | -------- | -------- | --------- 
*Acropora hyacinthus* | Adult | Illumina | 33,496 | Barshis et al. (2013) 
*Acropora millepora* | Embryo to adult | 454 & Illumina | 52,963 | Moya et al. (2012) 
*Acropora palmata* | Larval | 454 | 88,020 | Polato et al. (2011) 
*Pocillopora damicornis* | Adult | Illumina | 72,890 | Vidal-Dupiol et al. (2013)  
*Porites astreoides* | Adult | 454 | 30,740 | Kenkel et al. (2013) 
*Stylophora pistillata* | Adult | 454 | 15,052 | Karako-Lampert et al. (2014) 


_**Differentially expressed gene datasets**_

<<<<<<< HEAD
In addition to analyzing whole transcriptomes, we also examined genes differentially expressed in response to environmental stressors for the three acroporid species. For *A. hyacinthus* and *A. millepora* these gene sets were derived from the same studies that developed the reference transcriptomes (Barshis et al. 2013, Moya et al. 2012), and for *A. palmata* differentially expressed genes sets were reported in a companion study by Polato et al. (2013). Table 2 summarizes these data.
=======
In addition to analyzing whole transcriptomes, we also examined genes differentially expressed in response to environmental stressors for the three acroporid species. For *A. hyacinthus* and *A. millepora* these gene sets were derived from the same studies that developed the reference transcriptomes (Barshis et al. 2013, Moya et al. 2012), and for *A. palmata* differentially expressed genes sets were reported in Polato
et al. (2013) (Table 2).
>>>>>>> origin/master


Table 2. Differentially expressed gene sets examined

Organism | Life history stage | Method | No. Contigs | Environmental factor | Reference   
--------- | ---------- | --------- | -------- |-------- | --------
*Acropora hyacinthus* | Adult | Illumina | 484 | Thermal stress | Barshis et al. (2013) 
*Acropora millepora* | Juvenile | Illumina | 234 | Ocean acidification | Moya et al. (2012) 
*Acropora palmata* | Larval | microarray | 2002 | Thermal stress | Polato et al. (2013) 


_**Annotation**_

To maintain consistency in comparing datasets, all transcriptomes and  differentially expressed gene sets were compared to the UniProt/Swiss-Prot protein database (version 2/17/2015) using Blastx (version 2.2.29) with an evalue threshold of 10<sup>-5</sup>.
To further annotate genes with into functional categories,  corresponding Gene Ontology Slim (GOSlim) biological process were identified.  Complete details of annotation are provided in jupyter notebooks at https://github.com/jldimond/Coral-CpG-ratio-MS/tree/master/ipynb.


_**Predicted germline methylation**_

Germline methylation levels were inferred based on the hypermutability of methylated cytosines, which tend towards conversion to thymines over evolutionary time. This results in a reduction in CpG dinucleotides, meaning that heavily methylated genomic regions are associated with reduced numbers of CpGs. Thus, methylation patterns that have been inherited through the germline over evolutionary time can be estimated using the ratio of observed to expected CpG, known as CpG O/E:

CpG O/E = (number of CpG / number of C x number of G) x (l<sup>2</sup>/l-1)

where l is the number of nucleotides in the contig.

Only annotated sequences were used for calculation of CpG O/E to maximize the likelihood that sequences were oriented in the 5' to 3' direction. For subsequent analyses, we set minimum and maximum limits for CpG O/E at 0.001 and 1.5, respectively. Full details of germline methylation prediction methods are provided in jupyter notebooks at https://github.com/jldimond/Coral-CpG-ratio-MS/tree/master/ipynb.


**Statistcal Analyses** 

<<<<<<< HEAD
Transcriptome CpG O/E patterns were fitted with the normalmixEM function in the mixtools package in the R statistical platform. Mixture models were evaluated against the null single component model by comparison of log-likelihood statistics. High- and low-CpG O/E components were delineated in mixture models using the intersection point of component density curves. For each GOSlim term, enrichment in the high and low CpG O/E components identified in mixture models was evaluated with Fisher's exact test. Whole transcriptome and differentially expressed gene CpG O/E distributions were compared with the Kolmogorov–Smirnov test.
=======
Transcriptome CpG O/E patterns were fitted with the normalmixEM function in the mixtools package in the R statistical platform. Mixture models were evaluated against the null single component model by comparison of log likelihood statistics. For each GOSlim term, mean CpG O/E was evaluated with ANOVA followed by post-hoc tests. Whole transcriptome and differentially expressed gene CpG O/E distributions were compared with the Kolmogorov–Smirnov test.

>>>>>>> origin/master
