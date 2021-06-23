library(tidyverse)

b.data <- read.csv(file = 'C:\\Users\\diego\\OneDrive\\Documentos\\Baseball2018.csv')

b.data <-b.data %>% select(Runs, RunsAgainst, Rdiff)
cov.data <- round(cov(b.data), 2)


eigen.decomp <- eigen(cov.data)


#from the data given by the eigen decomposition, we notice that only two eigenvectors are needed to describe the variation in
#the data. 

