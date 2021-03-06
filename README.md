# Germline DNA methylation in reef corals: patterns and potential roles in response to environmental change

---

This respository includes files used to develop a manuscript on DNA methylation patterns in six species of reef corals, including analysis of genes differentially expressed in response to environmental change. The repository is tied to an [Authorea manuscript](https://www.authorea.com/users/16716/articles/18248/_show_article).

---

**Directory structure**      

`analyses/` - Includes subdirectories for each coral species analyzed, which include output from analyses performed in jupyter (formerly IPython) notebooks. Also includes a `scripts/` directory where R scripts used for graphics and statistical analyses are housed, as well as scripts called on from jupyter notebooks. Coral species subdirectories include:

  `analyses/Ahya` - *Acropora hyacinthus* 
  
  `analyses/Amil` - *Acropora millepora* 
  
  `analyses/Apalm` - *Acropora palmata* 
  
  `analyses/Past` - *Porites astreoides* 
  
  `analyses/Pdam` - *Pocillopora damicornis* 
  
  `analyses/Spist` - *Stylophora pistillata* 
  

`bibliography/` - Houses a .bib file used in Authorea.

`data/` - Raw data, such as fasta files. These are housed in separate subdirectories for each species, with the same names as those in the analyses directory.

`figures/` - Manuscript figures.

`ipynb/` - jupyter notebooks.

`.gitignore` - File instructing git to ignore large files	for upload.

The following files are components of the manuscript itself. The [Authorea interface](https://www.authorea.com/users/16716/articles/18248/_show_article) combines these files for better readability.

`abstract.md`

`acknowledgements.md`

`author_contributions.md`
	
`data_accessibility.md`

`discussion.md` 

`header.tex` 

`introduction.md` 

`layout.md` 	

`methods.md` 

`outline.md` 	

`preamble.tex` 	

`results.md` 

`title.tex`

---

Sofware versions originally used in this analyses (on Mac OS X v10.10.3) include: 

* Python: 2.7.9  
* IPython: 3.1.0
* R: 3.1.3  
* NCBI Blast: 2.2.3 

---

#Instructions for full annotation and analysis (interactive execution) notebook

1) **Before you get started**

To execute the jupter (Ipython, `.ipynb`) notebooks in their entirety you will need:   

* IPython - [install instructions](http://ipython.org/install.html)    
* NBCI Blast -  [install instructions](http://blast.ncbi.nlm.nih.gov/Blast.cgi?CMD=Web&PAGE_TYPE=BlastDocs&DOC_TYPE=Download)  
* R - [install instructions](http://www.r-project.org/)  
* SQLShare-pythonclient (optional; current workflow uses manual upload and download) [install instructions](https://github.com/uwescience/sqlshare-pythonclient)

---

In addition you will need a local copy of the UniProt/SwissProt Blast Database. 
If you do not already have this database you can create it once you install NCBI Blast. Create a blast database first download a fasta file from <http://www.uniprot.org/downloads> that of Reviewed (Swiss-Prot) then run make blastdb commands.
Below is an example code if you wanted to create the database in a subdirectory named `blastdb`. This will result in files > 300 MB.

`$ mkdir blastdb`

`$ cd blastdb`

`$ curl -O ftp://ftp.uniprot.org/pub/databases/uniprot/current_release/knowledgebase/complete/uniprot_sprot.fasta.gz`

`$ gunzip uniprot_sprot.fasta.gz`

`$ makeblastdb -in uniprot_sprot.fasta -dbtype prot -out uniprot_sprot`

This will generate a Protein database that you can use to blast sequences. 

---

2) Download the repository zip file to a local directory and uncompress. 

3) Launch IPython from the repository primary directory. 
For example, using Terminal on MacOSX.


```
$ cd /Desktop/Coral-CpG-ratio-MS
$ ipython notebook

```
This will launch IPython in your web browser.  


4) Open notebook by clicking on any `.ipynb` files. This will open a new tab in your browser.

5) Execute code as written or modify to your liking. To execute cell type *shift-enter*. Relative pathnames assume you are within the Coral-CpG-ratio-MS directory.


---

**Workflow** 

1) The workflow for each species starts with jupyter notebooks ending with the suffix `_blast_anno.ipynb`, which performs a blast annotation of the transcriptome and provides instructions for further annotation with GOSlim terms. 
2) For *P. damicornis* and *S. pistillata*, jupyter notebooks with the suffix `_zoox_removal.ipynb` are used to remove putative *Symbiodinium* sequences. 
3) Next, for all species, CpG O/E analysis is carried out in jupyter notebooks with the suffix `_CpG_ratio.ipynb`. 
4) For *A. hyacinthus*, *A. millepora*, and *A. palmata*, gene expression count data are processed using jupyter notebooks with the suffix `_expression.ipynb`.
4) The remainder of analyses (plotting and statistics) is conducted in R using the following scripts: 

- `CpG_Density.R`: Plots and compares mixture models for CpG O/E data.
- `CpG_GOslim.R`: Deals with reading in a tab delimited file containing CpGo/e and GOSlim information. The script performs Fisher's exact tests and plots various types of figures. Note that some files are derived from analyses created in `CpG_Density.R`, so that script should be run prior to and alongside this one.
- `CpG_deg.R`: Evaluates differentiallly expressed genes in *A. hyacinthus*, *A. millepora*, and *A. palmata*.
- `Expression.R`: Analyzes gene expression vs. CpG O/E in *A. hyacinthus*, *A. millepora*, and *A. palmata*.

---

We are actively trying to improve this realizing that we are likely missing dependancies, etc. Any suggestions or feedback is welcome. 

