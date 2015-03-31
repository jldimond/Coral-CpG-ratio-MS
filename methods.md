#Methods

_**Transcriptome data**_

Germline methylation patterns in the transcriptomes and environmental response genes of six scleractinian coral species were evaluated, including *Acropora hyacinthus*, *A. millepora*, *A. palmata*, *Orbicella faveolata, *Stylophora pistillata*, and *Pocillopora damicornis*. Table 1 (in progress) describes the data sources used in the analyses. 

#####Table 1.Transcriptomes used in the study
Organism | Transcriptome reference | Data link | # Contigs
--------- | ---------- | --------- | --------
*Acropora hyacinthus* | Barshis et al. (2013) | [URL](http://palumbi.stanford.edu/data/33496_Ahyacinthus_CoralContigs.fasta.zip) | 33,496
*Acropora millepora* | Moya et al. (2012) | [URL](http://www.ncbi.nlm.nih.gov/nuccore?term=74409%5BBioProject%5D) | 52,963
*Acropora palmata* | Polato et al. (2011) | [URL](https://usegalaxy.org/datasets/cb51c4a06d7ae94e/display?to_ext=fasta) | 88,020
*Pocillopora damicornis* | Vidal-Dupiol et al. (2013) | [URL](http://2ei.univ-perp.fr/telechargement/transcriptomes/blast2go_fasta_Pdamv2.zip) | 72,890
*Stylophora pistillata* | Karako-Lampert et al. (2014) | [URL](http://data.centrescientifique.mc/Data/454Isotigs.fas.zip) | 15,052

######*Acropora hyacinthus*

The *Acropora hyacinthus* transcriptome file 33496_Ahyacinthus_CoralContigs.fasta was [downloaded](http://palumbi.stanford.edu/data/33496_Ahyacinthus_CoralContigs.fasta.zip) on 1/15/2015. It was featured in an article by [Barshis et al. (2013)](http://www.pnas.org/content/110/4/1387.abstract). The [supporting information file](http://www.pnas.org/content/suppl/2013/01/02/1210224110.DCSupplemental/pnas.201210224SI.pdf) contains detailed information on the experimental conditions and the methods used to create the transcriptome. Briefly, the transcriptome contains 33,496 contigs with high similarity to other cnidarian sequences. The authors used coral and dinoflagellate sequences to filter out dinoflagellate sequences, so the transcriptome contains mostly coral transcripts.

######*Acropora millepora*

The FASTA file Amil_Moya.fasta is a transcriptome for *Acropora millepora* [downloaded](http://www.ncbi.nlm.nih.gov/nuccore?term=74409%5BBioProject%5D) on 2/5/2015. It was featured in an article by [Moya et al. (2012)](http://onlinelibrary.wiley.com/doi/10.1111/j.1365-294X.2012.05554.x/full). The transcriptome consists of 52,963 contigs. The transcriptome was developed from newly settled polyps without symbionts.

######*Acropora palmata*

Apalmata_assembled.fasta is a transcriptome essembly for *Acopora palmata* [downloaded](https://usegalaxy.org/datasets/cb51c4a06d7ae94e/display?to_ext=fasta) on 2/19/2015. It was featured in an article by [Polato et al. 2011](http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0028634). The transcriptome was developed from symbiont-free larval tissue and consists of 88,020 contigs.

######*Pocillopora damicornis*

The file blast2go_fasta_Pdamv2.fasta is a *Pocillopora damicornis* transcriptome assembly [downloaded](http://2ei.univ-perp.fr/telechargement/transcriptomes/blast2go_fasta_Pdamv2.zip) on 2/19/2015. It was originally featured in an article by [Vidal-Dupiol et al. (2013)](http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0058652). The transcriptome was developed from adult *P. damicornis* and consists of 72,890 contigs. According to the authors, "...27.7% and 69.8% of the contigs were predicted to belong to the symbiont and the host transcriptome, respectively. The remaining contigs could not be taxonomically attributed." 

######*Stylophora pistillata*

The file Spist.fasta is a *Stylophora pistillata* transcriptome [downloaded](http://data.centrescientifique.mc/Data/454Isotigs.fas.zip) on 2/19/2015. This transcriptome was featured in an article by [Karako-Lampert et al. (2014)](http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0088615). The transcriptome consists of 15,052 contigs and was developed from adult coral tissue, but the authors determined that only approximately 2.5% of the sequences mapped exclusively to the *Symbiodinium* genome. Thus, the vast majority of transcripts are coral transcripts.


_**Transcriptome annotation**_

All transcriptomes were annotated using Blastx (version 2.2.29) for comparison to the UniProt/Swiss-Prot protein database (version 2/17/2015). Parameters for blastx were has follows: maximum number of target sequences = 1; maximum number of high-scoring pairs = 1; E-value = 10<sup>-5</sup>; number of threads = 8. The output file was uploaded to SQLShare and joined by Swiss-Prot ID to a GOslim annotation table. Only GOslim biological process (’P’) terms were included. This join process allowed an individual contig to fall into more than one GOslim bin, but did not allow it to occur in the same bin more than once. The result was an annotation file including contig IDs and GOslim IDs.

_**Predicted germline methylation**_

Germline methylation levels were inferred based on the hypermutability of methylated cytosines, which tend towards conversion to thymines over evolutionary time. This results in a reduction in CpG dinucleotides, meaning that historically heavily methylated genomic regions are associated with reduced numbers of CpGs. We used an IPython notebook workflow as a pipeline for analysis of CpG O/E. CpG O/E 
was calculated as:

CpG O/E = (number of CpG / number of C x number of G) x (l<sup>2</sup>/l-1)

where l is the number of nucleotides in the contig.

To permit analysis of these data based on GOslim terms, the data were joined with the GOslim annotation file described above based on common contig ID numbers. However, because the GOslim annotation file contained contigs that were duplicated if they fell into more than one GOslim bin, whole-transcriptome CpG O/E patterns were analyzed using the data generated prior to joining with GOslim annotation files.

Analyses were perfomed on a computer running Ubuntu 14.04 with Python 2.7.