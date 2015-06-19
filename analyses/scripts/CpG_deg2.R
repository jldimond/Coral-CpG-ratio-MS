
library(plotrix)

setwd("~/Documents/Projects/Coral-CpG-ratio-MS/analyses/Ahya")

Ahya_goslim <- na.omit(read.delim("Ahya_cpg_GOslim.tab", header=F))
Ahya_diff_goslim <- na.omit(read.delim("Ahya_diff_cpg_GOslim", header = FALSE))
AhyaLength <- tapply(Ahya_goslim$V2, Ahya_goslim$V3, length)
AhyaProp <- AhyaLength / sum(AhyaLength[2:15])
AhyaDiffLength <- tapply(Ahya_diff_goslim$V2, Ahya_diff_goslim$V3, length)
AhyaDiffProp <- AhyaDiffLength / sum(AhyaDiffLength[2:15])
AhyaDiffDiff <- (AhyaDiffProp[2:15] - AhyaProp[2:15]) * 100

par(mar = c(5,13,2,1))
par(mfrow = c(2, 3)) # 2 x 3 plots

Ahya_plot <- sort(AhyaDiffDiff, decreasing=FALSE)
barplot(Ahya_plot, xlim = c(-5, 5), axes=FALSE, beside=TRUE, xpd=F, horiz=TRUE, las=2, names.arg=row.names(Ahya_plot), col=0, cex.axis = 0.7, cex.lab = 0.7, cex = 0.7, main = "Acropora hyacinthus", font.main = 3, cex.main = 0.8)
axis(side =1, cex.axis = 0.7)

setwd("~/Documents/Projects/Coral-CpG-ratio-MS/analyses/Amil")

Amil_goslim <- na.omit(read.delim("Amil_cpg_GOslim.tab", header=F))
Amil_diff_goslim <- na.omit(read.delim("Amil_diff_cpg_GOslim", header = FALSE))
AmilLength <- tapply(Amil_goslim$V2, Amil_goslim$V3, length)
AmilProp <- AmilLength / sum(AmilLength[2:15])
AmilDiffLength <- tapply(Amil_diff_goslim$V2, Amil_diff_goslim$V3, length)
AmilDiffProp <- AmilDiffLength / sum(AmilDiffLength[2:15])
AmilDiffDiff <- (AmilDiffProp[2:15] - AmilProp[2:15]) * 100

Amil_plot <- sort(AmilDiffDiff, decreasing=FALSE)
barplot(Amil_plot, xlim = c(-15, 15), axes=FALSE, beside=TRUE, xpd=F, horiz=TRUE, las=2, names.arg=row.names(Amil_plot), col=0, cex.axis = 0.7, cex.lab = 0.7, cex = 0.7, main = "Acropora hyacinthus", font.main = 3, cex.main = 0.8)
axis(side =1, cex.axis = 0.7)
 

setwd("~/Documents/Projects/Coral-CpG-ratio-MS/analyses/Apalm")

Apalm_goslim <- na.omit(read.delim("Apalm_cpg_GOslim.tab", header=F))
Apalm_diff_goslim <- na.omit(read.delim("Apalm_diff_cpg_GOslim", header = FALSE))
ApalmLength <- tapply(Apalm_goslim$V2, Apalm_goslim$V3, length)
ApalmProp <- ApalmLength / sum(ApalmLength[2:15])
ApalmDiffLength <- tapply(Apalm_diff_goslim$V2, Apalm_diff_goslim$V3, length)
ApalmDiffProp <- ApalmDiffLength / sum(ApalmDiffLength[2:15])
ApalmDiffDiff <- (ApalmDiffProp[2:15] - ApalmProp[2:15]) * 100

Apalm_plot <- sort(ApalmDiffDiff, decreasing=FALSE)
barplot(Apalm_plot, xlim = c(-5, 5), axes=FALSE, beside=TRUE, xpd=F, horiz=TRUE, las=2, names.arg=row.names(Apalm_plot), col=0, cex.axis = 0.7, cex.lab = 0.7, cex = 0.7, main = "Acropora hyacinthus", font.main = 3, cex.main = 0.8)
axis(side =1, cex.axis = 0.7)
