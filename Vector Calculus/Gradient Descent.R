#----Gradient Descent-----
library(Deriv)
library(rgl)

f <- function(x, y) x^2 + x*y + y^2 + y

#plot3d(f, ylim = c(-20, 20), xlim = c(-20, 20))


#Now, we define the partial derivatives: 

f.x <- Deriv(f, x = 'x')
f.y <- Deriv(f, x = 'y')

#now we apply the algorithm 
#our starting point is going to be: 
x <- 0.3
y <- -0.6


#set the learning rate; 
a = 0.01
n.iter <- 500

x.history <- numeric(n.iter)
y.history <- numeric(n.iter)
f.history <- numeric(n.iter)

for (i in 1:n.iter) {
  x.gradient <- f.x(x = x, y = y) 
  y.gradient <- f.y(y = y, x = x)
  
  x <- x - a*x.gradient
  y <- y - a*y.gradient
  x.history[i] <- x
  y.history[i] <- y 
  f.history[i] <- f(x = x, y = y)
}

plot(f.history)