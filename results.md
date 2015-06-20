#Methods


_**Annotation**_ 

For *P. damicornis* and *S. pistillata* transcriptomes, 2892 and 138 putative *Symbiodinium* sequences were removed from the transcriptomes, respectively. Comparisons of the six coral transcriptomes to the UniProt/Swiss-Prot database resulted in annotation of 26% to 47% of the contigs in each transcriptome (Table 3). Notebooks detailing the procedures generating these results can be found at https://github.com/jldimond/Coral-CpG-ratio-MS/tree/master/ipynb.


Table 3. Transcriptome annotation results. 

Organism | No. Contigs | Contigs Annotated (UniProt/Swiss-Prot)| Contigs Annotated (GOslim)
--------- | ---------- | --------- | ---------
*Acropora hyacinthus* | 33,496 | 11,593 | 9,935
*Acropora millepora* | 52,963 | 21,026 | 17,274
*Acropora palmata* | 88,020 | 35,303 | 29,450
*Pocillopora damicornis* | 72,890 | 19,133 | 16,150
*Porites astreoides* | 30,740 | 13,788 | 
*Stylophora pistillata* | 15,052 | 7,061 | 5,812


_**Predicted Gene Methylation**_    

Whole transcriptome patterns of predicted germline DNA methylation were similar for all coral species, suggesting bimodal distributions of CpG O/E with relatively large high-CpG O/E components (Figure 1). This was confirmed by mixture model analyses indicating that a 2-component Gaussian model provided better fit than a single-component model in all cases (Table 4). While there was some variability in models between species, all models were characterized by a low-CpG O/E component with a mean of 0.24 to 0.38 and weighted at 14-28% of the distribution. Conversely, high-CpG O/E components had means of 0.69 to 0.75 and weights of 72-86%.


Table 4. Results of mixture model analyses of CpG O/E in the six coral transcriptomes. Model statistics are reported for a 2-component mixture model, which provided better fit than a single component model. 

Organism | lambda | mu | sigma | log-likelihood (k = 1) | log-likelihood (k = 2)
--------- | ---------- | ---------- | ----------- | ----------- | ----------
*Acropora hyacinthus* | 0.14, 0.86 | 0.30, 0.75 | 0.11, 0.26 | -1950 | -1771
*Acropora millepora* | 0.17, 0.83 | 0.38, 0.74 | 0.11, 0.20 | 1023 | 1307
*Acropora palmata* | 0.27, 0.73 | 0.35, 0.73 | 0.12, 0.22 | -2664 | -1824
*Pocillopora damicornis* | 0.22, 0.78 | 0.24, 0.69 | 0.10, 0.25 | -3324 | -2464
*Porites astreoides* | 0.26, 0.74 | 0.34, 0.73 | 0.12, 0.23 | -1450 | -1115
*Stylophora pistillata* | 0.28, 0.72 | 0.33, 0.72 | 0.11, 0.23 | -660 | -413
 
 
When CpG O/E was evaluated according to gene function, we observed consistent patterns among species in relation to broad classes of biological processes. For all six species, the top four biological processes with the highest mean CpG O/E were cell-cell signalling, cell adhesion, signal transduction, and developmental processes (Figure 2). In contrast, DNA metabolism, protein metabolism, transport, and other biological processes were consistently among the lowest categories in terms of CpG O/E. These relatively high and low ranked biological processes were also more likely to be significantly enriched in the high and low CpG O/E components identified in the mixture model.

In *Acropora hyacinthus*, *A. millepora*, and *A. palmata*, genes expressed differentially in response to environmental stress showed distinct CpG O/E distributions from those of the whole transcriptomes (Figure 3, upper panel). In all cases, mean CpG O/E of differentially expressed genes (DEGs) was higher than that of the whole transcriptome. This was especially true for DEGs in response to thermal stress in *A. hyacinthus* and *A. palmata* (both p < 0.001), but CpG O/E distributions of OA DEGs and the whole transcriptome of *A. millepora* were also significantly different (p = 0.005). 

We also evaluated the contribution of different biological processes (GOslim terms) to DEG profiles by comparing their abundances in DEGs relative to whole transcriptomes (Figure 3, lower panel). In *A. hyacinthus*, DEGs were overrepresented by biological processes associated with the high-CpG O/E components identified in the mixture model, and underrepresented by biological processes associated with the low CpG O/E component. In *A. millepora*, DEGs were characterized by a striking increase in transport processes, which were not significantly enriched in either the high or low CpG O/E components of the mixture model. To a lesser extent, cell adhesion and developmental processes were overrepresented in DEGs, and these processes were enriched in the high CpG O/E component. Biological processes underrepresented in DEGs tended to be associated with the low CpG O/E component. Finally, in *A. palmata*, a mixture of processes enriched in both the high and low CpG O/E components were overrepresented in the DEGs. Processes underrepresented in DEGs were largely associated with the low CpG O/E component.
