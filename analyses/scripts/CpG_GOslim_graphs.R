#This script deals with reading in a tab delimited file
#containing CpGo/e and GOSlim information
#and plotting density and GO distributions

setwd("~/Documents/Projects/Coral-CpG-ratio-MS/analyses/Ahya")

#Read in CpG data and remove NA values

Ahya<-read.delim("Ahya_cpg_GOslim.tab", header=F)
Ahya2<-na.omit(Ahya)
AhyaMean<-tapply(Ahya2$V2, Ahya2$V3, mean)
AhyaSD<-tapply(Ahya2$V2, Ahya2$V3, sd)
AhyaLength<-tapply(Ahya2$V2, Ahya2$V3, length)
AhyaSE<-AhyaSD/sqrt(AhyaLength)
AhyaMean<-AhyaMean[2:15]
AhyaSE<-AhyaSE[2:15]

setwd("~/Documents/Projects/Coral-CpG-ratio-MS/analyses/Amil")

Amil<-read.delim("Amil_cpg_GOslim.tab", header=F)
Amil2<-na.omit(Amil)
AmilMean<-tapply(Amil2$V2, Amil2$V3, mean)
AmilSD<-tapply(Amil2$V2, Amil2$V3, sd)
AmilLength<-tapply(Amil2$V2, Amil2$V3, length)
AmilSE<-AmilSD/sqrt(AmilLength)
AmilMean<-AmilMean[2:15]
AmilSE<-AmilSE[2:15]

setwd("~/Documents/Projects/Coral-CpG-ratio-MS/analyses/Apalm")

Apalm<-read.delim("Apalm_cpg_GOslim.tab", header=F)
Apalm2<-na.omit(Apalm)
ApalmMean<-tapply(Apalm2$V2, Apalm2$V3, mean)
ApalmSD<-tapply(Apalm2$V2, Apalm2$V3, sd)
ApalmLength<-tapply(Apalm2$V2, Apalm2$V3, length)
ApalmSE<-ApalmSD/sqrt(ApalmLength)
ApalmMean<-ApalmMean[2:15]
ApalmSE<-ApalmSE[2:15]

setwd("~/Documents/Projects/Coral-CpG-ratio-MS/analyses/Pdam")

Pdam<-read.delim("Pdam_cpg_GOslim.tab", header=F)
Pdam2<-na.omit(Pdam)
PdamMean<-tapply(Pdam2$V2, Pdam2$V3, mean)
PdamSD<-tapply(Pdam2$V2, Pdam2$V3, sd)
PdamLength<-tapply(Pdam2$V2, Pdam2$V3, length)
PdamSE<-PdamSD/sqrt(PdamLength)
PdamMean<-PdamMean[2:15]
PdamSE<-PdamSE[2:15]

setwd("~/Documents/Projects/Coral-CpG-ratio-MS/analyses/Spist")

Spist<-read.delim("Spist_cpg_GOslim.tab", header=F)
Spist2<-na.omit(Spist)
SpistMean<-tapply(Spist2$V2, Spist2$V3, mean)
SpistSD<-tapply(Spist2$V2, Spist2$V3, sd)
SpistLength<-tapply(Spist2$V2, Spist2$V3, length)
SpistSE<-SpistSD/sqrt(SpistLength)

setwd("~/Documents/Projects/Coral-CpG-ratio-MS/analyses/Past")

Past<-read.delim("Past_cpg_GOslim.tab", header=F)
Past2<-na.omit(Past)
PastMean<-tapply(Past2$V2, Past2$V3, mean)
PastSD<-tapply(Past2$V2, Past2$V3, sd)
PastLength<-tapply(Past2$V2, Past2$V3, length)
PastSE<-PastSD/sqrt(PastLength)
PastMean<-PastMean[2:15]
PastSE<-PastSE[2:15]

GO <- as.data.frame(cbind(PdamMean, SpistMean, ApalmMean, PastMean, AmilMean, AhyaMean, PdamSE, SpistSE, ApalmSE, PastSE, AmilSE, AhyaSE))
grand_mean<-rowMeans(GO[,1:6])
GO2<-cbind(GO,grand_mean)


#Plot multiple barplots

par(mar = c(5,13,2,1))
par(mfrow = c(2, 3)) # 2 x 3 plots

Ahya_plot<-GO[order(GO[,6],decreasing=FALSE),]
Ahya_means<-Ahya_plot[,6]
Ahya_se<-Ahya_plot[,12]
Ahya_mp<-barplot(Ahya_plot[,6], plot=FALSE, beside=TRUE, horiz=TRUE, las=2, col=c(40,42,44,46,48,50))
barplot(Ahya_plot[,6],xlim=c(0.5,0.9), axes=FALSE, beside=TRUE, xpd=F, horiz=TRUE, las=2, names.arg=row.names(Ahya_plot), col=0, cex.axis = 0.7, cex.lab = 0.7, cex = 0.7, main = "Acropora hyacinthus", font.main = 3, cex.main = 0.8)
segments(Ahya_means - Ahya_se, Ahya_mp, Ahya_means + Ahya_se, Ahya_mp)
axis(side =1, cex.axis = 0.7)

