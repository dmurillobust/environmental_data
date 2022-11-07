# DataCamp: Intro to R

# A variable a that contains the text of your first name.

a <- "David"

# A variable b1 that contains the number 45.6
b1 <- 45.6

# A variable b2 that contains the text “45.6”
b2 <- "45.6"

# A variable c1 that contains the sequence of integers from 0 to 3
c1 <- 0:3


b1 + c1

# Create a vector called v1 that contains a sequence of integers from -2 to 2.
v1 <- c(-2:2) 

# Wen you print the contents of v1, it should look like this:
v1

# Now, use v1 to create a new vector called v2 whose elements are 
#the elements of v1 multiplied by 3. It should look like this:

v2 <- v1 * 3
v2

# Finally, calculate the sum of all the elements in v2.
sum(v2)


# Create a vector called vec_4 whose elements are the integers from 1 to 12.

vec_4 <- c(1:12)

# Create a matrix mat_1 from vec_4 that has three rows and four columns. 
#The values in mat_1 should be sequentially increasing by row.

mat_1 <- matrix(vec_4, nrow = 3, ncol = 4, byrow = TRUE)
mat_1

# Create a matrix mat_2 from vec_4 that has three rows and four columns. 
# The values in mat_2 should be sequentially increasing by column.

mat_2 <- matrix(vec_4, nrow = 3, ncol = 4, byrow = FALSE)
mat_2

# Create a list, named my_list_1 with following three elements:
  
#first element is numeric: 5.2
#second element is a string: “five point two”
#third element is a vector of all integers from 0 to 5 [how do you do this?]

my_list_1 <- list(5.2, "five point two", c(0:4))

#Name the elements in my_list_1:
  
#  “two”
#“one”
#“three”

names(my_list_1) <- c("two", "one", "three")
my_list_1


my_list_1["three"]
my_list_1$three
my_list_1[3]
my_list_1[[3]]


my_list_1["one"]
my_list_1[2]

my_vec = rep(1:3, 5)
my_vec

# Use the logical equality test operator == to create a vector, 
# my_bool_vec, of Boolean values from my_vec.
# my_bool_vec should be the same length as my_vec.
# my_bool_vec should have TRUE values in the positions where my_vec has values of 3.

my_bool_vec <- my_vec == 3

data.frame(my_vec, my_bool_vec)

# Use my_bool_vec to retrieve all of the elements of my_vec that have a value of 3.


head(my_vec[my_bool_vec])





