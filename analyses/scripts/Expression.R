#This script analyzes gene expression vs. CpG O/E

setwd("~/Documents/Projects/Coral-CpG-ratio-MS/analyses/Apalm")

Apalm_exp_CpG <- read.delim("Apalm_exp_cpg2", header = F)

Apalm_mean_exp <- rowMeans(Apalm_exp_CpG[,2:37])

Apalm_exp_CpG2 <- cbind(Apalm_exp_CpG, Apalm_mean_exp)

Apalm_exp_CpG2_sub <- subset(Apalm_exp_CpG2, V38 >= 0.001 & V38 <= 1.5)

x <- Apalm_exp_CpG2_sub$V38

y <- Apalm_exp_CpG2_sub$Apalm_mean_exp

log_y <- log(y)

plot(x, y)

smoothScatter(x, y, nrpoints = 0, ylim = c(9, 9.5))

lm.1 <- lm(y ~ x + I(x^2) + I(x^3) + I(x^4) + I(x^5) + I(x^6) + I(x^7))

lm.s <- step(lm.1)

lm1 <- lm(y ~x)
abline(lm1)
lm2 <- lm(y ~ x + I(x^2))
lines(sort(x), fitted(lm2)[order(x)], col='red', type='l') 
lm3 <- lm(y ~ x + I(x^2) + I(x^3))
lines(sort(x), fitted(lm3)[order(x)], col='orange', type='l') 
lm4 <- lm(y ~ x + I(x^2) + I(x^3) + I(x^4))
lines(sort(x), fitted(lm3)[order(x)], col='purple', type='l') 

x_cut <- cut_number(x, n = 30)

z <- cbind(x_cut, x)

cuts <- z[,1]

y_means <- tapply(y, INDEX = cuts, FUN = mean)

y_stdev <- tapply(y, INDEX = cuts, FUN = sd)

y_stderr <- y_stdev/sqrt(4331)

x_means <- tapply(x, INDEX = cuts, FUN = mean)

plot(x_means, y_means)
segments(x_means, y_means-y_stderr, x_means, y_means+y_stderr)

lm.1 <- lm(y_means ~ x_means + I(x_means^2) + I(x_means^3) + I(x_means^4) + I(x_means^5) + I(x_means^6))

lm.s <- step(lm.1)

lm1 <- lm(y_means ~ x_means)
abline(lm1)
lm2 <- lm(y_means ~ x_means + I(x_means^2))
lines(sort(x_means), fitted(lm2)[order(x_means)], col='red', type='l') 
lm3 <- lm(y_means ~ x_means + I(x_means^2) + I(x_means^3))
lines(sort(x_means), fitted(lm3)[order(x_means)], col='orange', type='l') 
lm4 <- lm(y_means ~ x_means + I(x_means^2) + I(x_means^3) + I(x_means^4))
lines(sort(x_means), fitted(lm4)[order(x_means)], col='purple', type='l') 

#Best fit model according to AIC is 3rd order polynomial

#Now onto Acropora millepora data

setwd("~/Documents/Projects/Coral-CpG-ratio-MS/analyses/Amil")

Amil_exp_CpG <- read.delim("Amil_exp_CpG2", header = F)

cols <- c(3, 5, 7, 9, 11, 13, 15, 17, 19)

Amil_mean_exp <- rowMeans(Amil_exp_CpG[,cols])

Amil_exp_CpG2 <- cbind(Amil_exp_CpG, Amil_mean_exp)

Amil_exp_CpG2_sub <- subset(Amil_exp_CpG2, V20 >= 0.001 & V20 <= 1.5)

x <- Amil_exp_CpG2_sub$V20

y <- Amil_exp_CpG2_sub$Amil_mean_exp

log_y <- log(y)

plot(x, log_y)

smoothScatter(x, log_y, nrpoints = 0)

lm.1 <- lm(log_y ~ x + I(x^2) + I(x^3) + I(x^4) + I(x^5) + I(x^6) + I(x^7))

lm.s <- step(lm.1)

lm1 <- lm(y ~x)
abline(lm1)
lm2 <- lm(y ~ x + I(x^2))
lines(sort(x), fitted(lm2)[order(x)], col='red', type='l') 
lm3 <- lm(y ~ x + I(x^2) + I(x^3))
lines(sort(x), fitted(lm3)[order(x)], col='orange', type='l') 
lm4 <- lm(y ~ x + I(x^2) + I(x^3) + I(x^4))
lines(sort(x), fitted(lm3)[order(x)], col='purple', type='l') 

x_cut <- cut_number(x, n = 30)

z <- cbind(x_cut, x)

cuts <- z[,1]

Amil_y_means <- tapply(log_y, INDEX = cuts, FUN = mean)

Amil_y_stdev <- tapply(log_y, INDEX = cuts, FUN = sd)

Amil_y_stderr <- y_stdev/sqrt(1638)

Amil_x_means <- tapply(x, INDEX = cuts, FUN = mean)

plot(Amil_x_means, Amil_y_means)
segments(Amil_x_means, Amil_y_means-Amil_y_stderr, Amil_x_means, Amil_y_means+Amil_y_stderr)

Amil_lm.1 <- lm(Amil_y_means ~ Amil_x_means + I(Amil_x_means^2) + I(Amil_x_means^3) + I(Amil_x_means^4) + I(Amil_x_means^5) + I(Amil_x_means^6))

Amil_lm.s <- step(Amil_lm.1)

Amil_lm1 <- lm(Amil_y_means ~ Amil_x_means)
abline(lm1)
Amil_lm2 <- lm(Amil_y_means ~ Amil_x_means + I(Amil_x_means^2))
lines(sort(Amil_x_means), fitted(Amil_lm2)[order(Amil_x_means)], col='red', type='l') 
Amil_lm3 <- lm(Amil_y_means ~ Amil_x_means + I(Amil_x_means^2) + I(Amil_x_means^3))
lines(sort(Amil_x_means), fitted(Amil_lm3)[order(Amil_x_means)], col='orange', type='l') 
Amil_lm4 <- lm(Amil_y_means ~ Amil_x_means + I(Amil_x_means^2) + I(Amil_x_means^3) + I(Amil_x_means^4))
lines(sort(Amil_x_means), fitted(Amil_lm4)[order(Amil_x_means)], col='purple', type='l') 

