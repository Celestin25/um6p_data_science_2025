###################################
###################################
########                   ########
########   Data Science 1  ########
########       Lab 6       ########
########  26th Nov. 2024   ########
########                   ########
###################################
###################################

# Welcome to lab number 6. Today we'll be introducing pipes and the tidyverse,
# then reviewing linear models.

#####################
####    Pipes    ####
#####################

# The pipe operator looks like this: |>
# It signifies: take the element on the left and use it as the first argument in the function on the right

# Example

hist(rnorm(200), breaks = seq(-4, 4, 0.5))
# is equivalent to

rnorm(200) |> hist(breaks = seq(-4, 4, 0.5))
runif(10, 1, 10) |> log() |> sqrt() |> round(x = _, 2)


# The purpose of the pipe is mostly aesthetic, in particular to avoid large numbers of parentheses when something needs to be transformed using multiple functions:

### 1.1 Rewrite the following expression using pipes:
set.seed(123)
round(sqrt(log(runif(10, 1, 10))), 2)

# Pipes were initially created in a package called magrittr, part of the 'tidyverse' group of packages

########################
####    Packages    ####
########################

# Packages are essentially environments full of functions and/or objects which aren't loaded into R by default, but must be first installed (generally from a repository called CRAN), and then loaded

# Here we will install tidyverse, which is not one but a series of packages written by the same group of people, which share a number of syntactical features

install.packages('tidyverse')

# After you have installed tidyverse into your packages, you must also load it into your environment

library(tidyverse)

# You will only have to install a package once. However, every time you start fresh in a new R environment, you will have to load the packages you need again.

#########################
####    TIDYVERSE    ####
#########################

# The tidyverse encompasses a very large number of packages, and is fairly powerful (in that you can do a lot using tidyverse packages)
# However, you DO NOT need to use tidyverse exclusively! I mostly don't use it, for example, preferring to stick to base R except for a few functionalities.

# Downsides of tidyverse include: unique syntax which is very different from other programming languages such as python
# 'Black box' functions that have specific purposes that must be remembered, as opposed to more general-purpose functions in base R
# Often actually more verbose than base R (ie. requires more lines of code to do the same thing)
# Using tidyverse is a matter of preference!

# The pipe operator was originally introduced in the tidyverse package magrittr.
# The tidyverse pipe operator looks like this: %>%

set.seed(123)
runif(10, 1, 10) %>%
  log() %>%
  sqrt() %>%
  round(2)

# In this class we will look at 2 important tidyverse packages.
# Today we will look at dplyr, which is used to manipulate and transform data.
# Next week we will learn ggplot2, which is used for plotting and data visualisation

#####################
####    dplyr    ####
#####################

# The philosophy behind dplyr is that every data transformation can be done using a function, and multiple transformations can be done by piping an object through multiple functions
# For example, in dplyr we no longer use indexing.
# Instead we use the functions 'select', to choose specific columns in a data frame, and 'filter', to choose specific rows.

data(mtcars)

# so instead of:
mtcars[mtcars$cyl == 6, 1:5]
# we would write:
mtcars %>%
  filter(cyl == 6) %>%
  select(1:5)

### 2.1
# using select() and filter(), create a new database of cars that are over 4000 lbs in weight, retaining only the wt and mpg columns.
# Save this database to an object called 'df'.

# After you have selected the rows and columns you are interested in, you can
# change the order of the rows using arrange

df %>% arrange(wt)

df %>% arrange(desc(wt))


# To change variables, we can use mutate()
df <- df %>% mutate(wt_kg = wt * 453.592, km_per_l = mpg * 1.60934 / 3.78541)

# And we can use ifelse() within mutate()
mtcars <- mtcars %>%
  mutate(wt_class = ifelse(wt >= 4, 'Oversized', 'Standard'))

# We can even do a sultiple ifelse statment using case_when()
mtcars <- mtcars %>%
  mutate(
    efficiency = case_when(
      mpg <= 15 ~ 'low',
      mpg > 15 & mpg <= 20 ~ 'medium',
      mpg > 20 ~ 'high'
    )
  )

