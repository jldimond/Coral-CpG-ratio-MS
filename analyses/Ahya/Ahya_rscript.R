#This script plots and compares mixture models for CpG ratio data

setwd("~/Documents/Projects/Coral-CpG-ratio-MS/analyses/Ahya")

#Read in CpG data and remove NA values

Ahya_cpg<-read.delim("ID_CpG", header=F)
Ahya_cpg2<-na.omit(Ahya_cpg)

#Fitting mixture model with mixtools normalmixEM

library(mixtools)
data <- Ahya_cpg2$V2
data2 <- data[data <= 1.5] #Cutting off high values
set.seed(101)
mixmdl <- normalmixEM(data2)
plot(mixmdl, which = 2)
lines(density(data2), lty=2, lwd=2)

# Use mclust to compare models

library(mclust)
data2Mclust <- Mclust(data2, G = 1:2) 
summary(data2Mclust)





##OLD STUFF

#Create density 
dencpg<-density(Ahya_cpg$Column2, na.rm=T)
dencpg_diff <- density(Ahya_diff$Column2, na.rm=T)

#Plot

plot(dencpg, xlim=c(0,1.7), ylim=c(0,1.6), main=NULL, xlab="CpG ratio", cex=1, lwd=2, col="#6C2DC760")
lines(dencpg_diff, col="#C11B1760", cex=1, lwd=2)
polygon(dencpg, col="#6C2DC760")
polygon(dencpg_diff,col="#C11B1760")
legend(x="topleft", c("whole transcriptome", "thermal stress genes"), col = c("#6C2DC760","#C11B1760"), lwd=2, bty="n", x.intersp=0.5)

