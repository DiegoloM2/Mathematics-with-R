#Linear regression from the calculus optimization perspective: 

library(tidyverse)

#start by making a linear regression: 

mod1 <- lm(mpg ~ wt, data = mtcars)

#let's take that to see the range in which mod1 works
summary(mod1$fitted.values)

#viewing residuals: 
plot(x = mtcars$mpg, y = mod1$fitted.values, 
     type = 'p', col = 'blue', 
     pch = c(16))
plot(x = mtcars$wt, y = mod1$fitted.values, 
     ylim = c(8, 30), ylab = 'Predicted MPG Values.',
     pch = c(16), col = 'green')

points(x = mtcars$wt, y = mtcars$mpg,
       col = 'red', 
     pch = c(16))

#one may see that the linear regressino model directly relates the weight with the mpg linearly whereas the real observation show more variation
#also, there is a kind of empty space between 4 and 5 which implies that maybe cars with a weight of more than 4 may be outliers and therefore should be eliminated to make the model. 
#also, we can see that the over estimations and underestimations are more or less equal which explains why the mean error is equal to error. 


#now, we will eplot the residuals(errors) directly: 
summary(mod1$residuals)
plot(mod1$residuals, col = 'blue', pch = c(16))
#also, plot the line of 0 to see where the resiudals are centered around. 
abline(h= 0)

#you can see that the residuals are not clustered, rather they are all around the place. 
#this implies that it is difficult to improve the model with the variables given

#you understand error very well so there is no need to go over that. 
