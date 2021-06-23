# ---------------------------------------------------------
# TOC:
#  1. Testing for orthogonality
#  2. Example w/ linear regression
# ---------------------------------------------------------



# ---------------------------------------------------------
#  1. Testing for orthogonality
# ---------------------------------------------------------
v1 <- c(0,1)
v2 <- c(-2,5)
v3 <- c(-1,2)

v1 %*% v2 ## 5
v1 %*% v3 ## 2
v2 %*% v3 ## 12
# None are zero, so this set is not orthogonal
# v2 = v1 + 2*v3

w1 <- c(1,3,2)
w2 <- c(3,-1,0)
w3 <- c(1,3,-5)

w1 %*% w2 ## 0
w1 %*% w3 ## 0
w2 %*% w3 ## 0
# All pairs are orthogonal


# ---------------------------------------------------------
#  2. Example w/ linear regression
# ---------------------------------------------------------

### Create sample data
set.seed(123)
x1 <- rnorm(n = 100) #use data from the standard normal distribution dataset. 
x2 <- rnorm(n = 100)
x3 <- 2*x1 + 3*x2   ## x3 is a linear combination of x1 and x2
y <- 4*x3  ## 4*x3 = 4(2*x1 + 3*x2) = 8*x1 + 12*x2
model.data <- as.data.frame(cbind(y,x1,x2,x3))

mod1 <- lm(y ~ ., data = model.data) #create a model using all the data. 
summary(mod1) #notice that x3 is not needed in the model since it is a linear combination of x2 and x1. 


mod2 <- lm(y ~ x3, data = model.data)#this model is as precise as the one before but it uses less components therefore it is a better model. 
summary(mod2)

x1 %*% x2 #-5.3
x1 %*% x3 #150.7
x2 %*% x3 #270.6
# None are zero, so the data are linearly dependent