Amil_plot<-GO[order(GO[,5],decreasing=FALSE),]
Amil_means<-Amil_plot[,5]
Amil_se<-Amil_plot[,11]
Amil_mp<-barplot(Amil_plot[,5], plot=FALSE, beside=TRUE, horiz=TRUE, las=2, col=c(40,42,44,46,48,50))
barplot(Amil_plot[,5],xlim=c(0.5,0.9), axes=FALSE, beside=TRUE, xpd=F, horiz=TRUE, las=2, names.arg=row.names(Amil_plot), col=0, cex.axis = 0.7, cex.lab = 0.7, cex = 0.7, main = "Acropora millepora", font.main = 3, cex.main = 0.8)
segments(Amil_means - Amil_se, Amil_mp, Amil_means + Amil_se, Amil_mp)
axis(side =1, cex.axis = 0.7)

Apalm_plot<-GO[order(GO[,3],decreasing=FALSE),]
Apalm_means<-Apalm_plot[,3]
Apalm_se<-Apalm_plot[,9]
Apalm_mp<-barplot(Apalm_plot[,3], plot=FALSE, beside=TRUE, horiz=TRUE, las=2, col=c(40,42,44,46,48,50))
barplot(Apalm_plot[,3],xlim=c(0.5,0.9), axes=FALSE, beside=TRUE, xpd=F, horiz=TRUE, las=2, names.arg=row.names(Apalm_plot), col=0, cex.axis = 0.7, cex.lab = 0.7, cex = 0.7, main = "Acropora palmata", font.main = 3, cex.main = 0.8)
segments(Apalm_means - Apalm_se, Apalm_mp, Apalm_means + Apalm_se, Apalm_mp)
axis(side =1, cex.axis = 0.7)

Pdam_plot<-GO[order(GO[,1],decreasing=FALSE),]
Pdam_means<-Pdam_plot[,1]
Pdam_se<-Pdam_plot[,7]
Pdam_mp<-barplot(Pdam_plot[,1], plot=FALSE, beside=TRUE, horiz=TRUE, las=2, col=c(40,42,44,46,48,50))
barplot(Pdam_plot[,1],xlim=c(0.5,0.9), axes=FALSE, beside=TRUE, xpd=F, horiz=TRUE, las=2, names.arg=row.names(Pdam_plot), col=0, xlab = "CpG O/E", cex.axis = 0.7, cex.lab = 0.7, cex = 0.7, main = "Pocillopora damicornis", font.main = 3, cex.main = 0.8)
segments(Pdam_means - Pdam_se, Pdam_mp, Pdam_means + Pdam_se, Pdam_mp)
axis(side =1, cex.axis = 0.7)

Past_plot<-GO[order(GO[,4],decreasing=FALSE),]
Past_means<-Past_plot[,4]
Past_se<-Past_plot[,10]
Past_mp<-barplot(Past_plot[,4], plot=FALSE, beside=TRUE, horiz=TRUE, las=2, col=c(40,42,44,46,48,50))
barplot(Past_plot[,4],xlim=c(0.5,0.9), axes=FALSE, beside=TRUE, xpd=F, horiz=TRUE, las=2, names.arg=row.names(Past_plot), col=0, cex.axis = 0.7, cex.lab = 0.7, cex = 0.7, main = "Porites astreoides", font.main = 3, cex.main = 0.8)
segments(Past_means - Past_se, Past_mp, Past_means + Past_se, Past_mp)
axis(side =1, cex.axis = 0.7)

Spist_plot<-GO[order(GO[,2],decreasing=FALSE),]
Spist_means<-Spist_plot[,2]
Spist_se<-Spist_plot[,8]
Spist_mp<-barplot(Spist_plot[,2], plot=FALSE, beside=TRUE, horiz=TRUE, las=2, col=c(40,42,44,46,48,50))
barplot(Spist_plot[,2],xlim=c(0.5,0.9), axes=FALSE, beside=TRUE, xpd=F, horiz=TRUE, las=2, names.arg=row.names(Spist_plot), col=0, cex.axis = 0.7, cex.lab = 0.7, cex = 0.7, main = "Stylophora pistillata", font.main = 3, cex.main = 0.8)
segments(Spist_means - Spist_se, Spist_mp, Spist_means + Spist_se, Spist_mp)
axis(side =1, cex.axis = 0.7)

######Stats

#Levene's test of homogeneity of variances
library(car)
Ahya_levene<-leveneTest(V2 ~ V3, data = Ahya2) #Ahya data is homoscedastic
Ahya_levene

#ANOVA
Ahya_aov<-aov(V2 ~ V3, data = Ahya2) #Highly sig. different (p = 2e-16)
Ahya_aov
summary(Ahya_aov)

