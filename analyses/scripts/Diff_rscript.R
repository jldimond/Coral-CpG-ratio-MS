#This script plots A. hyacinthus CpG data

setwd("~/Documents/Projects/Coral-CpG-ratio-MS/analyses/Ahya")


#Read in CpG data 

Ahya_cpg<- read.delim("ID_CpG", header=FALSE)
Ahya_diff<- read.delim("Ahya_diff_cpg.tab", header = FALSE)

#Create density 
Ahya_dencpg<-density(Ahya_cpg$V2, na.rm=T)
Ahya_dencpg_diff <- density(Ahya_diff$V2, na.rm=T)


setwd("~/Documents/Projects/Coral-CpG-ratio-MS/analyses/Amil")


#Read in CpG data 

Amil_cpg<- read.delim("ID_CpG", header=FALSE)
Amil_diff<- read.delim("Moya_OA_CpG", header = FALSE)

#Create density 
Amil_dencpg<-density(Amil_cpg$V2, na.rm=T)
Amil_dencpg_diff <- density(Amil_diff$V2, na.rm=T)


setwd("~/Documents/Projects/Coral-CpG-ratio-MS/analyses/Apalm")


#Read in CpG data 

Apalm_cpg<- read.delim("ID_CpG", header=FALSE)
Apalm_diff<- read.delim("day1and2temp_CpG", header = FALSE)

#Create density 
Apalm_dencpg<-density(Apalm_cpg$V2, na.rm=T)
Apalm_dencpg_diff <- density(Apalm_diff$V2, na.rm=T)

#Plot

par(mfrow = c(1,3))
par(xaxs="i", yaxs="i") 

plot(Ahya_dencpg, xlim=c(0,1.6), ylim=c(0,2), main= "Acropora hyacinthus", font.main = 3, xlab=" ", bty = "l", cex=1, lwd=2, col="#6C2DC760")
lines(Ahya_dencpg_diff, col="#C11B1760", cex=1, lwd=2)
polygon(Ahya_dencpg, col="#6C2DC760")
polygon(Ahya_dencpg_diff,col="#C11B1760")
legend(x=0.1, y = 2.1, c("whole transcriptome", "env response genes"), xpd = TRUE, col = c("#6C2DC760","#C11B1760"), lwd=2, bty="n", cex = 1, x.intersp=0.5)

plot(Amil_dencpg, xlim=c(0,1.6), ylim=c(0,2), main= "Acropora millepora", font.main = 3, xlab="CpG O/E", ylab=" ", bty = "l", cex=1, lwd=2, col="#6C2DC760")
lines(Amil_dencpg_diff, col="#C11B1760", cex=1, lwd=2)
polygon(Amil_dencpg, col="#6C2DC760")
polygon(Amil_dencpg_diff,col="#C11B1760")

plot(Apalm_dencpg, xlim=c(0,1.6), ylim=c(0,2), main= "Acropora palmata", font.main = 3, xlab=" ", ylab=" ", bty = "l", cex=1, lwd=2, col="#6C2DC760")
lines(Apalm_dencpg_diff, col="#C11B1760", cex=1, lwd=2)
polygon(Apalm_dencpg, col="#6C2DC760")
polygon(Apalm_dencpg_diff,col="#C11B1760")


##Stats


ks.test(Ahya_cpg$V2,Ahya_diff$V2) #p-value < 2.2e-16
ks.test(Amil_cpg$V2,Amil_diff$V2) #p-value = 0.03135
ks.test(Apalm_cpg$V2,Apalm_diff$V2) #p-value = 1.118e-07

