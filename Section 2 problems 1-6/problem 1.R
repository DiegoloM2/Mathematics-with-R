#lab 1, section 2

x3 <- function(x) x^3

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
plot(function(x) x^5, xlim = c(-10,10))
plot(function(x) log(x), xlim = c(-10,10),
     col = 'red',add= TRUE)
plot(function(x) exp(x), xlim = c(-10, 10), 
     col = 'green', add = TRUE)
plot(function(x) 1/x, xlim = c(-10, 10), 
                  col = 'blue', add = TRUE)


