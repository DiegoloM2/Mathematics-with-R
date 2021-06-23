#Vector operations

#creating a function to plot vectors in 2d
vecplot_2d <- function(vector, xax, yax, color)
  {
  vec <- vector
  plot(vec[1], vec[2], xlim = xax, ylim = yax, col = color)
  arrows(0,0, vec[1], vec[2], col = color)
  text(vec[1], vec[2], labels = paste('(', vec[1],',', vec[2], ')', sep = ""), pos = 3)
  #function text is to display a label in the grapj
  }

#trying the function
vecplot_2d(c(5,8), c(0,6), c(0,9), 'red')


#create a function to plot vectors in 3d space:
library(plot3D)
vecplot_3d <- function(vector, xax, yax,zax, color)
{
  vec <- vector
  points3D(vec[1], vec[2], vec[3], col = color, phi = 0,xlim = xax, ylim = yax, zlim = zax)
  text3D(vec[1], vec[2], vec[3]+0.25, labels = paste('(', vec[1], ',', vec[2], ',', vec[3]
                                                , ')', sep = ""), add = TRUE)
  arrows3D(0,0,0, vec[1], vec[2], vec[3], col = color, add = TRUE)
}

#try the function
vecplot_3d(c(5,7,2), xax = c(0, 6), yax = c(0,7),
           zax = c(0,3), color = 'blue') 


#scalar multiplication
v1 <- 1:5
2*v1
#very simple, just take the scalar times the vector

#Vector addition
v2 <- -1:-5
v1 + v2
#also very simple, the only condition is that the vectors must be the same size

#vector subtraction
v2 - v1
#same as addition and same conditions

#be careful that both vectors have same dimensions 
#if not, r will double the smaller vector if it is a multiple of the bigger vector
#and do the addition anyway

#Vector addition and multiplication
v1 + 5*v2


#create a vector addition function in 2d space

vec.add2d <- function(vec1, vec2, xax, yax)
{
  to.plot <- as.data.frame(rbind(vec1, vec2, vec1 + vec2))
  plot(to.plot[-2]$vec1, to.plot[-2]$vec2, col = 'red', lwd = 2,
               xlim = xax, ylim = yax, ylab = 'y', xlab = 'x')
  
  #add arrows
  arrows(0,0, to.plot[1,1], to.plot[1,2], col = 'blue')
  arrows(to.plot[1,1],to.plot[1,2], to.plot[3,1], to.plot[3,2], col = 'green')
  arrows(0,0, to.plot[3,1], to.plot[3,2], col = 'red')
}

vec.add2d(c(5,4), c(4, 9), c(0,10), c(0, 15))

#create a functino to add vectors and draw them in 3d space
library(plot3D)
vec.add3d <- function(vec1, vec2, xax, yax, zax, phi, theta)
  {
  to.plot <- as.data.frame(rbind(vec1, vec2, vec1+vec2))
  points3D(to.plot[1,1], to.plot[1,2], to.plot[1,3], 
           xlab = 'x', ylab = 'y', zlab = 'z', xlim = xax, ylim = yax, zlim = zax, phi = phi, theta = theta,
           col = 'red')
  text3D(to.plot[1,1], to.plot[1,2], to.plot[1,3]+0.2,
         labels = paste("(", to.plot[1,1], ",", to.plot[1,2], ",", to.plot[1,3],")", sep = ""),add = TRUE)
  arrows3D(0,0,0, to.plot[1,1], to.plot[1,2], to.plot[1,3], col = 'blue', lwd = 2, phi = phi, theta = theta,
           add = TRUE)
  
  points3D(to.plot[3,1], to.plot[3,2], to.plot[3,3], col = 'red', 
           xlim = xax, ylim = yax, zlim = zax, phi = phi, theta = theta,
           xlab = 'x', ylab = 'y', zlab = 'z',
           add = TRUE)
  text3D(to.plot[3,1], to.plot[3,2], to.plot[3,3]+0.2, 
         labels = paste("(", to.plot[3,1], ",", to.plot[3,2], ",", to.plot[3,3],")", sep = ""),add = TRUE)
  arrows3D(to.plot[1,1],to.plot[1,2], to.plot[1,3], to.plot[3,1], to.plot[3,2], to.plot[3,3], col = 'green',
           lwd = 2, phi = phi, theta= theta, add = TRUE)
  
  points3D(to.plot[2,1], to.plot[2,2], to.plot[2,3], col = 'red', 
           xlab = 'x', ylab = 'y', zlab = 'z',xlim = xax, ylim = yax, zlim = zax, phi = phi, theta = theta,
           add = TRUE)
  text3D(to.plot[2,1], to.plot[2,2], to.plot[2,3]+0.2, 
         labels = paste("(", to.plot[3,1], ",", to.plot[3,2], ",", to.plot[3,3],")", sep = ""),add = TRUE)
  arrows3D(0,0, 0, to.plot[3,1], to.plot[3,2], to.plot[3,3], col = 'red', lwd = 2, phi = phi, theta = theta, add = TRUE)
}

#try the function
vec.add3d(c(2,5,7), c(3,2,5), c(0,6), c(0,6), c(0, 14),0, 0)
