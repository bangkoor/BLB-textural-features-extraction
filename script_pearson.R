# Load the required libraries
library(corrplot)

# Load the data
data <- read.csv("all_block_texture_3.csv", header=TRUE, sep=",")

# Calculate the correlation matrix
M <- cor(data)

# Perform the correlation significance test
testRes <- cor.mtest(data, conf.level = 0.98)

# Identify the highest and lowest correlations for each pair
max_corr <- apply(M, 1, function(x) x == max(x[x != 1]))
min_corr <- apply(M, 1, function(x) x == min(x[x != -1]))

# Mark these correlations
mark_matrix <- matrix(0, ncol=ncol(M), nrow=nrow(M))
mark_matrix[max_corr] <- 1
mark_matrix[min_corr] <- -1

# Insignificant correlations marked with crosses
corrplot(M, p.mat = testRes$p, sig.level = 0.10, addrect = 2, type = 'lower', clab = 'Correlation Index')

