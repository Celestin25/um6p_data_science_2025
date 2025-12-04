### Exam prep##

## Basic Functions

sqrt(25) # squareroot

exp(3) # e raise to power
rep(3, 4) # repeat 3, four times
rep(x = 3, times = 4) # repeat 3, four times
class(5) # check object type
length(my.vector) # check vector length
sum(my.vector) # sum of items in a vector
mean(my.vector) # to find the mean
sample(1:10, 8, replace = T) # sample from list while replacing
replicate(x, sample(1:6, 2, replace = T)) # repeat a function x times

my.vector <- c("this", "is", "a", "vector") # creating a vector

my.vector[2:4]
my.vector[c(1, 4)] # vector indexing

digits <- 0:10
digits[digits %% 2 == 1] # vector indexing ## %% is the remainder operator, it returns the remainder when you divide the left argument by the right argument.

group1 <- c("Arthur", "Fatima", "Suleiman", "Marco")
group2 <- c("Marco", "Maria", "Victor", "Fatima", "Antonio")
group1[group1 %in% group2]
intersect(group1, group2) # vector indexing


f2 <- function(x, y) {
  z <- x %% y
  return(z == 0)
} # defining a function

f2e <- function(x) {
  z <- runif(x, 0, 1)
  return(z <= 0.22)
} #  function returns true 22percent of time

########################
########################
########################

runif(10, 1, 2) # randomly select 10 values from uniform dist, bounded by 1 & 2
dunif(10, 1, 2) # probability density of 10 in the uniform distribution




###########################
##########################
##########################
## Matrix are like tables and can have row and column names

matrix(1:9, nrow = 3) # create matrix by column
c <- matrix(1:9, byrow = T, nrow = 3) # create matrix by row
rownames(c) <- c("row 1", "row 2", "row 3") # name matrix rows
colnames(c) <- c("col 1", "col 2", "col 3") # name matrix columns

# Some important base R functions to know: colSums, rowSums, colMeans, rowMeans,rbind
star_wars_matrix <- cbind(star_wars_matrix, total_revenue) # merge matrix with column or another matrix by column
new_hope[1, 2]

# If you leave a blank space either to the left or the right of the comma, you select for ALL the rows
# or ALL the columns, respectively
star_wars_matrix[, 2]
star_wars_matrix[4, ]
star_wars_matrix[1:3, ] # indexing matrix
star_wars_matrix["The Phantom Menace", "Total revenue"] # This works because our matrix has row and column names.

my_list <- list(c("red,green"), 1:5, FALSE, matrix(1:9, 3, 3)) # Lists
names(my_list) <- c("colours", "digits", "boolean", "matrix") # name elements in a list
my_list$boolean # access elements in a list by name
unlist(my_list) # turn list to vector

#######################
# dataframes are tables unlike vectors they can contain items of different types
# vector is to matrix what list is to dataframe

data("iris") # load dataframe
?iris # get info about dataframe

# quick overview of dataframe
str(iris) # no of observation, class of items and snapshot of dataframe
head(iris) # snapshot of df
summary(iris) # statistic overview of df

iris$Species # query column in df

# Remember the formula for the Binomial distribution:
# 𝑷(W=k) =  𝒑^𝒌∗(𝟏−𝒑)^((𝑵−𝒌) )∗(𝒏¦𝒌)
# Where (𝒏¦𝒌)=  𝒏!/𝒌!(𝒏−𝒌)!
# the probility in binomial distribution can be calc by
dbinom(8, 10, 0.7) # k=8, n=10, p=0.7
# theres also dnorm, dunif, dt for other types of distribution




####### Visualization

?plot

age_data <- data.frame(
  Age = rep(1:5, 2),
  Population = c(-20, -30, -40, -25, -15, 25, 35, 45, 30, 20),
  Gender = rep(c("Male", "Female"), each = 5)
)

# creating dataframes

# using if statement
if (x > 3) print("This statement is true")
if (x - 4 == 1) {
  new_object <- c("this", "statement", "is", "also", "true")
  print(new_object)
}

# if else statement
if (x - 4 > 1) {
  new_object <- c("this", "statement", "is", "also", "true")
  print(new_object)
} else {
  print("This is untrue")
}

# paste() and strsplit() can be used to join and separate
# character objects (strings), respectively. For example:

paste("Hello", "world!", sep = "_")
strsplit("Hello to you too. /My name is Ed.", split = "/")

# example of for loop
useless_function <- function(n) {
  for (i in 1:n) {
    print(paste0(i, ". This number is: ", c("even", "odd")[i %% 2 + 1]))
  }
}

# Next, WHILE loops continue to loop until the boolean statment in the defining parentheses, e.g.
x <- 0
while (x < 100) {
  print(x)
  x <- x + sample(1:20, 1)
}

data(mtcars)
y <- mtcars$mpg
x <- cbind(1, mtcars$wt, mtcars$cyl)

solve(t(x) %*% x) %*% (t(x) %*% y)
my_lm <- function(x, y) {
  n <- length(y)
  x <- as.matrix(cbind(1, x))
  b <- solve(t(x) %*% x) %*% (t(x) %*% y)
  # Next, using these calculated coefficients, calculate all of the predicted values, y_hat, for each of the values of x (each of the rows of the X matrix).
  # Hint: look at the formula for the linear model - and remember we are multiplying matrices!
  y_hat <- x %*% b
  # Next, calculate the residuals (actual values of y minus the predicted values y_hat)
  e <- y - y_hat
  # Next calculate the estimate of the residual standard error, s. Careful about the denominator here: check how many degrees of freedom you have!
  s <- sqrt(sum(e^2) / (n - ncol(x)))
  # Using s, calculate the variance covariance matrix of the coefficients.
  # vcov_coef <-  t(s^2)*solve(t(x)%*%x  )
  return(list(
    n = n,
    coefficients = b,
    residuals = e,
    s = s
    # vcov = vcov_coef
  ))
}


my_lm(y = mtcars$mpg, x = cbind(mtcars$wt, mtcars$cyl))
