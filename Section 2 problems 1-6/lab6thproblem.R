#lab 5 problem: 
library(tidyverse)
library(rgl)
library(Deriv)

y.mat <- as.matrix(mtcars$mpg)
x.mat <- as.matrix(cbind(rep(1, length(mtcars$mpg)),
                         mtcars[,c('wt', 'hp')]))

a <- solve(t(x.mat)%*%x.mat)%*%t(x.mat)%*%(y.mat)


data.1 <- mtcars[,c('mpg', 'wt', 'hp')]
data.1 <- data.1 %>% 
  mutate(predicted.vals = a[1] + a[2]*wt + a[3]*hp)

z <- t(a)%*%t(x.mat)%*%y.mat

k <- t(y.mat)%*%x.mat%*%a

#z = k therefore the linear model is well done. 

#now let's use the partial derivative we derived before to verify this value. 
L <- -2*t(x.mat)%*%y.mat + 2*t(x.mat)%*%x.mat%*%a
round(L)

#we can see that the resulting vector is a 3 by 1 vector with all the values equal to 0. 

#now let's create a linear model using R's function 

linearmodel.hp.wt <- lm(mpg ~ wt + hp, data = mtcars)

plot(x = mtcars$mpg, y = linearmodel.hp.wt$fitted.values)
plot(linearmodel.hp.wt$residuals)
summary(linearmodel.hp.wt$residuals)

SSE <- sum((data.1$mpg - linearmodel.hp.wt$fitted.values)^2)

#find the root mean squared error: 
RMSE <- (SSE/length(mtcars$mpg))^(1/2)

#this root mean squared error is smaller than if used with a model of only weight therefore this model is overall better since the mean squared error is smaller and therefore it is more precise. 
