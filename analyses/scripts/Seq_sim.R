setwd("~/Documents/Projects/Coral-CpG-ratio-MS/analyses/sequence_similarity")

data <- read.delim("Apalm_Amil_CpG2", sep = " ", header = F)
meanCpG <- rowMeans(cbind(data$V3, data$V17))
plot(data$V3, data$V17)
cor(meanCpG, data$V16)
cor.test(meanCpG, data$V16)
lm.out <- lm(data$V3 ~ data$V17)               
lm.out
abline(lm.out, col = "red")
summary(lm.out)
