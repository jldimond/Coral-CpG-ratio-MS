
Germline methylation patterns in the transcriptomes and environmental response genes of six scleractinian coral species were evaluated, including Acropora hyacinthus, A. millepora, A. palmata, Montastraea faveolata, Stylophora pistillata, and Pocillopora damicornis. Table 1 (in progress) shows the datasets used in the analyses. Germline methylation levels were inferred based on the hypermutability of methylated cytosines, which tend towards conversion to thymines over evolutionary time. This results in a reduction in CpG dinucleotides, meaning that historically heavily methylated genomic regions are associated with reduced numbers of CpGs. We developed an iPython script that calculated CpG ratio (also known as CpG O/E) as:

{CpG O/E = (number of CpG / number of C x number of G) x (l^2/l-1)}



where l is the number of nucleotides in the contig.

Next, we developed an iPython script that performed a blastx query of the transcriptome datasets against the SWISS-PROT database, returning the best predicted protein match with an e-value of >= 10-5. SWISS-PROT IDs were then joined with biological processes GO Slim terms from [which database?] using SQLite3. An individual contig may have fallen into more than one GO Slim bin, but was not permitted to occur in the same bin more than once.
