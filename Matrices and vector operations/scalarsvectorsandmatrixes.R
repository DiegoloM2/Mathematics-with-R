#creating some vectors:
#Using the 'c()' function to create a vector
v1 <- c(2,3,4,5)
#using the ':' operator
v2 <- 2:5
#the default counter is 1 and the output will not be a num but an int
#basically the ':' counts between two values

#using the seq() function, (long version of ':' function)
#the advantage is that you can tell the program by how much you want it to count
 v3 <- seq(from = 2, to = 5, by = 1)
 #you can also do it by saying
 v3 <- seq(2,5,1)
 
 #using the 'rep()' function
 v4 <- rep(37, 5) 
 
 #Creating a matrix. 
 #A matrix is just a collection of vectors so you can create it out of vectors
 
 
#using the 'matrix()' function 
#byrow statement is used to populate the matrix by rows (if set to false, it will do it by columns)
m1 <- matrix(c(1,56,36,67,3,43),nrow = 2, ncol = 2, byrow = TRUE)

#using the 'rbind()' function
#this function binds by rows hence the name 'rbind'
m2<- rbind(c(1,2,3), c(4,5,6))

#using the 'cbind()' function
#this function binds by columns hence the name 'cbind()'
m3 <- cbind(c(1,3,5), c(2,4,6))


#plots in 2d and 3d:

#plots in 2d
u1 <- c(2,5)
plot(u1[1], u1[2], type = 'p', col = 'red')
#this also shows some of the parameters in the plot() function

#this can also be used to create a vector in a graph using the 'arrows()' function
arrows(x0 = 0, y0 = 0, x1 = u1[1], y1 = u1[2], col = 'blue', lwd = 2 )

#plotting vectors in 3d space using 'points3D()' function
library(plot3D)
u2 <- c(4,6,7)

points3D(x = u2[1], y = u2[2], z = u2[3], col = 'blue', phi = 0, zlim = c(0,8), xlim = c(0, 5), ylim = c(0, 7))
#'phi' is useful since it makes it easier to see.

#now, add a 3d vector arrow
arrows3D(x0 = 0,y0 = 0,z0 = 0, x1 = u2[1], y1 = u2[2], z1 = u2[3], add =  TRUE)
#with the arrows3d function you need to set the add = TRUE as the arrow is not added by default


