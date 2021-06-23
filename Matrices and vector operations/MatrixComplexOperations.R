#Matrix transposes, inverses and the identity matrix

#Matrix Transpose 
M <- matrix(1:12, nrow = 3, byrow = TRUE)

#the function for the transpose is simply a t()
trans.M <- t(M)
#now do it with a vector 
V <- seq(from = 1, to = 4, by = 1)
t(V)
#from this we see that the t function only works appropriately with matrix type objects

V1 <- matrix(1:4, byrow = TRUE)
t(V1)
#this is the way you do a vector transpose

#Matrix Inverses
M^-1 #this does not return an inverse, rather it returns element wise reciprocation
A <- matrix(1:4,nrow = 2, byrow = TRUE)
#if we want the inverse of a function, we need to call for the function 'solve()'
solve(A)
#we can test if this matrix is the inverse by multiplying it by the original matrix
#if this multiplication yields the identity matrix, the matrix is an inverse
A %*% solve(A)
#and remember, ONLY SQUARE MATRIXES ARE INVERSIBLE 
#also, a row or column cannot be full of zeroes because if not a division by zero will be tried


#Matrix identities:
#a matrix times its inverse gives it inverse
#(it is better to round it to avoid infinetsimal values)
round(A %*% solve(A))

#to get the identity directly, use the function 'diag()'
#the parameter of diags is in dimensions therefore put the dimensions of the matrix in the diag function
diag(3)
#you can test the matrix dimension by multiplying it by it's identity which should yield the matrix
A %*% diag(2)
