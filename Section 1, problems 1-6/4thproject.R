#Project 4: 

#define matrix A 
A <- matrix(c(12, 3, 5, 6,7,8,11,9,10), ncol = 3, byrow = TRUE)

#find the transpose of A
transpose.A <- t(A)

#find the inverse of A
inverse.A <- solve(A)

#multiply A by its inverse
I <- round(A %*% inverse.A)
#the rounding up is done to avoid confusion. 
#we can see that the result is the Identity matrix of 3*3 matrices. 
