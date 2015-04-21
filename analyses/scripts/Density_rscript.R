#This script plots and compares mixture models for CpG ratio data

setwd("~/Documents/Projects/Coral-CpG-ratio-MS/analyses/Ahya")

#Read in CpG data and remove NA values

Ahya_cpg<-read.delim("ID_CpG", header=F)
Ahya_cpg2<-na.omit(Ahya_cpg)

setwd("~/Documents/Projects/Coral-CpG-ratio-MS/analyses/Amil")

Amil_cpg<-read.delim("ID_CpG", header=F)
Amil_cpg2<-na.omit(Amil_cpg)

setwd("~/Documents/Projects/Coral-CpG-ratio-MS/analyses/Apalm")

Apalm_cpg<-read.delim("ID_CpG", header=F)
Apalm_cpg2<-na.omit(Apalm_cpg)

setwd("~/Documents/Projects/Coral-CpG-ratio-MS/analyses/Pdam")

Pdam_cpg<-read.delim("ID_CpG", header=F)
Pdam_cpg2<-na.omit(Pdam_cpg)

setwd("~/Documents/Projects/Coral-CpG-ratio-MS/analyses/Spist")

Spist_cpg<-read.delim("ID_CpG", header=F)
Spist_cpg2<-na.omit(Spist_cpg)

setwd("~/Documents/Projects/Coral-CpG-ratio-MS/analyses/Past")

Past_cpg<-read.delim("ID_CpG", header=F)
Past_cpg2<-as.numeric(as.character(Past_cpg$V2))
Past_cpg3<-na.omit(Past_cpg2)

#Fitting mixture model with mixtools normalmixEM

library(mixtools)

par(mfrow = c(2, 3)) # 2 x 3 plots
    
data <- Ahya_cpg2$V2
Ahya_data <- data[data <= 1.5] #Cutting off high values
set.seed(101)
Ahya_mixmdl <- normalmixEM(Ahya_data)
plot(Ahya_mixmdl, which = 2, col2 = c("red", "blue"), xlab2 = "CpG O/E", main2 = " ")
lines(density(Ahya_data), lty=2, lwd=2)

data <- Amil_cpg2$V2
Amil_data <- data[data <= 1.5] #Cutting off high values
set.seed(101)
Amil_mixmdl <- normalmixEM(Amil_data)
plot(Amil_mixmdl, which = 2, col2 = c("red", "blue"), main2 = " ", ylab2 = " ", xlab2 = "CpG O/E")
lines(density(Amil_data), lty=2, lwd=2)

data <- Apalm_cpg2$V2
Apalm_data <- data[data <= 1.5] #Cutting off high values
set.seed(101)
Apalm_mixmdl <- normalmixEM(Apalm_data)
plot(Apalm_mixmdl, which = 2, col2 = c("red", "blue"), main2 = " ", ylab2 = " ", xlab2 = "CpG O/E")
lines(density(Apalm_data), lty=2, lwd=2)

data <- Pdam_cpg2$V2
Pdam_data <- data[data <= 1.5] #Cutting off high values
set.seed(101)
Pdam_mixmdl <- normalmixEM(Pdam_data, mu = c(0.2, 0.7), lambda = c(0.25, 0.75))
plot(Pdam_mixmdl, which = 2, col2 = c("red", "blue"), xlab2 = "CpG O/E", main2 = " ")
lines(density(Pdam_data), lty=2, lwd=2)

data <- Spist_cpg2$V2
Spist_data <- data[data <= 1.5] #Cutting off high values
set.seed(101)
Spist_mixmdl <- normalmixEM(Spist_data)
plot(Spist_mixmdl, which = 2, col2 = c("red", "blue"), ylab2 = " ", xlab2 = "CpG O/E", main2 = " ")
lines(density(Spist_data), lty=2, lwd=2)

data <- Past_cpg3
Past_data <- data[data <= 1.5] #Cutting off high values
Past_data2 <- as.numeric(Past_data)
set.seed(101)
Past_mixmdl <- normalmixEM(Past_data)
plot(Past_mixmdl, which = 2, col2 = c("red", "blue"), xlab2 = "CpG O/E", main2 = " ")
lines(density(Past_data), lty=2, lwd=2)


##Plot density lines manually (this needs work!)

par(mfrow = c(2, 3)) # 2 x 3 plots

data <- Ahya_cpg2$V2
Ahya_data <- data[data <= 1.5] #Cutting off high values
set.seed(101)
Ahya.k2 <- normalmixEM(Ahya_data)
plot(hist(Ahya_data,breaks=20),freq=FALSE, xlab=" ", ylab="Density", ylim = c(0,1.4), main = " ")
lines(density(Ahya_data),lty=2)
sapply(1:2,plot.normal.components,mixture=Ahya.k2)


# Two-component Gaussian mixture

library(mixtools)

spist.k2 <- normalmixEM(Spist_data,k=1,maxit=100,epsilon=0.01)

# Function to add Gaussian mixture components, vertically scaled, to the
# current plot
# Presumes the mixture object has the structure used by mixtools
plot.normal.components <- function(mixture,component.number,...) {
  curve(mixture$lambda[component.number] *
          dnorm(x,mean=mixture$mu[component.number],
                sd=mixture$sigma[component.number]), add=TRUE, col = "blue"(component.number[1]), "red"(component.number[2])...)
}

### Figure 2
plot(hist(Spist_data,breaks=50),freq=FALSE, xlab="Precipitation (1/100 inch)",main="Precipitation in Snoqualmie Falls")
lines(density(Spist_data),lty=2)
sapply(1:2,plot.normal.components,mixture=spist.k2)

    
# Use mclust to compare models

library(mclust)
data2Mclust <- Mclust(Ahya_data, G = 1) 
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

