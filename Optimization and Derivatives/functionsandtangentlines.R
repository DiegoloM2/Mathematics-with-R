#Functions and tangent lines in R:

f<- function(x) x
#first you give the function and then you give the values for calculation in the function. 
#that is basically all there is to naming a function in R


#Plotting a function: 

#if you want to plot an existing function, you can simply do this: 
plot(f, main = 'f(x)', xlim = c(-5,5))
#f being the name of the function (and taking into account the function is already created. )
#note that you can still enter parameters into the 'plot' function. 


#ESTIMATING the slope of a function using secant lines: 

#first, this 2 packets are fundamental: l
library(animation)
library(Deriv)

#first, define a function of which the slope you don't know (not a linear one)
x2 <- function(x) x^2

#first, we will use a simple function: 

secant.plots <- function(fun, pt) {   ## fun = function; pt = point where sec lines will occur
  f.prime <- Deriv(fun)
  x1 <- pt
  y1 <- fun(x1)
  m1 <- f.prime(x1)
  if (m1 < 0) {
    min <- f.prime(x1)-12
    max <- f.prime(x1)
    j <- 0.5
  } else {
    min <- f.prime(x1)+12
    max <- f.prime(x1)
    j <- -0.5
  }
  windows();
  for (i in seq(min,max,j)) {
    plot(fun, xlim = c(x1-10,x1+10), ylim = c(y1-10,y1+10), col = 'blue')
    points(x = x1, y = y1, col = 'blue', type = 'p', pch = 16)
    sec.int <- -i*x1 + y1
    abline(a = sec.int, b = i, col = 'red')
    text(x1+8, y1-8, labels = paste('Slope:', i, sep = ""))
    text(x1-0.5, y1+0.5, labels = paste('(',x1,',',y1,')'))
    ani.pause(interval = 0.5)
  }
}

#eg: 
secant.plots(fun = x2, pt = 2)

#to find out the gradient of the graph at a point you can use the function: 
tangent.plots <-  function(fun, pt) {   ## fun = function; pt = point where sec lines will occur
  f.prime <- Deriv(fun)
  x1 <- pt
  y1 <- fun(x1)
  m1 <- f.prime(x1)
  plot(fun, xlim = c(x1-10,x1+10), ylim = c(y1-10,y1+10), col = 'blue')
  points(x = x1, y = y1, col = 'blue', type = 'p', pch = 16)
  sec.int <- -m1*x1 + y1
  abline(a = sec.int, b = m1, col = 'red')
  text(x1+8, y1-8, labels = paste('Slope:', m1, sep = ""))
  text(x1-0.5, y1+0.5, labels = paste('(',x1,',',y1,')'))
}



