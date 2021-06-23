#Linear regression
library(tidyverse)
library(rgl)
library(plot3D)
#import rgl to plot 3d graphs which are more easy to see and more manipulable. 

#deterministic example 
hot.dogs <- 0:20 #number of possible hot dogs and fries bought
fries <- 0:20 

#use the function expand grid to create a cross product of hot dogs and fries
game.cost <- expand.grid(hot.dogs, fries)
#this creates a table of 441 elements due to the number of elements of each data (21*21)

#name the columns of the dataframe. 
colnames(game.cost) <- c('hot.dogs', 'fries')

#create an equation that gives the total price i.e. a very simple linear regression
game.cost <- game.cost %>%
  mutate(total.cost = 20 + (3*hot.dogs) + 2*fries)
#introduce the price variable by using the function 'mutate'. 


#do a plot to visualize
plot3d(x = game.cost$hot.dogs,
       y = game.cost$fries,
       z = game.cost$total.cost,
       col = 'green',
       xlim = c(0,21),
       ylim = c(0, 21),
       zlim = c(0,120), 
       xlab = 'num of hot dogs bought',
       ylab = 'num of fry buckets bought',
       zlab = 'total cost', 
       type = 'p' )

#use lm() function to create a linear regression model (estimate the regression coefficients)
hot.dog.model <- lm(total.cost ~ hot.dogs + fries, data = game.cost)
hot.dog.model

summary(hot.dog.model)
#this is testing the model which returns a warning since the data returns a perfect estimate
#since this is a deterministic example, we already know the answer, this can be useful when testing programs.

  
#Stochastic Example
#we will use the mtcars dataset to estimate how the weight(wt) and qsec affects the mpg

#first, let's do a plot to visualize the data
mtcars <- mtcars
plot3D(
        x = mtcars$wt, 
       y = mtcars$qsec,
       z = mtcars$mpg, 
       type = 's',
       size = c(3),
       col = 'green',
       xlim = c(min(mtcars$wt) - 0.5, max(mtcars$wt) +0.5),
       ylim = c(min(mtcars$qsec) -0.5, 0.5 + max(mtcars$qsec)), 
       zlim = c(min(mtcars$mpg) - 1, max(mtcars$mpg) +1),
       zlab = 'MPG', lwd = 0, 
       xlab = 'Weight', 
       ylab = 'Q seconds'
       )
#from the graph, we can see that as the weight increases, the mpg decreases
#we can also see that there is a weak relationship between qsec and mpg but as qsec increases, so does mpg. 


#use lm() fnuction to fit a model
mpg.model <- lm(mpg ~ wt + qsec, data = mtcars)
#this code is asking for a model of mpg onto data of weight and qsec and it tells that the data is coming from the dataset mtcars
#the first parameter gives the dependent variable.
#the notation ~ is to mention the independent variables of the coefficient.
#weight + qsec are the independent variables used to do the regression. 
#the linear regression is done by using the data coming from the mtcars dataset. 
#basically, the lm() function asks for the formula of the linear regression. 


#look at a summary to see how the model worked
mpg.model #model = 19.81 -5.04802wt - 0,9292qsec

#take out the fitted values from the model 
fitted_values <- mpg.model$fitted.values

#plot model vs actual values to see the validity of the model and the accurracy of its predicitions. 
plot(mtcars$mpg, fitted_values, ylab = 'predicted values', 
     xlab = 'real values',col = 'red')

#now we are going to add our fitted values to the old graph with the actual values to see the accuraccy of the model 

plot3d(x = mtcars$wt, 
       y = mtcars$qsec,
       z = mpg.model$fitted.values,
       type = 's', 
       col = 'red', 
       size = 4)
#we can see that the red spheres are clusted prety well with the green spheres i.e, the model is relatively succesful. 


#MODEL ERROR: 
#now we will calculate the error of the data by creating a dataframe.
error.mpg <- cbind.data.frame(mtcars$mpg, mpg.model$fitted.values)
#note that the cbind function is very useful for binding subsets of bigger dataframes into other dataframes or sets of data. 

colnames(error.mpg) <- c('Actual MPG', 'Estimated MPG')
error.mpg <- error.mpg %>%   
  mutate(error = error.mpg$`mtcars$mpg`- error.mpg$`mpg.model$fitted.values`, 
         squared.error = error^2) 
#now calculate the mean squared error (mse)
mse <- mean(error.mpg$squared.error)

#from this, find the root of the mean squared error (rmse) of  the estimations: 
rmse <- mse^(1/2)

#we can now see that the average error of the model is 2.47. 
#this shows us that on average, each value differs by 2.47 from the exact value. 

