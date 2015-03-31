Germline methylation patterns in the transcriptomes and environmental response genes of six scleractinian coral species were evaluated, including Acropora hyacinthus, A. millepora, A. palmata, Montastraea faveolata, Stylophora pistillata, and Pocillopora damicornis. Table 1 (in progress) shows the datasets used in the analyses. Germline methylation levels were inferred based on the hypermutability of methylated cytosines, which tend towards conversion to thymines over evolutionary time. This results in a reduction in CpG dinucleotides, meaning that historically heavily methylated genomic regions are associated with reduced numbers of CpGs.

Transcriptome annotation

Transcriptomes were annotated in an IPython notebook workflow. All transcriptomes were annotated using Blastx (version 2.2.29) for comparison to the UniProt/Swiss-Prot protein database (version 2/17/2015). Parameters for blastx were has follows:

maximum number of target sequences = 1 maximum number of high-scoring pairs = 1 output format = tabular E-value = 10-5 number of threads = 8

After removing pipes from the tab-delimited output file, the file was uploaded to SQLShare and joined by Swiss-Prot ID to a GOSlim annotation table. Only GOSlim biological process (’P’) terms were included. This join process allowed an individual contig to fall into more than one GOslim bin, but did not allow it to occur in the same bin more than once. The result was an annotation file including contig IDs and GOslim IDs.

CpG ratio analysis

Next, an IPython notebook workflow was developed to serve as a pipeline for analysis of CpG O/E. The original FASTA file was converted to tab-delimited format, then a new column with the number of sequences in each contig was added to the file. The number of C, G, and CG in each contig were then computed and each passed to separate files that were subsequently appended to the main file. The script then calculated CpG O/E as:

CpG O/E = (number of CpG / number of C x number of G) x (lexp2/l-1)

where l is the number of nucleotides in the contig.

The result was passed to a new file containing the contig ID and CpG O/E. This file was joined with the GOSlim annotation file described above based on common contig ID numbers. The resulting file contained contig ID, CpG O/E, and GOslim ID.

Data were analyzed by converting data files to pandas tables. CpG O/E was evaluated graphically with density plots for transcriptome-wide patterns and with bar plots with means for each GOslim bin. Because the GOslim annotation file contained contigs that were duplicated if they fell into more than one GOslim bin, density curves were plotted with CpG O/E data files generated prior to joining with GOslim annotation files.

Analyses were perfomed on a computer running Ubuntu 14.04 with Python 2.7.