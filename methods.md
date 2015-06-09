

_**Transcriptome data sources**_

Transcriptomes of six scleractinian coral species were evaluated to determine germline methylation patterns in relation to gene function and activity. Species examined included *Acropora hyacinthus*, *A. millepora*, *A. palmata*, *Pocillopora damicornis*, *Porites astreoides*, and *Stylophora pistillata* (Table 1). 


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

In addition to analyzing whole transcriptomes, we also examined genes differentially expressed in response to environmental stressors for the three Acropora species. For *A. hyacinthus* and *A. millepora* these gene sets are described in the manuscripts mentioned above (Barshis et al. 2013, Moya et al. 2012), and for *A. palmata* differentially expressed genes sets were reported in Polato
et al. (2013). Table 2 summarizes these data.



Table 2. Differentially expressed genes used in this study 

Organism | Life history stage | Method | No. Contigs | Environmental factor | Reference   
--------- | ---------- | --------- | -------- |-------- | --------
*Acropora hyacinthus* | Adult | Illumina | 484 | Thermal stress | Barshis et al. (2013) 
*Acropora millepora* | Juvenile | Illumina | 234 | Ocean acidification | Moya et al. (2012) 
*Acropora palmata* | Larval | microarray | 2002 | Thermal stress | Polato et al. (2013) 


_**Annotation**_

To maintain consistency in comparing datasets, all transcriptomes and  differentially expressed gene sets were compared to the UniProt/Swiss-Prot protein database (version 2/17/2015) using Blastx (version 2.2.29) using an evalue threshold of 10<sup>-5</sup>.
UniProt/Swiss-Prot IDs were joined with corresponding Gene Ontology Slim (GOSlim) terms using SQLShare (http://escience.washington.edu/sqlshare). Complete details of annotation are provided in jupyter notebooks at https://github.com/jldimond/Coral-CpG-ratio-MS/tree/master/ipynb.


_**Predicted germline methylation**_

Germline methylation levels were inferred based on the hypermutability of methylated cytosines, which tend towards conversion to thymines over evolutionary time. This results in a reduction in CpG dinucleotides, meaning that historically heavily methylated genomic regions are associated with reduced numbers of CpGs. Thus, methylation patterns that have been inherited through the germline over evolutionary time can be estimated using the ratio of observed to expected CpG, known as CpG O/E:

CpG O/E = (number of CpG / number of C x number of G) x (l<sup>2</sup>/l-1)

where l is the number of nucleotides in the contig.

Details of germline methylation prediction are provided in jupyter notebooks at https://github.com/jldimond/Coral-CpG-ratio-MS/tree/master/ipynb.


**Statiscal Analysis** 

Transcriptome CpG O/E patterns were fitted with the normalmixEM function in the mixtools package in the R statistical platform. The mclust package in R was used to apply maximum likelihood estimation to compare the fit of one- to two-component Gausssian models. For each GOSlim term, mean CpG O/E was evaluated with ANOVA followed by post-hoc tests. Whole transcriptome and differentially expressed gene CpG O/E distributions were compared with the Kolmogorov–Smirnov test.
