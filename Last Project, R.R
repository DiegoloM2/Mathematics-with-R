#This is the project for the course: Mathematics for Data Science and AI using R. 

library(datasets)
library(tidyverse) 

data <- as.data.frame(longley)

plot(x = data$GNP.deflator, y = data$Employed)
plot(x = data$GNP, y = data$Employed)
plot(x = data$Unemployed, y = data$Employed)
plot(x = data$Armed.Forces, y = data$Employed)
plot(x = data$Population, y = data$Employed)
plot(x = data$Year, y = data$Employed)



#hence, the 3 variables which are more correlated
#with the number of employed people are: 
    #GNP.deflator, GNP and Year. 

data <- data %>% select(GNP, GNP.deflator, Year, Employed)

#Now, I am going to create the three linear regression models: 

lm1 <- lm(Employed ~ GNP.deflator, data = data)
lm2 <- lm(Employed ~ GNP, data = data)
lm3 <- lm(Employed ~ Year, data = data)

#Now I am going to check the mean squared error to see which model is best: 
error1 <- data.frame(data$Employed, lm1$fitted.values, 
                error = (data$Employed-lm1$fitted.values)^2)
rmse1 <- sum(error1$error/(length(error1$error)))^(1/2)
#rmse = 0.814

error2 <- data.frame(data$Employed, lm2$fitted.values, 
                     error = (data$Employed-lm2$fitted.values)^2)
rmse2 <- sum(error2$error/(length(error2$error)))^(1/2)
#rmse2 = 0.614 i.e: GNP model is better than GNP deflator model. 

error3 <- data.frame(data$Employed, lm3$fitted.values, 
                     error = (data$Employed-lm3$fitted.values)^2)
rmse3 <- sum(error3$error/(length(error3$error)))^(1/2)
#rmse3 = 0.81


#Hence, a linear regression of the number of Employed predicted by the GNP is the 
#most accurrate since the linear regression model with the least rmse is the model 
#of GNP.  


#Calculating the linear regression using the model matrices: 

#Firstly, the expected linear model is: y = 51.844+0.03475GNP

#The Y matrix is: 
ymat <- matrix(data$Employed)


#Now, the x-matrix is: 
xmat <- as.matrix(cbind(rep(1, length(data$Employed)), data$GNP), ncol = 2) 


#Now, I am going to calculate the coefficients and compare them with the other linear model: 

matrix.lm <- solve(t(xmat)%*%xmat) %*% t(xmat) %*% ymat

##As we can see, the coefficients in the matrix are approximately:  
    ##51.84 and 0.03475
#Hence, the model is the same as that done by the lm function in r. 



#Now, I am going to predict the values of employed using matrix.lm

ypredict <- function(x) 51.84 + 0.03475*x


#And now, we can predicted the values of 'employed' from the model created by the matrices: 
vals <- cbind(data$Employed, ypredict(data$GNP), se = (data$Employed-ypredict(data$GNP))^2, rse = se^(1/2))






