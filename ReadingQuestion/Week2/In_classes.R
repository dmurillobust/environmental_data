# september 15/2022

data(iris)

head(iris)

iris$Sepal.Width

mean(iris$Sepal.Length)

sd(iris$Sepal.Length)

plot(iris$Sepal.Width, iris$Sepal.Length)

data_center_x <- mean(iris$Sepal.Width)
data_center_y <- mean(iris$Sepal.Length)

c(data_center_x, data_center_y)

plot(iris$Sepal.Width, iris$Sepal.Length)
points(x= data_center_x, y = data_center_y, col = "red")

plot(iris$Sepal.Width, iris$Sepal.Length)
points(x= data_center_x, y = data_center_y, col = "red")
abline(h = 6.5, v = 0:2/2)

plot(iris$Sepal.Width, iris$Sepal.Length)
points(x= data_center_x, y = data_center_y, col = "red")
abline(lm(Sepal.Length ~ Sepal.Width, data= iris))

line_point_slope = function(x, x1, y1, slope)
{
  get_y_intercept = 
    function(x1, y1, slope) 
      return(-(x1 * slope) + y1)
  
  linear = 
    function(x, yint, slope) 
      return(yint + x * slope)
  
  return(linear(x, get_y_intercept(x1, y1, slope), slope))
}


line_point_slope(2, 4, 4, -2)

plot(x = iris$Sepal.Width, y = iris$Sepal.Length)
points(x = data_center_x, y = data_center_y, col = "red")
curve(
  line_point_slope(
    x, 
    data_center_x, 
    data_center_y,
    -3), 
  add = TRUE)


data("co2")
head(CO2)
library(MASS)

data("Animals")

animal_center_x = mean(Animals$body)
animal_center_y = mean(Animals$brain)

png(filename = "Week2/DavidMurilloweek2.png", units = "cm", 
    width = 14, height = 10, res = 450)

plot(x = Animals$body, y = Animals$brain, main = "Relationship between body size and brain size",
     sub = "David Murillo",
     ylab= "Brain size", xlab= "Body size")
points(x = animal_center_x, y = animal_center_y, col = "red")
curve(
  line_point_slope(
    x, 
    animal_center_x, 
    animal_center_y,
    0.4), 
  add = TRUE)

dev.off()


png(filename = "Week2/DavidMurilloweek2_2.png", units = "cm", width = 12, height = 10, res = 300)

plot(x = Animals$body, y = Animals$brain, main = "Scatterplot 2 David Murillo",
     ylab= "Brain size", xlab= "Body size")
points(x = animal_center_x, y = animal_center_y, col = "red")
abline(lm(brain ~ body, data= Animals))

dev.off()