# Next, summarise (or summarize) is a useful function which collapses a dataframe into a single row and can calculate summary statistics, eg:

mtcars %>%
  summarise(
    mean_wt = mean(wt),
    sd_wt = sd(wt),
    n = length(mpg)
  )

# We can also use summarise to collapse a data frame not into one single row, but into as many rows as we have groups of interest.
# To do this, first we need to use group_by()

mtcars %>% group_by(efficiency)

# You'll notice that this automatically changes the data frame into a new kind of object, called a tibble.
# Tibbles are basically tidyverse dataframes, that display information slightly differently, and are a bit more particular about certain things like not wanting empty cells.
# Tibbles can also be grouped, which allows for further operations down the line
# For example:

mtcars %>%
  group_by(efficiency) %>%
  summarise(
    wt_kg = mean(wt),
    n = length(hp)
  ) %>%
  arrange(
    c('high', 'medium', 'low')
  )

# You can group by multiple variables

mtcars %>%
  group_by(efficiency, cyl) %>%
  summarise(
    wt_kg = mean(wt),
    n = length(hp) 
  )

# After grouping a tibble, remember to ungroup it later using ungroup(), or you may have issues down the line.

# 3.1
data(iris)
# using the dplyr functions do the following:
# create a new column called Petal.Area which is the product of the petal width and petal length columns.
# For each of the different species of iris, present the mean and standard deviation for the sepal length, sepal width, and petal area, as well as the number of samples (n)
# Order this database in decreasing order of average petal length.
iris %>% 
  mutate(Petal.Area=Petal.Length*Petal.Width)%>%
  group_by(Species)%>%
  summarise(
sd_sepal_length =sd(Sepal.Length),
mean_sepal_length=mean(Sepal.Length),
mean_sepal_width=mean(Sepal.Width),
sd_sepal_width=mean(Sepal.Width),
mean_sepal_area=mean(Petal_Area),
sd_sepal_area=sd(Petal_Area),
n=n()
    
  )-> iris

###################################
####    Linear models intro    ####
###################################

# We can run an OLS linear model using lm()
# Inside the lm and other model functions we use formulas
# Formulas have the dependent variable on the left and the independent (predictor) variables on the right with a ~ in between
# Lets run a bivariate regression of engine displacement (in cubic inches) on miles per gallon (1mpg = 1km/L)
# N.B engine displacement is essentially a measure of engine size and therefore power

model <- lm(mpg ~ disp, data = mtcars)
summary(model)
### 4.1
# Interpret the Estimate value in the (Intercept) row.

### 4.2
# Interpret the Estimate value in the disp row.

### 4.3
# Is the relationship between these two variables positive or negative? Why do you think that might be?

### 4.4 What is the predicted average efficiency in miles per gallon of a car with a 200 cubic inch engine?

# Let's transform the independent variable:
mtcars$disp_centred <- mtcars$disp - mean(mtcars$disp)

### 4.5
# compare the mean and variance of the new variable with the untransformed variable. What do you notice?

### 4.6
# Run the linear regression again, but this time with disp_centred as the independent variable.
# Interpret the Estimate value in the disp_centred row.
# What is the point of performing this transformation?

### 4.7
# 1 cubic inch is 16.4 cubic centimeters
# 1 mile per gallon is 0.425 km/L 
# Transform the disp_centred variable so that it is in cubic centimeters instead of cubic inches
# Transform the mpg variable so that it is in km/L
# Run the regression one final time with the new variables
# Interpret the two parameter estimates.
# What is the predicted average efficiency in km/L of a car with an engine displacement of 6500cc?

### 4.8
# Run the following code:
y <- mtcars$mpg
x <- cbind(1, mtcars$wt)

# A couple of functions for you to know:
# t() returns the transpose of any matrix
# solve() returns the inverse of any (invertible) matrix
# %*% is matrix multiplication

# with that in mind try to code the following expression in R:
# (x'x)^(-1) * (x'y)
# where ' means the transpose
# Run the code you have written. Compare to the regression output from the lecture (lm(mpg ~ wt, data = mtcars))
# What do you find?
