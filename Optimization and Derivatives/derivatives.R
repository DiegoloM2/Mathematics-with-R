#derivatives in R, Diego

library(Deriv)
#this is the crucial library for derivatives in R.

tangent.plots <-  function(fun, pt) {   ## fun = function; pt = point where sec lines will occur
  f.prime <- Deriv(f)
  x1 <- pt
  y1 <- f(x1)
  m1 <- f.prime(x1)
  plot(f, xlim = c(x1-10,x1+10), ylim = c(y1-10,y1+10), col = 'blue')
  points(x = x1, y = y1, col = 'blue', type = 'p', pch = 16)
  sec.int <- -m1*x1 + y1
  abline(a = sec.int, b = m1, col = 'red')
  text(x1+8, y1-8, labels = paste('Slope:', m1, sep = ""))
  text(x1-0.5, y1+0.5, labels = paste('(',x1,',',y1,')'))
}

f.1 <- function(x,y) x^3 -x^2

library(rgl)

f.primey <- Deriv(f.1, x = 'y')
f.primex <- Deriv(f.1, x = 'x')

plot3d(f.1, xlim = c(-50, 50), ylim = c(-50, 50), zlim = c(-200000, 200000))
plot3d(f.primey, xlim = c(-50, 50), ylim = c(-50, 50),
       col = 'red', add = TRUE)
plot3d(f.primex, xlim = c(-50, 50), ylim = c(-50, 50), 
       col = 'green', add = TRUE)
#from this we can see that with partial derivatives, the function's shape and attitude also depends on the highest degree polynomial variable. 

f.prime <- function(x, y) x^x + y^x
plot3d(f.prime, xlim = c(-5000, 5000), ylim = c(-5000, 5000))
