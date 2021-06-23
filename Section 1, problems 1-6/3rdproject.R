#Project num 3
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
  
  points3D(to.plot[3,1], to.plot[3,2], to.plot[3,3], col = 'red', 
           xlab = 'x', ylab = 'y', zlab = 'z',xlim = xax, ylim = yax, zlim = zax, phi = phi, theta = theta,
           add = TRUE)
  arrows3D(0,0, 0, to.plot[3,1], to.plot[3,2], to.plot[3,3], col = 'red', lwd = 2, phi = phi, theta = theta, add = TRUE)
}

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

vec.add2d(c(3,5), c(4,2), c(0,7), c(0,8))
vec.add3d(c(0,4,3), c(4,7,5), yax = c(0, 12), xax = c(0,5), zax = c(0, 8),
          phi = 0, theta = 30)
