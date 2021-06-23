#---- Finding the covariance Matrix; 
#This is how you find a covariance matrix in R; 

A <- matrix(c(1,-1, 5, 3, 8, -2, 4, 5, 7),
            byrow = TRUE, ncol = 3)
colnames(A) <- c('A', 'B', 'C')
rownames(A) <- c('A', 'B', 'C')

#to find the covariance function, we simply use the function 'cov()'
covariance.matrix.A <- round(cov(A), 2) #we round to 2dp (not necessary)

#print(covariance.matrix.A)


#-----Finding the eigen values and vectors of matrices----

#finding the eigen vector and value of a matrix is simple, 
#the only function needed is 'eigen()'
print( eigen(A) ) 


#----Finding the eigen decomposition of a covariance matrix. 
#this also, is very simple and follows from the lines before by logic. 
#namely;
#print(eigen(covariance.matrix.A)) #is the eigen decomposition of the covariance
                          #matrix of A. 


#-----Understanding an eigenvalue of 0----

set.seed(1000)
x1 <- rnorm(n = 50) 
x2 <- rnorm(n = 50)
x3 <- 2*x1

B <- cbind(x1, x2, x3)

eigen.cov.B <- round(cov(B), 2) 
eigen.cov.B <- eigen(eigen.cov.B)
-
print(eigen.cov.B)

