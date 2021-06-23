#Lab 3rd problem; optimization: 
f.x <- function(x) x^4- 2*x^2 +3

plot(f.x, xlim = c(-1.5, 1.5))

#from the plot, extreme values are at about ~ -1, 0, 1
f.prime <- Deriv(f.x)

#lets plot the derivative of f to ensure: 
plot(f.prime, xlim = c(-2, 2), col = 'green', add = TRUE)
plot(f.prime, xlim = c(-10, 10))

#now find the roots of the derivative to find extreme values: 
uniroot(f.prime, interval = c(-5, -1))

#roots: 0, 1, -1
#this are the roots given by the function uniroot. 
#we have done this by solving the roots of the derivatives of x from our original estimations: 
#now let's find the extreme values: 
f.x(0)
f.x(1)
f.x(-1)
#extreme values: 3, 2, 2


#now, we must determine if they are local maximum or minimum

f.doubleprime <- Deriv(f.prime)

f.doubleprime(-1)
#this is positive therefore -1 is a local minimum. 
f.doubleprime(0)
#this is negative therefore 0 is a local maximum
f.doubleprime(1)
#this is positive therefore 1 is a local minimum 

#therefore we have two local minimums:x = 1, x = -1 
#and one local maximum: x = 0