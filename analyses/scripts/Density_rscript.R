#This script plots and compares mixture models for CpG ratio data

setwd("~/Documents/Projects/Coral-CpG-ratio-MS/analyses/Ahya")

#Read in CpG data and remove NA values

Ahya<-read.delim("Ahya_cpg_anno", header=F)

setwd("~/Documents/Projects/Coral-CpG-ratio-MS/analyses/Amil")

Amil<-read.delim("Amil_cpg_anno", header=F)

setwd("~/Documents/Projects/Coral-CpG-ratio-MS/analyses/Apalm")

Apalm<-read.delim("Apalm_cpg_anno", header=F)

setwd("~/Documents/Projects/Coral-CpG-ratio-MS/analyses/Pdam")

Pdam<-read.delim("Pdam_cpg_anno", header=F)

setwd("~/Documents/Projects/Coral-CpG-ratio-MS/analyses/Spist")

Spist<-read.delim("Spist_cpg_anno", header=F)

setwd("~/Documents/Projects/Coral-CpG-ratio-MS/analyses/Past")

Past<-read.delim("Past_cpg_anno", header=F)

#Fitting mixture model with mixtools normalmixEM

library(mixtools)

par(mfrow = c(2, 3)) # 2 x 3 plots

data <- Ahya2$V2
Ahya_data <- data[data >= 0.001 & data <= 1.5] #Cutting off high and low values
set.seed(1)
Ahya_mixmdl <- normalmixEM(Ahya_data)
plot(Ahya_mixmdl, which = 2, col2 = c("red", "blue"), xlab2 = " ", main2 = "Acropora hyacinthus", font.main = 3)
lines(density(Ahya_data), lty=2, lwd=2)

data <- Amil$V2
Amil_data <- data[data >= 0.001 & data <= 1.5] #Cutting off high and low values
set.seed(1)
Amil_mixmdl <- normalmixEM(Amil_data)
plot(Amil_mixmdl, which = 2, col2 = c("red", "blue"), xlab2 = " ", main2 = "Acropora millepora", font.main = 3)
lines(density(Amil_data), lty=2, lwd=2)

data <- Apalm$V2
Apalm_data <- data[data >= 0.001 & data <= 1.5] #Cutting off high and low values
set.seed(101)
Apalm_mixmdl <- normalmixEM(Apalm_data)
plot(Apalm_mixmdl, which = 2, col2 = c("red", "blue"), xlab2 = " ", main2 = "Acropora palmata", font.main = 3)
lines(density(Apalm_data), lty=2, lwd=2)

data <- Pdam$V2
Pdam_data <- data[data >= 0.001 & data <= 1.5] #Cutting off high and low values
set.seed(100)
Pdam_mixmdl <- normalmixEM(Pdam_data)
plot(Pdam_mixmdl, which = 2, col2 = c("red", "blue"), xlab2 = " ", main2 = "Pocillopora damicornis", font.main = 3)
lines(density(Pdam_data), lty=2, lwd=2)

data <- Past$V2
Past_data <- data[data >= 0.001 & data <= 1.5] #Cutting off high and low values
set.seed(101)
Past_mixmdl <- normalmixEM(Past_data)
plot(Past_mixmdl, which = 2, col2 = c("red", "blue"), xlab2 = "CpG O/E", main2 = "Porites astreoides", font.main = 3)
lines(density(Past_data), lty=2, lwd=2)

data <- Spist$V2
Spist_data <- data[data >= 0.001 & data <= 1.5] #Cutting off high and low values
set.seed(101)
Spist_mixmdl <- normalmixEM(Spist_data)
plot(Spist_mixmdl, which = 2, col2 = c("red", "blue"), xlab2 = " ", main2 = "Stylophora pistillata", font.main = 3)
lines(density(Spist_data), lty=2, lwd=2)

#####

Ahya_1comp <- fitdistr(Ahya_data, "normal")
Amil_1comp <- fitdistr(Amil_data, "normal")
Apalm_1comp <- fitdistr(Apalm_data, "normal")
Pdam_1comp <- fitdistr(Pdam_data, "normal")
Past_1comp <- fitdistr(Past_data, "normal")
Spist_1comp <- fitdistr(Spist_data, "normal")

######

##Plot density lines manually (this needs work!)

par(mfrow = c(2, 3)) # 2 x 3 plots

data <- Ahya$V2
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

#######
    
# Use mclust to compare models

library(mclust)

#Ahya
#One component Gaussian micture model
Ahya_Mclust1 <- Mclust(Ahya_data, G = 1) 
summary(Ahya_Mclust1)
#log likelihood = -9246.993

#Two component Gaussian micture model
Ahya_Mclust2 <- Mclust(Ahya_data, G = 1:2) 
summary(Ahya_Mclust2)
#log likelihood = -8819.696

#Amil
#One component Gaussian micture model
Amil_Mclust1 <- Mclust(Amil_data, G = 1) 
summary(Amil_Mclust1)
#log likelihood = -9002.966

#Two component Gaussian micture model
Amil_Mclust2 <- Mclust(Amil_data, G = 1:2) 
summary(Amil_Mclust2)
#log likelihood = -8030.064

#Apalm
#One component Gaussian micture model
Apalm_Mclust1 <- Mclust(Apalm_data, G = 1) 
summary(Apalm_Mclust1)
#log likelihood = -18831.66

#Two component Gaussian micture model
Apalm_Mclust2 <- Mclust(Apalm_data, G = 1:2) 
summary(Apalm_Mclust2)
#log likelihood = -16805.99

#Pdam
#One component Gaussian micture model
Pdam_Mclust1 <- Mclust(Pdam_data, G = 1) 
summary(Pdam_Mclust1)
#log likelihood = -16513

#Two component Gaussian micture model
Pdam_Mclust2 <- Mclust(Pdam_data, G = 1:2) 
summary(Pdam_Mclust2)
#log likelihood = -14248

#Spist
#One component Gaussian micture model
Spist_Mclust1 <- Mclust(Spist_data, G = 1) 
summary(Spist_Mclust1)
#log likelihood = -2981.8

#Two component Gaussian micture model
Spist_Mclust2 <- Mclust(Spist_data, G = 1:2) 
summary(Spist_Mclust2)
#log likelihood = -2394.4

#Past
#One component Gaussian micture model
Past_Mclust1 <- Mclust(Past_data, G = 1) 
summary(Past_Mclust1)
#log likelihood = -8397.715

#Two component Gaussian micture model
Past_Mclust2 <- Mclust(Past_data, G = 1:2) 
summary(Past_Mclust2)
#log likelihood = -7883.481