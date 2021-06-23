#Optimization using derivatives for 2 variable functions.

library(Deriv)
f <- function(x,y) x^2 + y^2 - 2*x - 6*y + 14

#Derive with respect to x and Y: 

f.x <- Deriv(f, x = 'x')
f.y <- Deriv(f, x = 'y')

f.x #2x - 2: root = 1
f.y #2y - 6, root = 3
#critical point = f(1, 3)

#lets plot the graph of f to get an intuition: 
library(rgl)
plot3d(f, xlim = c(-20, 20), ylim = c(-20, 20))

#so it has only one local minimum. 
#lets verify this with the 2nd derivative test: 
f.xx <- Deriv(f.x, x = 'x')
f.yy <- Deriv(f.y, x = 'y')
f.xy <- Deriv(f.x, x = 'y')

D <- f.xx(1,3)*f.yy(1, 3) - (f.xy(1, 3))^2

#we can see that D < 0 (D = 4). 
#therefore, we now use the derivative of f.xx or f.yy
f.xx(1, 3)
#f.xx of the critical point is positive therefore
#the point must be a local minimum


#1, 3 is a global extrema. 
#note that this could've also been done by using the function 'uniroot()'


#Another example with a more difficult function 
#this time we'll have to use the library rootSolve
library(rootSolve)

f.2 <- function(x, y) x^2 + y^2 + x*y

#let's find the derivative as always: 
f.2.x <- Deriv(f.2, x = 'x')
f.2.y <- Deriv(f.2, x = 'y')

#we can see that both of this functions contain both x and y variables 
#therefore, solving for roots is more difficult
# we need to use the function 'multiroot()' with a function in terms of x: 
#lets name that function: 
func <- function(x) c(2*x[1] + x[2] + 3,
                      2*x[2] + x[1] + 10)

#we must name the function this way because it is the way that 'multiroot()' works. 
multiroot(f = func, start = c(0, 0))

#and the roots = 0,0
#this can also be fond by solving the simultaneous equation

#now let's find if the critical point of this more complex function is a local min or max: 

f.2.xx <- Deriv(f.2.x, x = 'x')
f.2.yy <- Deriv(f.2.y, x = 'y')
f.2.xy <- Deriv(f.2.x, x = 'y')

D <- f.2.xx(0,0)*f.2.yy(0,0) - (f.2.xy(0,0))^2

#D is positive therefore: 
f.2.xx(0, 0)
#f.2.xx is also positive therefore the critical point is a local minimum. 
#therefore, 0,0 is a local min. 


