#4th Lab problem: 
library(rgl)
library(Deriv)
library(rootSolve)

f.1 <- function(x,y) x^2 + x*y + y^2 + y

plot3d(f.1, xlim = c(-10, 10), 
       ylim = c(-10, 10))

#find the partial derivatives: 
f.1.x <- Deriv(f.1, x = 'x')
f.1.y <- Deriv(f.1, x = 'y')
f.1.xx <- Deriv(f.1.x, x = 'x')
f.1.yy <- Deriv(f.1.y, x = 'y')
f.1.xy <- Deriv(f.1.x, x = 'y')

#solve for the roots: 
#2*x+y = 0
#1 + 2y + x = 0 <-- 2y + x = -1

LHS <- matrix(c(2, 1, 1, 2), 
              byrow = TRUE, ncol = 2)

RHS <- c(0, -1)

#now solve for the roots: 
solve(LHS, RHS)

#roots = 1/3 (for x) and -2/3 (for y)

#let's look at the graph to verify if this is true: 
plot3d(f.1, xlim = c(-20, 20), 
       ylim = c(-20, 20))

#it is right. 


#let's now find out the nature of the critical point: 

D <- f.1.xx(1/3, -2/3)*f.1.yy(1/3, -2/3) - (f.xy(1/3, -2/3))^2
#D is positive 
f.1.xx(1/3, -2/3)
#f.1.xx is also positive 
#therefore, critical point f.1(1/3, -2/3) is a minimum point. 
