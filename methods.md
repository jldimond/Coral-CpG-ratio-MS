#Methods

_**Transcriptome data sources**_

The transcriptomes of six scleractinian coral species were evaluated to determine germline methylation patterns in relation to gene function and activity. Species examined included *Acropora hyacinthus*, *A. millepora*, *A. palmata*, *Pocillopora damicornis*, *Porites astreoides*, and *Stylophora pistillata* (Table 1).  These transcriptomes reflect a range of life history stages. Some transcriptomes were developed from life history stages that had not yet been infected with symbiotic dinoflagellates (*Symbiodinium* spp.), while others used bioinformatic techniques to filter out putative *Symbiodinium* sequences. However, two of the transcriptomes (*P. damicornis* and *S. pistillata*) were developed from adult corals and did not remove putative symbiont sequences. We therefore applied a filtering step to these transcriptomes by comparing them to *Symbiodinium* clade A and B transcriptomes from \cite{22529998} using blastn (version 2.2.29). An evalue threshold of of 10<sup>-5</sup> was used for these queries, and all matched sequences were removed from further analyses. Details of blastn query and filtering are provided (https://github.com/jldimond/Coral-CpG-ratio-MS)

Table 1. Transcriptomes used in this study 

Organism | Life history stage | Method | No. Contigs | Reference  
--------- | ---------- | -------- | -------- | --------- 
*Acropora hyacinthus* | Adult | Illumina | 33,496 | Barshis et al. (2013)\cite{23297204} 
*Acropora millepora* | Embryo to adult | 454 & Illumina | 52,963 | Moya et al. (2012)\cite{22490231} 
*Acropora palmata* | Larval | 454 | 88,020 | Polato et al. (2011)\cite{22216101} 
*Pocillopora damicornis* | Adult | Illumina | 72,890 | Vidal-Dupiol et al. (2013)\cite{23544045}  
*Porites astreoides* | Adult | 454 | 30,740 | Kenkel et al. (2013)\cite{23899402} 
*Stylophora pistillata* | Adult | 454 | 15,052 | Karako-Lampert et al. (2014)\cite{24551124} 

$$ Illumina is Company - 454 is platform, several types of Illumina platforms.

_**Differentially expressed gene datasets**_

In addition to analyzing whole transcriptomes, we also examined genes differentially expressed in response to environmental stressors for the three acroporid species. For *A. hyacinthus* and *A. millepora* these gene sets were derived from the same studies that developed the reference transcriptomes (\cite{23297204}, \cite{22490231}), and for *A. palmata* differentially expressed genes sets were reported in \cite{23331636} (Table 2).


Table 2. Differentially expressed gene sets examined

Organism | Life history stage | Method | No. Contigs | Environmental factor | Reference   
--------- | ---------- | --------- | -------- |-------- | --------
*Acropora hyacinthus* | Adult | sequencing | 484 | Thermal stress | Barshis et al. (2013)\cite{23297204} 
*Acropora millepora* | Juvenile | sequencing | 234 | Ocean acidification | Moya et al. (2012)\cite{22490231} 
*Acropora palmata* | Larval | microarray | 2002 | Thermal stress | Polato et al. (2013)\cite{23331636} 


_**Annotation**_

To maintain consistency in comparing datasets, all transcriptomes and  differentially expressed gene sets were compared to the UniProt/Swiss-Prot protein database (version 2/17/2015) using Blastx (version 2.2.29) with an evalue threshold of 10<sup>-5</sup>.
To further annotate genes with into functional categories,  corresponding Gene Ontology Slim (GOSlim) biological process were identified.  Details of annotation are provided in jupyter notebooks in accompanying repository (https://github.com/jldimond/Coral-CpG-ratio-MS).

_**Predicted germline methylation**_

Germline methylation levels were inferred based on the hypermutability of methylated cytosines, which tend towards conversion to thymines over evolutionary time. This results in a reduction in CpG dinucleotides, meaning that heavily methylated genomic regions are associated with reduced numbers of CpGs. Thus, methylation patterns that have been inherited through the germline over evolutionary time can be estimated using the ratio of observed to expected CpG, known as CpG O/E. Germline DNA methylation estimated by analysis of CpG O/E is highly correlated with direct assays of methylation (\cite{17420183}, \cite{22328716}, \cite{24282674}). CpG O/E was defined as:

CpG O/E = (number of CpG / number of C x number of G) x (l<sup>2</sup>/l-1)

where l is the number of nucleotides in the contig.

Only annotated sequences were used for calculation of CpG O/E to maximize the likelihood that sequences were oriented in the 5' to 3' direction. 

$$ Annotation does not ensure orientation.

For subsequent analyses, we set minimum and maximum limits for CpG O/E at 0.001 and 1.5, respectively. $$(why?) Details of germline methylation prediction methods are provided in jupyter notebooks (https://github.com/jldimond/Coral-CpG-ratio-MS/)


**Statistical Analyses** 

Transcriptome CpG O/E patterns were fitted with the normalmixEM function in the mixtools package in the R statistical platform. Mixture models were evaluated against the null single component model by comparison of log-likelihood statistics. High- and low-CpG O/E components were delineated in mixture models using the intersection point of component density curves. For each GOSlim term, enrichment in the high and low CpG O/E components identified in mixture models was evaluated with Fisher's exact test. Whole transcriptome and differentially expressed gene CpG O/E distributions were compared with the Kolmogorov–Smirnov test. Details and specific code uesed are available  (https://github.com/jldimond/Coral-CpG-ratio-MS/).


    