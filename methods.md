

_**Transcriptome data sources**_

Transcriptomes of six scleractinian coral species were evaluated to determine germline methylation patterns in relation to gene function and activity. Species examined include *Acropora hyacinthus*, *A. millepora*, *A. palmata*, *Stylophora pistillata*, and *Pocillopora damicornis* (Table 1). 


<!REMOVE URLS>>


<!THERE ARE 5 LISTED BELOW, SIX IN RESULTS?????>>



Table 1. Transcriptomes used in this study 

Organism | Transcriptome reference | Data link | No. Contigs 
--------- | ---------- | --------- | -------- 
*Acropora hyacinthus* | Barshis et al. (2013) | [URL](http://palumbi.stanford.edu/data/33496_Ahyacinthus_CoralContigs.fasta.zip) | 33,496 
*Acropora millepora* | Moya et al. (2012) | [URL](http://www.ncbi.nlm.nih.gov/nuccore?term=74409%5BBioProject%5D) | 52,963
*Acropora palmata* | Polato et al. (2011) | [URL](https://usegalaxy.org/datasets/cb51c4a06d7ae94e/display?to_ext= fasta) | 88,020
*Pocillopora damicornis* | Vidal-Dupiol et al. (2013) | [URL](http://2ei.univ-perp.fr/telechargement/transcriptomes/ blast2go_fasta_Pdamv2.zip) | 72,890 
*Stylophora pistillata* | Karako-Lampert et al. (2014) | [URL](http://data.centrescientifique.mc/Data/454Isotigs.fas.zip) | 15,052


_**Differentially expressed gene datasets**_

In addition to analyzing whole transcriptomes, we also examined genes differentially expressed in response to environmental stressors for the three Acropora species. For *A. hyacinthus* and *A. millepora* these gene sets are described in the manuscripts mentioned above (Barshis et al. 2013, Moya et al. 2012), and for *A. palmata* differentially expressed genes sets were reported in Polato
et al. (2013). Table 2 summarizes these data.


<!INDICATED TECHNOLOGY USED FOR DEGS ID>>


Table 2. Differentially expressed genes used in this study 

Organism | Environmental factor | Dataset reference | Data link | No. Contigs 
--------- | ---------- | --------- | -------- |-------- 
*Acropora hyacinthus* | Thermal stress | Barshis et al. (2013) | [URL](http://www.pnas.org/content/suppl/2013/01/02/1210224110.DCSupplemental/sd01.xlsx) | 484
*Acropora millepora* | Ocean acidification | Moya et al. (2012) | [URL](http://onlinelibrary.wiley.com/store/10.1111/j.1365-294X.2012.05554.x/asset/supinfo/MEC_5554_sm_FigS1-S3_TableS1-S9.pdf?v=1&s=8986ebf969c7552ad857973fff80a0752f87a129) | 234
*Acropora palmata* | Thermal stress | Polato et al. (2013) | [URL](http://datadryad.org/bitstream/handle/10255/dryad.39350/SuppTableS3_Final.xlsx?sequence=1) | 1,452


_**Annotation**_

In order to maintain consistency in comparing datasets, all transcriptomes and  differentially expressed gene sets, were compared to the UniProt/Swiss-Prot protein database (version 2/17/2015) using Blastx (version 2.2.29) using an evalue threshold 10<sup>-5</sup>.



<!URLS DO NOT WORK IN A MANUSCRIPT>>


Corresponding Gene Ontology Slim terms were identified by joining with [SPID and GO
Numbers](https://sqlshare.escience.washington.edu/sqlshare/#s=query/
sr320@washington.edu/SPID%20and%20GO%20Numbers) and
[GO_to_GOslim](https://sqlshare.escience.washington.edu/sqlshare/#s=
query/sr320%40washington.edu/GO_to_GOslim) using SQLShare (citation).

Complete details of annotation are provided in accompanying [jupyter notebook](https://github.com/jldimond/Coral-CpG-ratio-MS/tree/master/ipynb).


_**Predicted germline methylation**_

Germline methylation levels were inferred based on the hypermutability of methylated cytosines, which tend towards conversion to thymines over evolutionary time. This results in a reduction in CpG dinucleotides, meaning that historically heavily methylated genomic regions are associated with
reduced numbers of CpGs. Specifically, CpG O/E was calculated as:

CpG O/E = (number of CpG / number of C x number of G) x (l<sup>2</sup>/l-1)

where l is the number of nucleotides in the contig.




Details of germline methylation prediction are provided in accompanying [jupyter notebook](https://github.com/jldimond/Coral-CpG-ratio-MS/tree/master/ipynb).



**Statiscal Analysis** 

Transcriptome CpG O/E patterns were evaluated with a mixture model using the mixtools R package (I will add more details here soon). Mean CpG O/E for each GOslim term was evaluated with ANOVA followed by post-hoc tests. A Kolmogorov–Smirnov test was used to compare whole transcriptome and differentially expressed gene CpG O/E distributions (note: Mann-Whitney test may be more appropriate. See this blog for methods: http://thebiobucket.blogspot.com/2011/08/comparing-two-distributions.html#more. Also, see this page for methods regarding quantile plots and density curves in R: http://www.statmethods.net/graphs/density.html).
