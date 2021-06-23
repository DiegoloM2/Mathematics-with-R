#lab problem 5:
library(tidyverse)
library(rgl)
b.data <- read.csv(file = 'C:\\Users\\diego\\OneDrive\\Documentos\\Baseball2018.csv', header = TRUE)

data.r <- b.data %>%
  select(Runs, H9, HomeRun)

plot3d(
  x = data.r$HomeRun, 
  y = data.r$H9, 
  z = data.r$Runs, 
  zlab ='runs', 
  ylab = 'Holes per 9 strikes', 
  xlab = 'Home Runs',
  col = 'red', 
  type = 's', 
  size = c(3), lwd= 0
)

#now do a linear model to predict values: 

lmodel <- lm(Runs ~ H9 + HomeRun, data = data.r)

fit.vals <- lmodel$fitted.values

plot(x = data.r$Runs, 
     y = fit.vals, 
     xlab = 'actual data', 
     ylab = 'prediced data')

se <- cbind.data.frame(data.r$Runs, fit.vals)
colnames(se) <- c('actual', 'predicted')

df.error <- se %>% 
  mutate(squared.error = (actual-predicted)^2)

rmse <- mean(df.error$squared.error)^(1/2)

#the root mean squared error is small therefore the model is relatively accurate since the margin of the data is also small. 

. 