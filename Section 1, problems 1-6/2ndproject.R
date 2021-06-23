#Scalars vectors and matrixes first project
library(plot3D)

m1 <- matrix(seq(from = 1,to = 12, by = 1), nrow = 3, ncol = 4, byrow = TRUE)

v1 <- c(4,2)
v2 <- c(5,4)

plot(x = v1[1], y = v1[2], col = 'red', xlim = c(0, 6), ylim = c(0, 6))
arrows(y0 = 0, x0 = 0, x1 = v1[1], y1 = v1[2])
#use the points unction to add another plot/arrow to the same coordinate plane
points(x = v2[1], y = v2[2])
arrows(0,0, x1 = v2[1], y1 = v2[2], col = 'green')

#Matrix part
v3 <- matrix(c(83,32,53))


points3D(x = v3[1], y = v3[2], z = v3[3], phi = 0, zlim = c(0, 60), ylim = c(0,40),
         xlim = c(0, 90))
arrows3D(x0 = 0, y0 = 0, z0 = 0, x1 = v3[1], y1 = v3[2], z1 = v3[3], add = TRUE)
