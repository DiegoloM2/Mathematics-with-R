#lab problem 6
library(tidyverse)
library(rgl)
b.data <- read.csv(file = 'C:\\Users\\diego\\OneDrive\\Documentos\\Baseball2018.csv', header = TRUE)

#run difference of a team is the difference between the number of runs scored by the team and the number of runs which the opposite team has scored. 
#ERA is a pitcher's metric to see how many runs per game a team gives up. 

mod.data <- cbind(b.data[, c('WinPct', 'Rdiff', 'ERA')])

plot3d(x = mod.data$Rdiff,
       y = mod.data$ERA, 
       z = mod.data$WinPct, 
       zlab = 'Win %', 
       ylab = 'ERA',
       xlab = 'Run Difference', 
       lwd = 1, 
       size = c(3),
       type = 's', 
       col = 'red')

#scatter plot: run difference
plot(y = mod.data$WinPct, 
     x = mod.data$Rdiff, 
     ylab = 'Win %', 
     xlab = 'Run Difference', 
     col = 'red', 
     ylim = c(0,1), 
     xlim = c(-2, 2 ))

#scatter plot: era
plot(y = mod.data$WinPct, 
     x = mod.data$ERA, 
     col = 'green')

y<- as.matrix(mod.data$WinPct)

x <- as.matrix(
               cbind(rep(1, length(mod.data$WinPct)),
                     mod.data$Rdiff, mod.data$ERA)
               )
linear.model <- solve(t(x)%*%x)%*%t(x)%*%y

mod.data <- 
  mod.data %>% 
  mutate(prediction = linear.model[1] + linear.model[2]*Rdiff +
           linear.model[3]*ERA)

plot(y = mod.data$prediction, 
     x = mod.data$WinPct, 
     ylab = 'predicted', 
     xlab = 'actuals')

#now plot predicted against actuals in 3d space. 

plot3d(x = mod.data$Rdiff,
       y = mod.data$ERA, 
       z = mod.data$WinPct, 
       zlab = 'Win %', 
       ylab = 'ERA',
       xlab = 'Run Difference', 
       lwd = 1, 
       size = c(3),
       type = 's', 
       col = 'red')
plot3d(x = mod.data$Rdiff,
       y = mod.data$ERA,
       z = mod.data$prediction, 
       col = 'green', type = 's', 
       size = c(3), lwd = 1, 
       add = TRUE)

#calculate the rmse for fun: 

mod.data <- mod.data %>% 
  mutate(squared.error = (WinPct - prediction)^2)

rmse <- (mean(mod.data$squared.error)^1/2)*100
