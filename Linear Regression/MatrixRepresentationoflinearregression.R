library(tidyverse)
library(rgl)
#Matrix Representation of Linear Regression. 

            #Deterministic example: 

#the y matrix: 
y.1<- matrix(c(24, 30, 41))

#the x matrix: 
x.1<- matrix(c(1,1,1,0,2,5,2,2,3), nrow = 3)

#calculate the regression coefficients using the formula (written in sheet)
a.1 <- solve(t(x.1)%*%(x.1))%*%t(x.1)%*%y.1

#Stochastic Example: 

y <- as.matrix(mtcars$mpg) #response (dependent variable)

#the independent variables.xm
x <- as.matrix(cbind(rep(1, length(mtcars$mpg)), mtcars$wt, mtcars$qsec))

#then use the equation to solve for the coefficients of the variables. 
a.coefficient <- solve(t(x)%*%x)%*%t(x)%*%y
#as we can see, the coefficients given are the same as those calculated before.
#also, the values are given in the order in which you input them so make sure everything makes sense before going on to doing the linear regression.


#how to make predictions using this? 

inputs <- mtcars[,c('mpg', 'wt', 'qsec')]

lm <- inputs %>% 
  mutate(prediction = a.coefficient[1] + a.coefficient[2]*wt + a.coefficient[3]*qsec)

