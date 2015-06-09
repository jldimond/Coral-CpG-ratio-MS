setwd("~/Documents/Grad school/UW courses/BIO 519/sequence_similarity_project")

Apalm_Amil <- read.delim("Apalm_Amil_CpG2", sep = " ", header = F)
Apalm_AmilMeanCpG <- rowMeans(cbind(Apalm_Amil$V3, Apalm_Amil$V17))

Ahya_Amil <- read.delim("Ahya_Amil_CpG2", sep = " ", header = F)
Ahya_AmilMeanCpG <- rowMeans(cbind(Ahya_Amil$V3, Ahya_Amil$V17))

Pdam_Amil <- read.delim("Pdam_Amil_CpG2", sep = " ", header = F)
Pdam_AmilMeanCpG <- rowMeans(cbind(Pdam_Amil$V3, Pdam_Amil$V17))

Past_Amil <- read.delim("Past_Amil_CpG2", sep = " ", header = F)
Past_AmilMeanCpG <- rowMeans(cbind(Past_Amil$V3, Past_Amil$V17))

Spist_Amil <- read.delim("Spist_Amil_CpG2", sep = " ", header = F)
Spist_AmilMeanCpG <- rowMeans(cbind(Spist_Amil$V3, Spist_Amil$V17))

par(mfrow = c(2, 3)) # 2 x 3 plots

plot(Apalm_AmilMeanCpG, Apalm_Amil$V16)
plot(Ahya_AmilMeanCpG, Ahya_Amil$V16)
plot(Pdam_AmilMeanCpG, Pdam_Amil$V16)
plot(Past_AmilMeanCpG, Past_Amil$V16)
plot(Spist_AmilMeanCpG, Spist_Amil$V16)