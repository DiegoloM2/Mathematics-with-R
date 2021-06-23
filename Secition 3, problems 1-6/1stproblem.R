#Lab 1 problem, vector calculus: 
#Orthogonal 3d vectors: 
v1 <- c(1,2,3)
v2 <- c(1,1,-1)
v2 %*% v1 == 0 #TRUE therefore v1 and v2 are orthogonal 

#A pair of orthogonal 2D vectors: 
w1 <- c(8, 11)
w2 <- c(3, (-24/11))
w1 %*% w2 #0 therefore w1 and w2 are orthogonal.

#Now let's do the problem: 
data <- read.csv(file = 'C:\\Users\\diego\\OneDrive\\Documentos\\RProjects\\baseball_2018.csv',
                 header = TRUE)
#from the seeing the dataframe, we can conclude: 
  #winpct is a linear combination of wins and losses. 

