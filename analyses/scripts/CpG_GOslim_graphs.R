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

setwd("~/Documents/Projects/Coral-CpG-ratio-MS/analyses/Amil")

Amil<-read.delim("Amil_cpg_GOslim.tab", header=F)
Amil2<-na.omit(Amil)
AmilMean<-tapply(Amil2$V2, Amil2$V3, mean)
AmilSD<-tapply(Amil2$V2, Amil2$V3, sd)
AmilLength<-tapply(Amil2$V2, Amil2$V3, length)
AmilSE<-AmilSD/sqrt(AmilLength)

setwd("~/Documents/Projects/Coral-CpG-ratio-MS/analyses/Apalm")

Apalm<-read.delim("Apalm_cpg_GOslim.tab", header=F)
Apalm2<-na.omit(Apalm)
ApalmMean<-tapply(Apalm2$V2, Apalm2$V3, mean)
ApalmSD<-tapply(Apalm2$V2, Apalm2$V3, sd)
ApalmLength<-tapply(Apalm2$V2, Apalm2$V3, length)
ApalmSE<-ApalmSD/sqrt(ApalmLength)

setwd("~/Documents/Projects/Coral-CpG-ratio-MS/analyses/Pdam")

Pdam<-read.delim("Pdam_cpg_GOslim.tab", header=F)
Pdam2<-na.omit(Pdam)
PdamMean<-tapply(Pdam2$V2, Pdam2$V3, mean)
PdamSD<-tapply(Pdam2$V2, Pdam2$V3, sd)
PdamLength<-tapply(Pdam2$V2, Pdam2$V3, length)
PdamSE<-PdamSD/sqrt(PdamLength)

setwd("~/Documents/Projects/Coral-CpG-ratio-MS/analyses/Spist")

Spist<-read.delim("Spist_cpg_GOslim.tab", header=F)
Spist2<-na.omit(Spist)
SpistMean<-tapply(Spist2$V2, Spist2$V3, mean)
SpistSD<-tapply(Spist2$V2, Spist2$V3, sd)
SpistLength<-tapply(Spist2$V2, Spist2$V3, length)
SpistSE<-SpistSD/sqrt(SpistLength)

setwd("~/Documents/Projects/Coral-CpG-ratio-MS/analyses/Past")

Past<-read.delim("past_cpg_goslim_tab", skip = 1, header = FALSE)
Past2<-na.omit(Past)
Past3<-as.numeric(as.character((Past2$V2))) #this data needed some additional tweaking
Past4<-as.data.frame(cbind(Past3,Past2$V4))
Past5<-na.omit(Past4)
PastMean<-tapply(Past5$Past3, Past5$V2, mean)
PastSD<-tapply(Past5$Past3, Past5$V2, sd)
PastLength<-tapply(Past5$Past3, Past5$V2, length)
PastSE<-PastSD/sqrt(PastLength)


GO <- as.data.frame(cbind(AhyaMean, AmilMean, ApalmMean, PastMean, PdamMean))
GO2<-GO[2:15,]
GO3<-cbind(GO2,SpistMean)
GO4<-as.data.frame(cbind(AhyaSE, AmilSE, ApalmSE, PastSE, PdamSE))
GO5<-GO4[2:15,]
GO6<-cbind(GO5, SpistSE)
GO7<-cbind(GO3,GO6)
grand_mean<-rowMeans(GO7[,1:6])
GO8<-cbind(GO7,grand_mean)

##Plot single barplot
GO9<-GO8[order(GO8[,13],decreasing=FALSE),]
GO10<-t(GO9)
par(mar=c(5,14,4,2))
barplot (GO10[1:6,],xlim=c(0.5,0.8),beside=TRUE, xpd=F, horiz=TRUE, las=2, col=c(1,2,3,4,5,6))

#Plot multiple barplots

par(mar=c(5,14,4,2))
par(mfrow = c(2, 3)) # 2 x 3 plots

Ahya_plot<-GO7[order(GO7[,1],decreasing=FALSE),]
Ahya_means<-Ahya_plot[,1]
Ahya_se<-Ahya_plot[,7]
Ahya_mp<-barplot(Ahya_plot[,1],beside=TRUE, horiz=TRUE, las=2, col=c(40,42,44,46,48,50))
barplot(Ahya_plot[,1],xlim=c(0.5,0.9),beside=TRUE, xpd=F, horiz=TRUE, las=2, names.arg=row.names(Ahya_plot), col=0)
segments(Ahya_means - Ahya_se, Ahya_mp, Ahya_means + Ahya_se, Ahya_mp)

Amil_plot<-GO7[order(GO7[,2],decreasing=FALSE),]
Amil_means<-Amil_plot[,2]
Amil_se<-Amil_plot[,8]
Amil_mp<-barplot(Amil_plot[,2],beside=TRUE, horiz=TRUE, las=2, col=c(40,42,44,46,48,50))
barplot(Amil_plot[,2],xlim=c(0.5,0.9),beside=TRUE, xpd=F, horiz=TRUE, las=2, names.arg=row.names(Amil_plot), col=0)
segments(Amil_means - Amil_se, Amil_mp, Amil_means + Amil_se, Amil_mp)

Apalm_plot<-GO7[order(GO7[,3],decreasing=FALSE),]
Apalm_means<-Apalm_plot[,3]
Apalm_se<-Apalm_plot[,9]
Apalm_mp<-barplot(Apalm_plot[,3],beside=TRUE, horiz=TRUE, las=2, col=c(40,42,44,46,48,50))
barplot(Apalm_plot[,3],xlim=c(0.5,0.9),beside=TRUE, xpd=F, horiz=TRUE, las=2, names.arg=row.names(Apalm_plot), col=0)
segments(Apalm_means - Apalm_se, Apalm_mp, Apalm_means + Apalm_se, Apalm_mp)

Past_plot<-GO7[order(GO7[,4],decreasing=FALSE),]
Past_means<-Past_plot[,4]
Past_se<-Past_plot[,10]
Past_mp<-barplot(Past_plot[,4],beside=TRUE, horiz=TRUE, las=2, col=c(40,42,44,46,48,50))
barplot(Past_plot[,4],xlim=c(0.5,0.9),beside=TRUE, xpd=F, horiz=TRUE, las=2, names.arg=row.names(Past_plot), col=0)
segments(Past_means - Past_se, Past_mp, Past_means + Past_se, Past_mp)

Pdam_plot<-GO7[order(GO7[,5],decreasing=FALSE),]
Pdam_means<-Pdam_plot[,5]
Pdam_se<-Pdam_plot[,11]
Pdam_mp<-barplot(Pdam_plot[,5],beside=TRUE, horiz=TRUE, las=2, col=c(40,42,44,46,48,50))
barplot(Pdam_plot[,5],xlim=c(0.5,0.9),beside=TRUE, xpd=F, horiz=TRUE, las=2, names.arg=row.names(Pdam_plot), col=0)
segments(Pdam_means - Pdam_se, Pdam_mp, Pdam_means + Pdam_se, Pdam_mp)

Spist_plot<-GO7[order(GO7[,6],decreasing=FALSE),]
Spist_means<-Spist_plot[,6]
Spist_se<-Spist_plot[,12]
Spist_mp<-barplot(Spist_plot[,6],beside=TRUE, horiz=TRUE, las=2, col=c(40,42,44,46,48,50))
barplot(Spist_plot[,6],xlim=c(0.5,0.9),beside=TRUE, xpd=F, horiz=TRUE, las=2, names.arg=row.names(Spist_plot), col=0)
segments(Spist_means - Spist_se, Spist_mp, Spist_means + Spist_se, Spist_mp)

