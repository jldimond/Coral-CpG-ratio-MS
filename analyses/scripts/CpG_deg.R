# This script evaluates differentiallly expressed genes in
# Acropora hyacinthus, A. millepora, and A. palmata

#Read in Ahya CpG data

setwd("~/Documents/Projects/Coral-CpG-ratio-MS/analyses/Ahya")

Ahya_cpg<- read.delim("Ahya_cpg_anno", header=FALSE)
Ahya_diff<- read.delim("Ahya_diff_cpg_anno", header = FALSE)
Ahya_diff_goslim<- na.omit(read.delim("Ahya_diff_cpg_GOslim", header = FALSE))
AhyaLength <- tapply(Ahya_goslim$V2, Ahya_goslim$V3, length)
AhyaProp <- AhyaLength / sum(AhyaLength[2:15])
AhyaDiffLength <- tapply(Ahya_diff_goslim$V2, Ahya_diff_goslim$V3, length)
AhyaDiffProp <- AhyaDiffLength / sum(AhyaDiffLength[2:15])
AhyaDiffDiff <- (AhyaDiffProp[2:15] - AhyaProp[2:15]) * 100

#Create density using threshold values
Ahya_dencpg<-density(Ahya_cpg$V2[Ahya_cpg$V2 >= 0.001 & Ahya_cpg$V2 <= 1.5], na.rm=T)
Ahya_dencpg_diff <- density(Ahya_diff$V2[Ahya_diff$V2 >= 0.001 & Ahya_diff$V2 <= 1.5], na.rm=T)

#Read in Amil CpG data 

setwd("~/Documents/Projects/Coral-CpG-ratio-MS/analyses/Amil")

Amil_cpg<- read.delim("Amil_cpg_anno", header=FALSE)
Amil_diff<- read.delim("Amil_diff_cpg_anno", header = FALSE)
Amil_diff_goslim<- na.omit(read.delim("Amil_diff_cpg_GOslim", header = FALSE))
Amil2<-subset(Amil_diff_goslim, V2 >= 0.001 & V2 <= 1.5)
AmilMean<-tapply(Amil2$V2, Amil2$V3, mean)
AmilSD<-tapply(Amil2$V2, Amil2$V3, sd)
AmilLength<-tapply(Amil2$V2, Amil2$V3, length)
AmilSE<-AmilSD/sqrt(AmilLength)
AmilMean<-AmilMean[2:15]
AmilSE<-AmilSE[2:15]

#Create density using threshold values
Amil_dencpg<-density(Amil_cpg$V2[Amil_cpg$V2 >= 0.001 & Amil_cpg$V2 <= 1.5], na.rm=T)
Amil_dencpg_diff <- density(Amil_diff$V2[Amil_diff$V2 >= 0.001 & Amil_diff$V2 <= 1.5], na.rm=T)

#Read in Apalm CpG data 

setwd("~/Documents/Projects/Coral-CpG-ratio-MS/analyses/Apalm")

Apalm_cpg<- read.delim("Apalm_cpg_anno", header=FALSE)
Apalm_diff<- read.delim("Apalm_diff_cpg_anno", header = FALSE)
Apalm_diff_goslim<- na.omit(read.delim("Apalm_diff_cpg_GOslim", header = FALSE))
Apalm2<-subset(Apalm_diff_goslim, V2 >= 0.001 & V2 <= 1.5)
ApalmMean<-tapply(Apalm2$V2, Apalm2$V3, mean)
ApalmSD<-tapply(Apalm2$V2, Apalm2$V3, sd)
ApalmLength<-tapply(Apalm2$V2, Apalm2$V3, length)
ApalmSE<-ApalmSD/sqrt(ApalmLength)
ApalmMean<-ApalmMean[2:15]
ApalmSE<-ApalmSE[2:15]

#Create density using threshold values
Apalm_dencpg<-density(Apalm_cpg$V2[Apalm_cpg$V2 >= 0.001 & Apalm_cpg$V2 <= 1.5], na.rm=T)
Apalm_dencpg_diff <- density(Apalm_diff$V2[Apalm_diff$V2 >= 0.001 & Apalm_diff$V2 <= 1.5], na.rm=T)


# Plot of density curves

par(mfrow = c(1,3)) # 1 x 3 plots
par(xaxs="i", yaxs="i") 

plot(Ahya_dencpg, xlim=c(0,1.6), ylim=c(0,2.1), main= "Acropora hyacinthus", font.main = 3, xlab=" ", bty = "l", cex=1, lwd=2)
lines(Ahya_dencpg_diff, cex=1, lwd=2, lty = 2)
legend(x=0.1, y = 2.1, c("whole transcriptome", "env response genes"), xpd = TRUE, lwd=2, bty="n", cex = 0.9, lty = c(1, 2), x.intersp=0.5)

plot(Amil_dencpg, xlim=c(0,1.6), ylim=c(0,2.1), main= "Acropora millepora", font.main = 3, xlab="CpG O/E", ylab=" ", bty = "l", cex=1, lwd=2)
lines(Amil_dencpg_diff, cex=1, lwd=2, lty = 2)

plot(Apalm_dencpg, xlim=c(0,1.6), ylim=c(0,2.1), main= "Acropora palmata", font.main = 3, xlab=" ", ylab=" ", bty = "l", cex=1, lwd=2)
lines(Apalm_dencpg_diff, cex=1, lwd=2, lty = 2)

###########Stats 
#- Kolmogorov-Smirnov test

ks.test(Ahya_cpg$V2,Ahya_diff$V2) #p-value < 2.2e-16
ks.test(Amil_cpg$V2,Amil_diff$V2) #p-value = 0.005778
ks.test(Apalm_cpg$V2,Apalm_diff$V2) #p-value = < 2.2e-16


# Fancy plot

par(mfrow = c(1,3))
par(xaxs="i", yaxs="i") 

plot(Ahya_dencpg, xlim=c(0,1.6), ylim=c(0,2), main= "Acropora hyacinthus", font.main = 3, xlab=" ", bty = "l", cex=1, lwd=2, col="#6C2DC760")
lines(Ahya_dencpg_diff, col="#C11B1760", cex=1, lwd=2)
polygon(Ahya_dencpg, col="#6C2DC760")
polygon(Ahya_dencpg_diff,col="#C11B1760")
legend(x=0.1, y = 2.2, c("whole transcriptome", "env response genes"), xpd = TRUE, col = c("#6C2DC760","#C11B1760"), lwd=2, bty="n", cex = 1, x.intersp=0.5)

plot(Amil_dencpg, xlim=c(0,1.6), ylim=c(0,2), main= "Acropora millepora", font.main = 3, xlab="CpG O/E", ylab=" ", bty = "l", cex=1, lwd=2, col="#6C2DC760")
lines(Amil_dencpg_diff, col="#C11B1760", cex=1, lwd=2)
polygon(Amil_dencpg, col="#6C2DC760")
polygon(Amil_dencpg_diff,col="#C11B1760")

plot(Apalm_dencpg, xlim=c(0,1.6), ylim=c(0,2), main= "Acropora palmata", font.main = 3, xlab=" ", ylab=" ", bty = "l", cex=1, lwd=2, col="#6C2DC760")
lines(Apalm_dencpg_diff, col="#C11B1760", cex=1, lwd=2)
polygon(Apalm_dencpg, col="#6C2DC760")
polygon(Apalm_dencpg_diff,col="#C11B1760")