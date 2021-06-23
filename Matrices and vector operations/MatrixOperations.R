#Matrix operations and vector multiplication
M1 <- matrix(c(3,4,8,9), ncol = 2, nrow = 2, byrow = TRUE)
M2 <- matrix(c(5,7,2,3), ncol = 2, nrow = 2, byrow = TRUE)

#matrix scalar multiplication
5*M1

#matrix addition and substraction
#remember that the dimensions need to be the same for this to work
M2 - M1
M2 + M1

#matrix multiplication 
#remember that the inner dimensions must be the same
#that is, the number of columns in the first matrix must equal the number of rows in the second one.

M1 * M2 #this command is for element-wise multiplication which is not normally what you want
M1 %*% M2 #this is the proper command for matrix multiplication
#also, order does matter in matrix multiplication
M2 %*% M1

M4 <- matrix(1:12, nrow = 3, ncol = 4, byrow = TRUE)
M5 <- matrix(1:8, nrow = 4, byrow = TRUE)
M4 %*% M5

