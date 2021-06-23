#optimization using derivatives of single variable functions 

library(Deriv)

f <- function(x) -0.02*x^2 + 0.75*x

plot(f, xlim = c(-5, 40))

f.prime <- Deriv(f)

#let's plot it to visualize

curve(f.prime, col = 'red', add = TRUE)
abline(h = -0.04, lty = 3)

#use uniroot() function to solve for the root. 
#note that this function only works for single variable equations: 

critical.point <- uniroot(f.prime , interval = c(5, 25))$root
#uniroot searches the given interval to find the roots of the functions. 

#now find the extreme value by plotting the root into f
f(critical.point)
#this gives us the y-value for the critical point. 

#now lets try to find out if this maximum is a minimum or a maximum: 
#we will do this by using the second derivative: 
f.doubleprime <- Deriv(f.prime)

#now let's input the point of the extreme value of x:
f.doubleprime(critical.point)
#we can see that the point given is negative therefore the extrema must be a local maximum. 