#Tukey HSD post-hoc test
Ahya_tukey<-TukeyHSD(Ahya_aov)
Ahya_tukey
Ahya_pvalues<-Ahya_tukey$V3[,4]

#Write output to excel spreadsheet
library(xlsx)
write.xlsx(Ahya_pvalues, "/Users/jd/Documents/Projects/Coral-CpG-ratio-MS/analyses/Ahya_pvalues.xlsx") 

#Repeat for next datasets

Amil_levene<-leveneTest(V2 ~ V3, data = Amil2) 
Amil_levene
Amil_aov<-aov(V2 ~ V3, data = Amil2) 
Amil_aov
summary(Amil_aov)
Amil_tukey<-TukeyHSD(Amil_aov)
Amil_tukey
Amil_pvalues<-Amil_tukey$V3[,4]
write.xlsx(Amil_pvalues, "/Users/jd/Documents/Projects/Coral-CpG-ratio-MS/analyses/Amil_pvalues.xlsx") 


Apalm_levene<-leveneTest(V2 ~ V3, data = Apalm2) 
Apalm_levene
Apalm_aov<-aov(V2 ~ V3, data = Apalm2) 
Apalm_aov
summary(Apalm_aov)
Apalm_tukey<-TukeyHSD(Apalm_aov)
Apalm_tukey
Apalm_pvalues<-Apalm_tukey$V3[,4]
write.xlsx(Apalm_pvalues, "/Users/jd/Documents/Projects/Coral-CpG-ratio-MS/analyses/Apalm_pvalues.xlsx") 


Pdam_levene<-leveneTest(V2 ~ V3, data = Pdam2) 
Pdam_levene
Pdam_aov<-aov(V2 ~ V3, data = Pdam2) 
Pdam_aov
summary(Pdam_aov)
Pdam_tukey<-TukeyHSD(Pdam_aov)
Pdam_tukey
Pdam_pvalues<-Pdam_tukey$V3[,4]
write.xlsx(Pdam_pvalues, "/Users/jd/Documents/Projects/Coral-CpG-ratio-MS/analyses/Pdam_pvalues.xlsx") 


Spist_levene<-leveneTest(V2 ~ V3, data = Spist2) 
Spist_levene
Spist_aov<-aov(V2 ~ V3, data = Spist2) 
Spist_aov
summary(Spist_aov)
Spist_tukey<-TukeyHSD(Spist_aov)
Spist_tukey
Spist_pvalues<-Spist_tukey$V3[,4]
write.xlsx(Spist_pvalues, "/Users/jd/Documents/Projects/Coral-CpG-ratio-MS/analyses/Spist_pvalues.xlsx") 


Past_levene<-leveneTest(Past3 ~ V2, data = Past5) 
Past_levene
Past_aov<-aov(Past3 ~ V2, data = Past5) 
Past_aov
summary(Past_aov)
Past_tukey<-TukeyHSD(Past_aov)
Past_tukey
Past_pvalues<-Past_tukey$V3[,4]
write.xlsx(Past_pvalues, "/Users/jd/Documents/Projects/Coral-CpG-ratio-MS/analyses/Past_pvalues.xlsx") 

###All datasets except Ahya violate assumption of equal variances, but not severely. Examination of variances
#by group indicates that the largest variance is never more than about 2-3 times larger than the smallest.

Ahya_var<-tapply(Ahya2$V2, Ahya2$V3, var)
Amil_var<-tapply(Amil2$V2, Amil2$V3, var)
Apalm_var<-tapply(Apalm2$V2, Apalm2$V3, var)
Pdam_var<-tapply(Pdam2$V2, Pdam2$V3, var)
Spist_var<-tapply(Spist2$V2, Spist2$V3, var)
Past_var<-tapply(Past5$Past3, Past5$V2, var)



##Plot single barplot ordered by grand mean

GO3<-GO2[order(GO2[,13],decreasing=FALSE),]
GO4<-t(GO3)
par(mar=c(5,18,2,2))
midpoints<-barplot(GO4[1:6,],xlim=c(0.5,0.8),plot=FALSE, beside=TRUE, xpd=F, horiz=TRUE, las=2, col=c(1,2,3,4,5,6))
means<-GO4[1:6,]
SE<-GO4[7:12]
library(RColorBrewer)
colors<-brewer.pal(6, "Set3")
barplot(GO4[1:6,],xlim=c(0.5,0.9), axes=FALSE, beside=TRUE, xpd=F, horiz=TRUE, las=2, col=colors)
segments(means - SE, midpoints, means + SE, midpoints)
axis(side =1)
title(xlab="CpG O/E")
names<-c("P. damicornis", "S. pistillata", "A. palmata", "P. astreoides", "A. millepora", "A. hyacinthus")
revnames<-rev(names)
revcolors<-rev(colors)
legend(x = .75, y = 28, legend = revnames, fill = revcolors, border = 1, bty = "n", text.font = 3, cex =0.75)

