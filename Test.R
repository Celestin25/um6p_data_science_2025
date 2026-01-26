counts <- c(1,2,3,4,5,6,5,4,3,2,1)
outcomes <- c (2,3,4,5,6,7,8,9,10,11,12)

data <- rep(outcomes, counts)
mean_data <- mean(data)
median(data)
mode <- outcomes[which.max(counts)]
df$language <- as.factor(df$language)
df$language <- relevel(df$language, ref = "Darija")
# running a model
model <- lm(Score ~ language, data = df)
summary(model)
# for some dataset I can run name of dataset without $

###################################
###################################
########                   ########
########   Data Science 1  ########
########       Lab 1       ######## 
########   07 Oct. 2025    ########
########                   ########
###################################
###################################


## Welcome to this first lab. Here we  will learn the basics of R, an open-source programming language and software environment.



# On the bottom is the console. You can input code directly into the console line by line - you do not need to run an entire file. Try running a simple calculation in the console, like 5+9. Type it in and press enter. 
5+9
# You can also write code in this, the code editor, and execute it from here. Try highlighting the following line and pressing 'Ctrl (Cmd) + Enter':
12 * 4 - 6


# Text beginning with a # sign is read as 'comment' and will not be evaluated by the console.
## Numbers (like 1.1, 2.3, etc) signify that I would like you to write a line a code in the code file and run it in the console

########################
####    Functions   ####
########################

# FUNCTIONS are commands that take in inputs and produce outputs. They mostly take in the inputs in parentheses, like this:
sqrt(25)
exp(3)

# Often, functions take multiple inputs that serve different purposes. Note how:
rep(3,4)
# produces a different output from
rep(4,3)
# If you can't remember in which order you have to input the arguments of a function, or if you just want to learn what a function does, you can type in ? followed by the function name in the console:
?rep

# Each argument has a name. By explicitly referring to these names when calling the function, we can avoid  any problems with order. For example:
rep(x=3, times=4)
rep(times=4, x=3)

# produce the same result, because we inputed the arguments by name using the 'argname = x' construction. When we don't use this construction, the function defaults each input to an argument according to a predefined order.

# OPERATORS are special functions that take only 2 arguments, and do not use brackets. Instead, you must input the two arguments on either side of the operator. Examples of operators include +, -,*,/, ^, %%, %/%, :, and there are many more which we will learn about soon.

########################
####     Objects    ####
########################

# Functions are one example of OBJECTS, which are stored within the main (global) ENVIRONMENT of the console. We can create new objects by using the 'assign' operator:

x <- 4

# You can now see in the 'Session' tab below that the object 'x'  is stored with the value 4.

x*5

##############################################################
###    ADVANCED NOTE: the = operator can also be used      ###
###    to assign values to objects, like in Python.        ###
###    However, we conventionally use the = operator       ###
###    only for arguments in a function. The main          ###
###    difference is that '<-' always assigns within       ###
###    the global environment, while '=' assigns in        ###
###    the local environment.                              ###
##############################################################


# Objects can have different classes. For example:
class(x)

# We can also store text into an object, by surrounding it with quote marks:

"Hello" -> y

y
class (y)


# y is now a 'character' object (R does not use the term 'string')

# If we forget to use quote marks R will search for a stored object with that name and return an error if it doesn't find it:

Salaam -> y

# We can convert objects between classes with "as" functions, for example:

x <- as.character(x)
x
class(x)

# One final very important class of object is the 'logical' class, a.k.a. Boolean. 
# Boolean objects can take one of two values

TRUE

# and

FALSE

# Booleans can be combined according to the laws of logic using the and operator &, and the or operator |

TRUE & TRUE
TRUE & FALSE
FALSE & FALSE

TRUE | TRUE
TRUE | FALSE
FALSE | FALSE

# There is also an exclusive or function, xor(), but it isn't used much.



####################################
####     Vectors and indices    ####
####################################

# You will have noticed that the console has always returned a [1] in front of it's output so far. This is because R has considered all these objects to be 'vectors' (in Python, this is the same thing as an array). Vectors are objects that can contain multiple elements. For example:

z <- 50:80
z

# The numbers in square brackets tell you the INDEX of the element to their right. The index is simply the position number of that element. You will notice that, unlike in Python, the first element of an object in R has the index number 1 and not 0. This is one of the most important syntactical differences between Python and R (if you think this is not a very important difference, you are correct. The two languages are very similar in syntax.)

# Vectors can be created from singular elements using the function c(), which stands for combine or concatenate.

my_vector <- c('this','is','a','vector')
my_vector
length(my_vector)
class(my_vector)

# You can use square brackets to isolate elements in a vector by putting their index between the brackets:
my_vector[1]
my_vector[4]
my_vector[2:4]
my_vector[c(1,4)]

### 1.1
# You can assign values to specific elements. Try writing a line of code below that changes the 4th element of my.vector to the word 'test'

my_vector[4] <- "test"
my_vector[c(2,4)]

### 1.2
# You can even assign values to elements of a vector that don't exist yet, thus creating them. Try assigning the word 'example' to the (as yet non-existent) 5th element of my.vector.
my_vector[5] <- "example"

# Instead of indices, you can select elements of a vector using a logical vector of the same length, e.g.

my_vector[c(TRUE,TRUE,FALSE,FALSE,FALSE)]


####################################
####     Logical operators      ####
####################################

# LOGICAL OPERATORS are operators that return logical vectors of the same length as the left argument. Examples include '==', the equality operator (not to be confused with the single = which is an assignment operator), >, <, >=, <=, and != (the 'different from' operator).

# For example:
my_vector == 'is'
1:10 >= 5
1:10 %% 2 == 0    ## %% is the remainder operator, it returns the remainder when you divide the left argument by the right argument.

### 2.1
digits <- 0:10
# Using the least amount of code possible, write a line of code that returns only the odd values of the digits object.

digits[digits %% 2 == 1]


# Another important logical operator is the %in% operator. It tells you if the elements on the left are found in the elements on the right. E.G.
group1 <- c('Arthur', 'Fatima', 'Suleiman', 'Marco')
group2 <- c('Marco','Maria', 'Victor','Fatima', 'Antonio')
group1 %in% group2
## 2.2 
# intersect is a function which returns the elements that all of its arguments have in common. For example:
intersect(group1,group2)
# Write a line of code that replicates this output using only group1, group2, square brackets, and logical operators.
group1[group1 %in% group2]
# OR
group2[group2 %in% group1]


####################################
####     Writing functions      ####
####################################

# Functions can be written and stored as objects. e.g:
f1 <- function(x) x*2 + 1
f1
# This function has only 1 argument, x. Try out this new function:
f1(3)
f1(7)
ex.vector <- c(2,7,4,24,13,8,12)
f1(ex.vector)

# You can write several lines of code in a function by enclosing all of the in curly brackets {}. The function 'return' can then specify what the output can be. For example:

f2 <- function(x,y){
  z = x %% y
  return(z == 0)
}

f2(8,9)
f2(14,7)


### 3.1 What is the purpose of function f2? Write in comments below.

## f2 returns TRUE if x is a multiple of y (x is divisible by y, the remainder of x/y is 0), FALSE otherwise
### 3.2
# Based on the definition of the mean from today's lecture, write a function that calculates the mean of all of the elements of a vector. assign it to the object my.mean. You will find the functions 'sum' and 'length' useful here.

my_mean <- function(x) sum(x)/length(x)

# compare your function to the native function in R. Does it produce the same results?

my_mean(ex_vector)
mean(ex_vector)

####################################
####      Randomness in R       ####
####################################

# There are several ways to generate randomness in R. The simplest function is 
?sample
sample(100.3)
#which randomly draws WITHOUT replacement from a specified vector. For example, to choose a number at random between 1 and 10:
sample(1:10, 1)
# You can run this several times and notice that you get a different answer each time. You can also sample several times at once
sample(1:10, 3)
# However, by default, sample won't let the same number repeat when you do this. This is called sampling without replacement, 
# because it is as if, each time you pick out a number, it is now gone from the pool of possible numbers and has not been replaced.
# If you want to sample randomly between 1 and 10 20 times, each time choosing between all 10 numbers, you have to write:
sample(1:10, 20, replace = TRUE)

### 4.1
# Write a function that simulates the roll of 2 6-sided dice, where the argument x is the number of times you roll the 2 dice, 
# and the output is a vector of length x, where each element corresponds to the sum of the two sides of the dice.
# HINT: one way to do this is to start by writing a function for a single 6-sided die, then create a new function 
# that repeats the first function twice and adds up the result.

cast_die <- function(x){
  sample(1:6,x,replace=TRUE)
}

cast_2_dice <- function(x){
return(cast_die(x)+cast_die(x))
}

cast_2_dice(20)

### 4.2
# Using the function hist, create histograms of the results of double dice rolls when you roll them 10 times, 
#then 50, then 100, then 1000, then 10000. Use breaks=1:12 as an argument within the hist function. 
# What do you notice? Write it in comments below your code.

set.seed(105)
hist(cast_2_dice(10),breaks=1:12)
hist(cast_2_dice(50),breaks=1:12)
hist(cast_2_dice(100),breaks=1:12)
hist(cast_2_dice(1000),breaks=1:12)
hist(cast_2_dice(10000),breaks=1:12)

## The more dice we roll, the more the histogram looks like the probability mass function derived in class

# Another way to generate randomness is to sample from a pdf, which is a continuous distribution. 
# The simplest pdf is the uniform function. The uniform function is a flat line bounded between 2 numbers. 
# Because it is flat, the probability of drawing a sample from any interval of given width between the two bounds 
# is the same as from any other interval of given width.

# The function runif(n, min,max) samples n times from a uniform function bounded between the values of min and max.
# For example, try
runif(5,0,1)

### 4.3
# Using runif, write a function that returns TRUE 22% of the time and FALSE 78% of the time
generate_bool22 <- function(x){
  s <- runif(x,0,1)
  return(s<0.22)
}

o1 <- generate_bool22(10)
hist(as.numeric(o1))
o2 <- generate_bool22(1000000)
hist(as.numeric(o2))
### 4.4
# Based on today's lecture about pdfs, what is the probability density for a uniform pdf bounded between 
# 0 and 1 associated with all values of x between 0 and 1? Explain why.

# Answer: 1, because the total area under the curve must equal one, and the non-zero values of x must be in the interval [0,1], which is of length 1, so the y-axis value must also be 1 for these values of x in order for the rectangle to have area 1.

### 4.5
# Similarly, what is the probability density for a uniform pdf bounded between 5 and 6 associated with all values of x between 5 and 6?

# Answer: 1. Same reason as before since the length of the interval is 1.

### 4.6
# What is the probability density for a uniform pdf bounded between 0 and 0.5 associated with all values of x between 0 and 0.5?

# Answer: 2. Since the width of the interval is now 0.5, the height of the rectangle must be 2 for the area (height*width) to be equal to 1. 

### 4.7
# What is the probability density for a uniform pdf bounded between 0 and 2 associated with all values of x between 0 and 2?

# Answer: 0.5. Since the width of the interval is now 2, the height of the rectangle must be 0.5 for the area to be equal to 1.

### 4.8
# run the following code:
dunif(0.5,0,1)
dunif(2,0,1)
dunif(0.2,0,0.5)
dunif(1.3,0,2)

# Based on the results of this code and your answers above, what can you conclude about the purpose of the dunif function?

# dunif returns the probability density of the uniform distribution, where the first argument is the value of x to evaluate the pdf, and the second and third arguments are the lower and upper bounds of the uniform distribution.

x_values <- seq(-5,+5,0.01)
y_values <- dunif(x_values,0,1)

plot(x_values, y_values,type='l', ylim=c(0,5))

###################################
###################################
########                   ########
########   Data Science 2  ########
########       Lab 2       ######## 
########  14th Oct. 2025   ########
########                   ########
###################################
###################################


# Welcome to lab number 2. Let's learn some new R concepts.

########################
####  1. Matrices   ####
########################

# In R, a MATRIX is a vector that has folded onto itself into a series of rows and columns. You can construct one from a normal vector:
matrix(1:9, nrow = 3)

# By default matrices get filled column by column, as you can see from the output. To fill them row by row instead, change the argument brow to TRUE:
matrix(1:9, byrow = T, nrow = 3)

# Now is a good time to point out that R will automatically read T as TRUE and F as FALSE, which can be a time-saver.

# Let's define 3 vectors. Each one represents the box office numbers from the first three Star Wars movies. 
# The first element of each vector indicates the US box office revenue,
# the second element refers to the Non-US box office.

# Box office Star Wars (in millions!)
new_hope <- c(460.998, 314.4)
empire_strikes <- c(290.475, 247.900)
return_jedi <- c(309.306, 165.8)

# Create box_office vector
box_office <- c(new_hope, empire_strikes, return_jedi)

# Construct star_wars_matrix
star_wars_matrix <- matrix(box_office, byrow = T, nrow = 3)
star_wars_matrix

# we can give matrices rownames and column names

rownames(star_wars_matrix) <- c("A new hope", "The empire strikes back", "Return of the Jedi")
colnames(star_wars_matrix) <- c("US revenue", "International revenue")
### 1.1
# Some important base R functions to know: colSums, rowSums, colMeans, rowMeans
# Use one of the above functions to calculate the total revenue for each movie (the sum of the US and international revenue)
# and save it in an object called total_revenue

total_revenue <- rowSums(star_wars_matrix)

# We can now add this vector as a new column using the function cbind (column bind)

star_wars_matrix <- cbind(star_wars_matrix, total_revenue)

### 1.2
# Rename the 3rd element of the column names of star_wars_matrix to "Total revenue"

colnames(star_wars_matrix)[3] <- 'Total revenue'

# Now lets create vectors for the box office returns of the prequel trilogy



# add a column for total revenue using rowSums,
prequel_matrix <- cbind(prequel_matrix, rowSums(prequel_matrix))
# add row names. (You can ignore the column names since that has been added already for star_wars_matrix)
rownames(prequel_matrix) <- c("The Phantom Menace", "Attack of the clones", "Revenge of the Sith")
# Append prequel_matrix to star_wars_matrix using the function rbind (row bind)
star_wars_matrix <- rbind(star_wars_matrix, prequel_matrix)

# Matrices are understood by R to be both one-dimensional, because they are vectors folded onto themselves
# into columns, but also 2 dimensional, because they have rows and columns. 
# So you can index them like this:
star_wars_matrix[9]

# but also like this
star_wars_matrix[3,2]

# When you put a comma in between square brackets, you are indexing both the rows (to the left of the comma),
# and the columns (to the right of the comma).

### 1.4 
# Write a line of code to extract the total revenue of the Phantom Menace (the 4th movie) using numbers to index the matrix
star_wars_matrix[4,3]

# Compare this to the following:
star_wars_matrix["The Phantom Menace", "Total revenue"]

# This works because our matrix has row and column names.

# If you try to include a comma in the index of a one-dimensional object (like a vector),
# you get an error message:
new_hope[1,2]

# If you leave a blank space either to the left or the right of the comma, you select for ALL the rows
# or ALL the columns, respectively
star_wars_matrix[,2]
star_wars_matrix[4,]

# Just like multiplying 2 vectors of the same length together will multiply each of the corresponding elements
# the same will work with 2 matrices of the same dimensions

star_wars_matrix[1:3,] * star_wars_matrix[4:6,] 

# But for matrix multiplication (the kind used in linear algebra), you must use %*%

#####################
####  2. Lists   ####
#####################

# Lists are extremely useful objects in R. 
# With a list, you can save lots of different objects into one object.

my_list <- list(c("red,green"), 1:5, FALSE, matrix(1:9,3,3))
my_list
my_list[3]

# You can even have lists inside of lists, recursively
my_list_2 <- list(my_list,c("Hello","World"))
my_list_2

# You cane name the elements of a list with names()
names(my_list) <- c("colours","digits","boolean","matrix")
my_list

# and you can access each element of a list with the $ operator
my_list$boolean

### 2.1
# Using the $ operator, replace the "matrix" element of my_list with the star_wars_matrix

my_list$matrix <- star_wars_matrix

# Finally, you can turn any list into a vector with unlist().   
unlist(my_list)

# If the classes of each of the elements are different, it will automatically convert them all 
# to the 'character' class so they are all compatible

###########################
#### 3.  Data frames   ####
###########################

# Data frames are also 2-dimensional objects, with rows and columns.
# However, data frames are not, like matrices, single vectors folded onto themselves.O
# Instead, they are special kinds of list, where each element of the list is a vector 
# of the same length, but possibly of different classes, each of which is a column of the
# data frame.

# Most data you will work with in R will be in a data frame. 
# Lets load one that comes automatically with your R installation:

data("iris")
class(iris)

# just like with functions, we can learn about these in-built data frames with the ? sign
?iris

# but even when this information isn't at hand, we can run:
str(iris)
head(iris)
summary(iris)

# which each give you different information about the data frame.

# Just like lists, you can call each column using the $ operator
iris$Species

# Let's do some basic data visualization in R:
# First, a histogram
hist(iris$Sepal.Length)
# Next, a scatterplot
plot(iris$Petal.Length,iris$Petal.Width)


###############################
#### 4.  More Randomness   ####
###############################

## SETTING THE SEED
# Remember this?
sample(1:100,1)
sample(1:100,1)
sample(1:100,1)

# Those of you with background in computer science or data science probably know
# that true randomness doesn't really exist in comupters. Instead, the appearance of randomness
# is created by generating a different 'seed' number at every different point in time
# often generated by the actual internal clock of the computer
# and basing all 'random' sampling from this seed.
# As a result, we can set our own seed and generate our own randomness:

set.seed(123)
sample(1:100,1)

# You got 31, right? Run it again and see:

set.seed(123)
sample(1:100,1)

# Any time we want to make sure we get the same results as one another despite having some
# element of random sampling in out code, we will set the seed to be the same.

## RANDOM DISTRIBUTIONS 

# Remember the formula for the Binomial distribution:
# 𝑷(W=k) =  𝒑^𝒌∗(𝟏−𝒑)^((𝑵−𝒌) )∗(𝒏¦𝒌)
# Where (𝒏¦𝒌)=  𝒏!/𝒌!(𝒏−𝒌)!

### 4.1
# Write a function to calculate the probability of exactly k successes
# out of n attempts each with probabiliy p of success,
# where n, k and p are arguments of the function
# To do this you will need to use either the factorial() function
# or the choose() function
my_func <- function(n,k,p){
  # Both lines of code work (you only need one)
  # (p^k)*((1-p)^(n-k))*(factorial(n)/(factorial(k)*factorial(n-k)))
  (p^k)*((1-p)^(n-k))*(choose(n,k))
}
# use your function to calculate the probability that when the aliens send 10 probes to Earth (probability of water = 0.7),
# exactly 8 of those probes will send a signal of water
my_func(10,8,0.7)
# compare this to dbinom(8,10,0.7)
# using dbinom gives the same answer.

### PROBABILITY FUNCTIONS IN R 
# dbinom, dnorm, dunif, dbeta, .... all of these functions calculate f(x) for any given x
# for each of their relative distributions
# in other words, they calculate probability MASS or probability DENSITY for each of
# these distributions

# rbinom, rnorm, runif, rbeta, .... all SAMPLE from these respective distributions,
# i.e. they generate random draws of x in proportion to their respective f(x) in these distributions.

# pbinom, pnorm, punif, pbeta, .... all calculate the area under the curve of a given distribution,
# in the LOWER tail (if lower.tail=TRUE, by default), or the UPPER tail (if you set it to false)

# So for example, if a person of 195 cm was drawn from a gaussian distribution of heights,
# with mean 175cm and standard deviation 10cm, What percentile would they be in?
pnorm(195, 175, 10, lower.tail=FALSE) # 0.023
pnorm(195, 175, 10, lower.tail=TRUE) # 0.977
# They would be in the UPPER 2.3 percentile (the saΩme as saying 97.7 percentile). 
# However you want to phrase that for your audience to understand

# qbinom, qnorm, qunif, qbeta, .... all calculate value of x for which
# the area under the curve of a given distribution in the lower tail 
# is equal to the given number

# For example, in a Gaussian distribution of people's heights with mean 175cm and standard deviation 10cm,
# How tall is someone in the BOTTOM 10th percentile? 
# 10th percentile means 10% (0.1)
qnorm(0.1, 175, 10)


# In the UPPER 10th percentile?
qnorm(0.9, 175, 10)
# Compare this to:
qnorm(0.1,175, 10, lower.tail=FALSE)

# NB: UPPER, TOP => right side of the MEAN; LOWER, BOTTOM => left side of the MEAN


# Exercises:
# 4.2. In the country of Examplia, it is known that people's heights are precisely normally distributed,
#    with a mean of 170cm and a standard deviation of 15cm.
#    Amir is 194cm tall. In what height percentile of the population is he? Round to the nearest integer number.
#    (Remember: 1st percentile = shortest 1 percent of the population, 99th percentile: tallest 1 percent of the population)

pnorm(194,170,15) # 0.945 => 94.5 percentile (UPPER 5.5%)


# 4.3. A group of Examplians start a club called the Tall and Short Club (TSC), where you have to be in the tallest 2.5% of the population 
#    OR the bottom 2.5% of the population in height to be let in. 
#    How tall or how short do you have to be to be accepted into the TSC? Would Amir be accepted?

# Remember our values range from the lowest (shortest) to the highest (tallest)
qnorm(0.025,170,15) # 140.6 => BOTTOM 2.5%
qnorm(0.975,170,15) # 199.4 => UPPER 2.5%
# No, Amir wouldnt be accepted because he is 194cm tall which is less than 199.4cm and greater than 140.6cm

# 4.4. In response to the Tall and Short club, another group of Examplians start the Average People's Club (APC), where you have to be
#    within 0.1 standard deviations from the mean in height in order to get in.
#    What is the range of heights acceptable to join the APC? What percentage of the total population is eligible to join?

# standard deviation is 15cm. 0.1 means 10% of the standard deviation which is 1.5cm (0.1*15cm)
# mean is 170cm. Add and substract 1.5cm from 170cm
# You get 168.5 - 171.5 as the range of heights for APC members

# percentage of the population who are APC members?
pnorm(171.5, 170, 15) - pnorm(168.5, 170, 15) # 0.008 = 8%
# This also works because the pnorm function has default values set for the mean and sd
# for a standard normal distribution (values are between 0 and 1)
# pnorm(0.1, mean=0, sd=1)
pnorm(0.1) - pnorm(-0.1) #0.08

# 4.5. If we selected 10 Examplians at random from the population, what is the probability that none of them are eligible to join either
#    the TSC or the APC? 

# probability of being eligible for either TSC or APC:
# For TSC, we have TOP 2.5 (tallest) and BOTTOM 2.5 (shortest)
# So % for TSC is 2.5+2.5 = 5
# For APC, % is 8%
# % for either TSC or APC (remember a person cant be a member of both groups)
5+8 # 13 %

# probability of 0 out of 10 people being eligible:
# k=0, n=10, p=0.13
0.13^0 * (1-0.13)^10 * choose(10,0) # 25 %
# or use
dbinom(0,10,0.13)

# 4.6. What is the probability that exactly 2 are eligible to join the APC and the rest are not?
# k=2, n=10, p=0.13
dbinom(2,10,0.08) # 14.7%

# 4.7. What is the probability that AT LEAST 3 of them are eligible to join the TSC?
# k=[3,4,5,6,7,8,9,10], n=10, p=0.13
sum(dbinom(3:10,10,0.05)) #1.15%
# or find the cumulative probality for AT MOST 2, then subtract from 1
1 - pbinom(2,10,0.05)
# take not of the different functions used
# spend time understanding what the different functions do

###################################
###################################
########                   ########
########   Data Science 2  ########
########       Lab 3       ######## 
########  21st Oct. 2025   ########
########                   ########
###################################
###################################

## Welcome to Lab #3. We will introduce a couple of new concepts here before reviewing examples from the lecture.


#############################
####   1. If statements  ####
#############################

# The if() function will execute everything after it, either on the same line or in {} brackets,
# only if there is a TRUE boolean statement within the parentheses
x <- 5

if(x > 3) print ('This statement is true')

if(x-4==1){
  new_object <- c('this','statement','is','also','true')
  print(new_object)
}

### 1.1
# Write a function called probe, that takes two arguments, n and pw.
# The function should return a character vector of length n, consisting of 'Water' and 'Land', sampled with probability pw. (so probability of sampling 'Water' is w)
# If the pw argument is not numeric, or if it is not between 0 and 1, the function should return the following message:
# "Please input a probability between 0 and 1"

probe <- function(n,pw){
  if(is.numeric(pw) && pw >= 0 && pw <= 1){ # all 3 conditions must check to return vector
    return(sample(c('Water','Land'),n,replace=TRUE,prob=c(pw,1-pw)))
  }else{
    return('Please input a probability between 0 and 1')
  }
}

probe <- function(n,pw){
  if(!is.numeric(pw) || pw < 0 || pw > 1){ # only 1 condition is enough to raise error
    return('Please input a probability between 0 and 1')  
  }else{
    return(sample(c('Water','Land'),n,replace=TRUE,prob=c(pw,1-pw)))
  }
}

# After the if statement we can put an else statement:
if(x-4>1){
  new_object <- c('this','statement','is','also','true')
  print(new_object)
}else{
  print('This is untrue')
}

# A simplified version of if()else is the following:
ifelse(x/2==7,print('Definitely true'),print('categorically false'))

##################################
#### 2.  Paste and strsplit   ####
##################################

# paste() and strsplit() can be used to join and separate
# character objects (strings), respectively. For example:

paste('Hello','world!', sep='_')
strsplit('Hello to you too. /My name is Ed.', split='/')

# You'll notice that strsplit returns a list. This allows us to vectorise the function:
data(mtcars)
rownames(mtcars)
strsplit(rownames(mtcars),split=' ')

# paste0() is a simplified version of paste() where sep = ""
paste0('All','of','these','words','are','squished','together')
()
#####################
####  3. Loops   ####
#####################

# Loops are algorithms that repeat a procedure over and over until they are instructed to stop.
# There are two main kinds:
# FOR loops iterate over a predetermined set (vector, list, etc)
fruits <- c('apple','banana', 'pineapple','mango','orange')
for(i in fruits){ # it doesn't matter that we use the letter i here. It could be anything. It serves as a placeholder that represents the elements of the vector or list that we are iterating over.
  print(paste('My favourite fruit is',i,sep=': '))
}
useless_function <- function(n){
  for (i in 1:n){
    print(paste0(i,'. This number is: ', c('even','odd')[i%%2 +1]))
  }
}
useless_function(7)
1%%2

### 3.1 
data(iris)
# Write a for loop that iterates over the column names of the iris dataset and print each together with the number of characters in the column name in parenthesis. 
# Example output: Sepal.Length (12). To get the number of characters use the function nchar().

for(i in colnames(iris)){
  print(paste0(i,' (',nchar(i),')'))
}


# Next, WHILE loops continue to loop until the boolean statment in the defining parentheses, e.g.
x <- 0
while(x<100){
  print(x)
  x <- x+sample(1:20,1)
}

### 3.2 How many numbers do you need in the sequence 1*2*3*4*5*... before the product exceeds 10 million?
# Use a while loop to get the answer
i <- 1
n <- 0
while (factorial(i)<=1e7){
  n <- n+1
  i <- i+1
}
print(n)
# 11! exceeds 10 million wheras 10! does not. so you need 10 numbers



# 4. Null hypothesis testing, examples:

### 4.1
# The aliens send 20 probes to an unknown planet.
# 11 of them signal Water, the rest signal Land
# They want to know if this planet could possibly be Earth
# Their main astronomer thinks it is unlikely, as Earth has 70% water
# and less than 60% of the probes signalled water
# She asks the statistician: if this planet IS Earth,
# what is the probability that the probes would have returned
# this few Water signals (or fewer).
# Using rbinom(), simulate 100,000 universes where the aliens sent out 20 probes to Earth
# and calculate in what percentage of these universes the number of probes signalling Water is 11 or fewer
# What do you conclude to the astronomer?

# simulate 100k times
simulations <- rbinom(1e5, 20, 0.7)
# find the mean of simulations with at most 11 out 20 successes
p <- mean(simulations <= 11) # 0.1142 or 11%
print(p)

# h0: this planet is unlikely Earth
# let's choose 5% as our significance value (alpha). It can 10% or 1%.
# we reject h0 if p is >= alpha, else we fail to reject h0 if p < alpha.
# If this planet is Earth, there is 11% chance that the probes would have 
# returned 11 or fewer water signals
# since 11% > 5%, we cannot rule out that this planet is Earth
# hence, we reject h0

### 4.2
# Let's answer the question from the lecture: Based on our sample of men and women's heights,
#  can we conclude that men are significantly taller than women?

# Write in the numbers from class
# here is the height data we gathered from class
men_heights <- c(174,170,190,182,170,179,188,178,168,188,170,179,170,173)
women_heights <- c(163,177,158,155,170,157,169,170,160,170,156)

# To do this, we are going to write out own Welch's t-test function.
# This function takes as inputs any 2 samples x1 and x2
my_t <- function(x1,x2){
  # first, extract the means, variances and Ns of the two samples and save them to
  n1 <- length(x1)
  m1 <- mean(x1)
  s1 <- sd(x1)
  n2 <- length(x2)
  m2 <- mean(x2)
  s2 <- sd(x2)
 
  # next, calculate the average standard deviation using the formula shown in the class on slide 33:
 
  s <- sqrt(s1^2/n1 + s2^2/n2)

  # next, calculate the t-statistic, again as shown on slide 33
 
  t <- (m1-m2)/s
 

  # next, calculate the degrees of freedom (again see slide 33)
  # make sure you use parentheses correctly here
 
  df <- (s1^2/n1 + s2^2/n2)^2/((s1^2/n1)^2/(n1-1) + (s2^2/n2)^2/(n2-1))
 
  # next, calculate the probability that the t-statistic would be greater than the absolute value of the t-statistic that you calculated if the TRUE difference between the groups was 0
  # to do this, you can use function pt
  p_value <- pt(abs(t), df=df, lower.tail = F)*2

  # Now we return everything we have calculated as a list:
  return(list(t = t, df = df, p_value=p_value))
  }


# compare this function to the in-built t-tests
t.test(men_heights, women_heights)
my_t(men_heights, women_heights)

# One last question to ponder before next class: Why did we multiply the p-value by 2?

# Answer: Because we are doing a two-tailed test, i.e. we care about the test statistic being greater in magnitude in either direction

###################################
###################################
########                   ########
########   Data Science 1  ########
########       Lab 4       ######## 
########  5th Nov. 2023    ########
########                   ########
###################################
###################################

## Welcome to lab #4. Today we will start with an introduction to base R plotting and ggplot2

########################
####    Factors     ####
########################

# Factors are another data class in R.
# Factors are used for categorical data. Instead of just allowing any value, like a character variable, 
# factors only allow one of a fixed number of 'levels', with one level serving as a 'reference category'.
# Instead of storing the character values of the levels, factors store integers that correspond to the level, 
# along with a key connecting each integer to the corresponding character value.

# This is mostly used in plotting, to determine the order of a group of categories, and for statistical analysis.

# To change the reference category, you can use 
# x <- relevel(x, ref=...)

# And to change the order of the categories, you can use
# x <- factor(x, levels=...)

# For now, just bear in mind that sometimes in certain statistical packages, character variables will need to be recoded as factors using factor(),
# and other times variables that shouldn't be factors get loaded as such and need to be changed back with as.character().

########################
####    Formulas    ####
########################

# Formulas are objects used in graphs and statistical models
# Formulas can be thought of like equations, with a ~ where the = sign should be.
# These equations take the form y ~ f(x)
# Where y is the outcome variable, and the x variables are the predictor variables.
# The variable on the left gets plotted on the y axis and the variable on the right on the x axis.

########################
####    Datasets    ####
########################

# R contains a number of inbuilt datasets
# To see a list of them, run
data()

# To load one into your environment, run for example



########################
####    Plotting    ####
########################

# Base R has a lot of good functions for plotting, and can be very powerful.

# run the following:
example("plot")
# to get a series of examples of things you can do with the plot() function

# Plot() is the most basic function, and with no arguments it creates a scatterplot.
# it can either take an x variable and a y variable as its 2 first arguments
plot(mtcars$wt,mtcars$mpg)
# where the first argument is plotted on the x axis

# or it can take a formula:
plot(mtcars$mpg~mtcars$wt)
# where the element on the right is plotted on the x axis.

# You can change the shape of the points in a scatterplot with the 'pch' argument
plot(mtcars$wt,mtcars$mpg, pch=20)
# There are 25 preset values for the scatterplot points. To see them all run:
plot(1:25,rep(1,25),pch=1:25)

# You can also put in any symbol you like in quote marks:
plot(mtcars$wt,mtcars$mpg, pch="$")



# To change x axis and y axis labels, and add a title you can use
plot(mtcars$wt,mtcars$mpg, pch=20, xlab='Weight (1000 lbs)', ylab='Fuel efficiency (mpg)', main='Association between car weight and fuel efficiency')

# And to change the range of the plot, use
plot(mtcars$wt,mtcars$mpg, pch=20, ylim = c(0,40), xlim = c(0,7))

# Instead of a scatterplot, you can change the type of the plot using 'type'
plot(dnorm(seq(-4,4,0.2)),pch=20)


plot(dnorm(seq(-4,4,0.2)),type='h')
plot(dnorm(seq(-4,4,0.2)),type='b')
plot(dnorm(seq(-4,4,0.2)),type='s')
plot(dnorm(seq(-4,4,0.2)),type='o')

# And the color using color
plot(dnorm(seq(-4,4,0.2)),type='o', col='red')

# For colors you can use preloaded R colors, which you can look up here:
# https://www.nceas.ucsb.edu/sites/default/files/2020-04/colorPaletteCheatsheet.pdf

# You can also use hex codes, such as:
plot(dnorm(seq(-4,4,0.2)),type='o', col='#6D1ACF')

########################################
####    Histograms and densities    ####
########################################

# For turning frequencies into histograms or density plots,
# use hist() and density() 
# Example 1: histogram of a numeric variable
hist(mtcars$mpg)

# Example 2: change color, axis labels, and add title
hist(mtcars$mpg,
     col = "lightblue",
     xlab = "Miles per gallon (mpg)",
     main = "Distribution of fuel efficiency")

# Example 3: add a density curve on top of a histogram
hist(mtcars$mpg, col = "gray", probability = TRUE,
     main = "Fuel efficiency with density curve")
lines(density(mtcars$mpg), col = "#972d2dff", lwd = 2)


# For barplots and boxplots, we use barplot() and boxplot()

# Example 1: simple barplot of counts by cylinder number
barplot(table(mtcars$cyl),
        col = "lightcoral",
        xlab = "Cylinders",
        ylab = "Number of cars",
        main = "Cars by cylinder count")

# Example 2: horizontal barplot
barplot(table(mtcars$gear),
        horiz = TRUE,
        col = "steelblue",
        main = "Cars by number of gears")

# Example 3: boxplot of a continuous variable by a categorical variable
boxplot(mpg ~ cyl, data = mtcars,
        col = c("orange", "skyblue", "lightgreen"),
        xlab = "Cylinders",
        ylab = "Miles per gallon",
        main = "Fuel efficiency by cylinder count")

# Example 4: multiple boxplots for comparison
boxplot(mpg ~ gear, data = mtcars,
        col = "plum",
        main = "Fuel efficiency by number of gears")

# Axes can be removed from the original plot using xaxt='n' and yaxt = 'n'
# New axes can be added using the axis() function
# text(), segments(), arrows(), polygon(), legend(), add these respective elements to your plot. 
# Experiment with them or run ?text, ?segments, etc. to find out more.

########################
####    Legends    ####
########################

# Legends are used to explain the meaning of colors, symbols, or line types in a plot.
# The basic function is:
# legend(x, y, legend, col, pch, lty, bty, ...)

# - x and y specify where the legend goes.
#   You can give numeric coordinates (like 5, 30)
#   or use keywords like "topright", "topleft", "bottomright", etc.
# - legend is a vector of labels that will appear in the legend.
# - col, pch, lty specify the same plotting characteristics used in your plot.
# - bty controls whether the legend box is drawn ("o" for on, "n" for none).

# Example 1: basic legend for points
plot(mtcars$wt, mtcars$mpg, pch=19, col=ifelse(mtcars$am==1, "#9586ceff", "#f09595ff"),
     xlab="Weight", ylab="MPG", main="Manual vs Automatic cars")
legend("topright", legend=c("Manual", "Automatic"),
       col=c("#9586ceff", "#f09595ff"), pch=19)

# Example 2: line legend
x <- seq(0, 2*pi, 0.1)
plot(x, sin(x), type="l", col="blue", lwd=2, ylim=c(-1.5,1.5),
     main="Sine and Cosine")
lines(x, cos(x), col="red", lwd=2)
legend("bottomleft", legend=c("sin(x)", "cos(x)"),
       col=c("blue","red"), lty=1, lwd=2, bty="n")

# Example 3: combined lines and points
data(pressure)
plot(pressure$temperature, pressure$pressure,
     type = "b", pch = 19, col = "darkred",
     xlab = "Temperature (°C)",
     ylab = "Pressure (mm Hg)",
     main = "Vapor pressure of mercury")
lines(pressure$temperature, pressure$pressure / 2,
      type = "b", pch = 17, col = "steelblue")
legend("topleft", legend = c("Observed", "Half pressure"),
       col = c("darkred", "steelblue"),
       pch = c(19, 17), lty = 1, bty = "n")



# Fonts can be changed using the arguments cex (for size), family (for font type), and font (for bold or italics)

# Lines can be added to plots using abline()
plot(mtcars$wt,mtcars$mpg, pch=20, ylim = c(0,40), xlim = c(0,7),
     abline(v=0,h=0,lm(mpg~wt,data=mtcars)))

# Other plots can be made using pie(), dotchart(), stripchart()...

# Example 1: pie chart
counts <- table(mtcars$cyl)
pie(counts,
    col = c("lightblue", "lightgreen", "lightpink"),
    main = "Proportion of cars by cylinder count")

# Example 2: dotchart
dotchart(mtcars$mpg,
         labels = rownames(mtcars),
         cex = 0.7,
         main = "Fuel efficiency (mpg) by car",
         xlab = "Miles per gallon")

# Example 3: stripchart
stripchart(mtcars$mpg ~ mtcars$cyl,
           method = "jitter",
           pch = 19,
           col = c("#e77676ff","#6cdf68ff","#dfd368ff"),
           xlab = "Cylinders",
           ylab = "Miles per gallon",
           main = "Fuel efficiency by cylinder count")
legend ("topright", legend = c("4 cylinders", "6 cylinders", "8 cylinders"),fill = c("#e77676ff","#6cdf68ff","#dfd368ff"))
#######################
####    Devices    ####
#######################

# When you create a plot, it gets stored to a graph device. This gets opened automatically when you plot, and in Rstudio is displayed on one of the panes.
# You can also open a graphics device manually using quartz() on Mac and Linux and windows() on Windows

# The par() function sets the graphical parameters for the device.
# You can use it to set the margins of the graph (in inches) using mar
par(mar=c(5,5,5,5))
plot(mtcars$wt,mtcars$mpg)

# These parameters will remain attached to the graphical device until you turn them off, with:
dev.off()

# par() can be used to generate multiple plots in the same device with the argument mfrow
# mfrow takes a vector of 2 numbers, first the number of rows then the number of columns of the plot grid

par(mfrow=c(2,2),mar=c(2,2,1,1))
plot(mtcars$wt,mtcars$mpg, pch='%', col='dodgerblue')
plot(mtcars$wt,mtcars$mpg, pch='e', col='#13fee0')
plot(mtcars$wt,mtcars$mpg, pch='^', col='firebrick')
plot(mtcars$wt,mtcars$mpg, pch='4', col=adjustcolor('black',alpha.f=0.4))
dev.off()

#############################
####    Saving graphs    ####
#############################
 
# You can save graphs directly from your device (in RStudio, you would click on the 'export' button)
# However, this can be annoying if you have to go through the process every time you make a small adjustment to your graph
# Also, there is no guarantee of conistency if you save your graphs manually
# Generally, it is better to save your plots using code
# To do this, you must open a graphical device directly in a file
# There are multiple functions for this, see a list here: https://stat.ethz.ch/R-manual/R-devel/library/grDevices/html/Devices.html

# Example: to save a graph as a .png
# First open your png device, provide the dimensions, and name the file:
png(file="my.example.graph.png",
    width=600, height=450)

# then put all of the code for your graph
plot(mtcars$wt,mtcars$mpg)

# When you are done, close the device with
dev.off()




#########################
#### EXERCISES — SOLUTIONS ####
#########################

## 1. Scatterplots
# a) Basic scatterplot
plot(mtcars$hp, mtcars$mpg)

# b) Change symbol and color
plot(mtcars$hp, mtcars$mpg,
     pch = 19, col = "darkgreen")

# c) Add axis labels and title
plot(mtcars$hp, mtcars$mpg,
     pch = 19, col = "darkgreen",
     xlab = "Horsepower",
     ylab = "Fuel efficiency (mpg)",
     main = "Relationship between horsepower and fuel efficiency")


## 2. Customizing plots
plot(mtcars$hp, mtcars$mpg,
     pch = 19, col = "darkgreen",
     xlim = c(50, 350),
     ylim = c(0, 40),
     xlab = "Horsepower",
     ylab = "MPG")

# Add mean lines
abline(h = mean(mtcars$mpg), col = "blue", lwd = 2, lty = 2)
abline(v = mean(mtcars$hp), col = "red", lwd = 2, lty = 2)
legend("topright", legend = c("Mean mpg", "Mean hp"),
       col = c("blue", "red"), lty = 2, bty = "n")


## 3. Plot types
x <- seq(-4, 4, 0.1)
plot(x, dnorm(x), type = "l", col = "blue",
     xlab = "x", ylab = "Density",
     main = "Normal distributions with different SDs")
lines(x, dnorm(x, sd = 2), col = "red")
legend("topright", legend = c("SD = 1", "SD = 2"),
       col = c("blue", "red"), lty = 1, bty = "n")


## 4. Axes and annotations
plot(mtcars$wt, mtcars$mpg,
     pch = 19, col = "darkgray",
     xaxt = "n", yaxt = "n",
     xlab = "", ylab = "",
     main = "MPG vs Weight with custom axes")

# Add custom axes
axis(1, at = seq(1, 6, 1))
axis(2, at = seq(10, 35, 5))

# Add text label for lightest car
i <- which.min(mtcars$wt)
text(mtcars$wt[i], mtcars$mpg[i],
     labels = rownames(mtcars)[i],
     pos = 4, col = "blue", cex = 0.9)


## 5. Multiple plots on one device
par(mfrow = c(1, 3), mar = c(4, 4, 2, 1))

plot(mtcars$wt, mtcars$mpg, pch = 19, col = "darkorange",
     xlab = "Weight", ylab = "MPG")
plot(mtcars$hp, mtcars$mpg, pch = 17, col = "steelblue",
     xlab = "Horsepower", ylab = "MPG")
plot(mtcars$disp, mtcars$mpg, pch = 15, col = "seagreen",
     xlab = "Displacement", ylab = "MPG")

dev.off()  # reset device


## 6. Barplots and boxplots
# a) Barplot of car counts by cylinder
counts <- table(mtcars$cyl)
barplot(counts, col = "tomato",
        xlab = "Cylinders", ylab = "Number of cars",
        main = "Number of cars by cylinder count")

# b) Boxplot of mpg by cylinder
boxplot(mpg ~ as.factor(cyl), data = mtcars,
        col = "lightblue",
        xlab = "Cylinders", ylab = "MPG",
        main = "Fuel efficiency by cylinder count")


## 7. Saving plots
png(file = "cars_by_gears.png", width = 700, height = 500)
barplot(table(mtcars$gear),
        col = "darkgoldenrod",
        xlab = "Number of gears", ylab = "Number of cars",
        main = "Cars by number of gears")
dev.off()


## 8. Creative exercise
# Example: visualizing engine size and efficiency by transmission type
par(mar = c(5, 5, 4, 2))
plot(mtcars$disp, mtcars$mpg,
     pch = ifelse(mtcars$am == 1, 19, 1),
     col = ifelse(mtcars$am == 1, "blue", "red"),
     xlab = "Displacement (cu. in.)",
     ylab = "Fuel efficiency (mpg)",
     main = "Engine size vs fuel efficiency\nBlue = manual, Red = automatic")
legend("topright", legend = c("Manual", "Automatic"),
       col = c("blue", "red"), pch = c(19, 1), bty = "n")

# Comment:
# Larger engines generally have lower mpg, and manual cars tend to be more fuel-efficient.

###################################
###################################
########                   ########
########   Data Science 1  ########
########       Lab 5       ######## 
########  04th Nov. 2025   ########
########                   ########
###################################
###################################

## ANSWERS to lab #8. 

#####################
####  1. Loops   ####
#####################

# Loops are algorithms that repeat a procedure over and over until they are instructed to stop.
# There are two main kinds:
# FOR loops iterate over a predetermined set (vector, list, etc)
fruits <- c('apple','banana', 'pineapple','mango','orange')
for(i in fruits){ # it doesn't matter that we use the letter i here. It could be anything. It serves as a placeholder that represents the elements of the vector or list that we are iterating over.
  print(paste('My favourite fruit is',i,sep=': ')) 
}

useless_function <- function(n){
  for (i in 1:n){
    print(paste0(i,'. This number is: ', c('even','odd')[i%%2 +1]))
  }
}
useless_function(7)

### 3.1 
data(iris)
# Write a for loop that iterates over the column names of the iris dataset and print each together with the number of characters in the column name in parenthesis. 
# Example output: Sepal.Length (12). To get the number of characters use the function nchar().

for(i in colnames(iris)){
  print(paste0(i,' (',nchar(i),')'))
}


# Next, WHILE loops continue to loop until the boolean statment in the defining parentheses, e.g.
x <- 0
while(x<100){
  print(x)
  x <- x+sample(1:20,1)
}

### 3.2 How many numbers do you need in the sequence 1*2*3*4*5*... before the product exceeds 10 million?
# Use a while loop to get the answer
i <- 1
while (factorial(i)<=10000000){
  i <- i+1
}
i-1




########################
####  2. P-hacking  ####
########################

# 1. THE ICE BATH STUDY
# In 2022 a paper was published in a medical journal that claimed to show 
# that taking ice-cold baths could have health benefits. They asssigned 50%
# of their subjects to the treatment group and received the ice baths
# and 50% to a control group that received no ice cold baths 
# (they could have received warm baths instead, but this study didn't do this)
# The paper abstract boasted that the ice baths had statistically significant (at the 5% level)
# effects on 3 health outcomes (perceived energy levels, mental alertness, probability of catching a cold within 1 week of treatment)
# Looking into the methods section of the paper, we can see that they actually 
# tested 60 different possible health outcomes (physical strength, skin health, blood pressure...)

# Could they have gotten these results purely by chance?

# Let's simulate the cold-water therapy experiment
# 1.1 Start by saving a sample size of 100 to an object N
set.seed(123)
N <- 100

# 1.2 Next, create a vector of 1s and 0s, so that half of your sample receives the treatement (coded 1), and the other half doesn't (coded 0)

treatment <- c(rep(1, N/2), rep(0,N/2))

# Next we will run 60 different t-tests using a for loop, and save the p-value for each of these tests
# 1.3 start by initializing an empty vector for your p-values using an empty c() function. 

p <- c()

# 1.4 Next, write a for loop for a total of 60 loops

for (i in 1:60){
   # For each loop, save a new y-variable that you have sampled completely at random
   # your y-variable should be of length N, but otherwise you can sample it however you like (rnorm,runif,rbinom... any probability distribution you like with any parameter values you like)


   y <- runif(N, 60, 150)
   
   # Next (still within the for loop), run a t-test comparing the y-values corresponding to treatment == 1 with the y-values corresponding to treatment ==0

   test <- t.test(y[treatment==1], y[treatment==0])
   
   # extract the p-value for that t-test and save it to the vector of p-values
   test$p.value -> p[i]
}

# 1.5 After your for-loop is run, calculate the sum of the saved p-values that are less than 0.05
sum(p<0.05)
# 1.6 How many significant results are there at the 0.05 level?

# 2

# 1.7 Run the whole for loop again several times. How many significant results do you find each time?
# 3,4,4,4,2,6,2,5,2
# 1.8 Write a for loop that runs the previous for-loop multiple times, and save the number of significant results you get each time. Run this for loop at least 100 times

n_significant <- c()

for (j in 1:150){

for (i in 1:60){
   y <- runif(N, 60, 150)
   
   test <- t.test(y[treatment==1], y[treatment==0])
   
   test$p.value -> p[i]
}

n_significant[j] <- sum(p<0.05)
}


# 1.9 Plot the histogram of the number of significant results you get for each multiple comparisons experiment. What is the average number?

hist(n_significant)
mean(n_significant) # the average number is 3.047


# 1.10 Run this whole code again, but this time increase the sample size N. Does your histogram look any different? why?

N <- 500

n_significant <- c()

for (j in 1:150){

for (i in 1:60){
   y <- runif(N, 60, 150)
   
   test <- t.test(y[treatment==1], y[treatment==0])
   
   test$p.value -> p[i]
}

n_significant[j] <- sum(p<0.05)
}

hist(n_significant)
mean(n_significant)

# The histograms looks very similar and the mean is still close to 3

# 1.11 Run the code again, but this time instead of counting how many results are less than 0.05, divide this threshold by the total number of comparisons (60).

N <- 100

n_significant <- c()

for (j in 1:150){

for (i in 1:60){
   y <- runif(N, 60, 150)
   
   test <- t.test(y[treatment==1], y[treatment==0])
   
   test$p.value -> p[i]
}

n_significant[j] <- sum(p<0.05/60)
}

# 1.12 What does your new histogram look like?
hist(n_significant)
mean(n_significant)

# There are hardly any significant results, the average proportion of significant results is 0.033

# 1.13 This (dividing the p-value required for significance by the number of comparisons made) is called Bonferroni correction for multiple comparisons.
# Why is it important?

# It's important because otherwise we can almost guarantee significant results by doing lots of tests

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

hist(rnorm(200), breaks=seq(-4,4,0.5))
# is equivalent to

rnorm(200) |> hist(breaks=seq(-4,4,0.5))

# The purpose of the pipe is mostly aesthetic, in particular to avoid large numbers of parentheses when something needs to be transformed using multiple functions:



### 1.1 Rewrite the following expression using pipes:
set.seed(123)
round(sqrt(log(runif(10,1,10))),2)

runif(10,1,10) |> log() |> sqrt() |> round(2)

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
runif(10,1,10) %>% 
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
  filter(cyl==6) %>%
  select(1:5)

### 2.1
# using select() and filter(), create a new database of cars that are over 4000 lbs in weight, retaining only the wt and mpg columns.
# Save this database to an object called 'df'.

mtcars %>%
  filter(wt>=4) %>%
  select(c('wt',mpg)) -> df

# After you have selected the rows and columns you are interested in, you can 
# change the order of the rows using arrange

df %>% arrange(wt)

df %>% arrange(desc(wt))


# To change variables, we can use mutate()
df <- df %>% mutate(wt_kg=wt*453.592,
                    km_per_l = mpg*1.60934/3.78541)

# And we can use ifelse() within mutate()
mtcars <- mtcars %>%
            mutate(wt_class = ifelse(wt>=4, 'Oversized','Standard'))

# We can even do a sultiple ifelse statment using case_when()
mtcars <- mtcars %>%
            mutate(
              efficiency = case_when(
                mpg<=15 ~ 'low',
                mpg>15 & mpg<=20 ~ 'medium',
                mpg>20 ~ 'high'
                ))

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
    wt_kg=mean(wt),
    n=length(hp)
  ) %>%
  arrange(
    c('high','medium','low')
  )

# You can group by multiple variables

mtcars %>% 
  group_by(efficiency,cyl) %>%
  summarise(
    wt_kg=mean(wt),
    n=length(hp)
  )

# After grouping a tibble, remember to ungroup it later using ungroup(), or you may have issues down the line.

# 3.1
data(iris)
# using the dplyr functions do the following:
# create a new column called Petal.Area which is the product of the petal width and petal length columns.
# For each of the different species of iris, present the mean and standard deviation for the sepal length, sepal width, and petal area, as well as the number of samples (n)
# Order this database in decreasing order of average petal length.

iris %>% 
  mutate(Petal.Area = Petal.Length * Petal.Width) %>% 
  group_by(Species) %>% 
  summarise(
    mean_Sepal.Length = mean(Sepal.Length),
    sd_Sepal.Length = sd(Sepal.Length),
    mean_Sepal.Width = mean(Sepal.Width),
    sd_Sepal.Width = sd(Sepal.Width),
    mean_Petal.Length = mean(Petal.Length),
    sd_Petal.Length = sd(Petal.Length),
    mean_Petal.Width = mean(Petal.Width),
    sd_Petal.Width = sd(Petal.Width),
    mean_Petal.Area = mean(Petal.Area),
    sd_Petal.Area = sd(Petal.Area),
    n=length(Sepal.Length)
  ) %>% 
  arrange(desc(mean_Petal.Length)) -> iris


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
# The expected fuel efficiency of a car with an engine displacement of 0 cubic inches is 29.6 miles per gallon​

### 4.2
# Interpret the Estimate value in the disp row.
# An increase in engine displacement of 1 cubic inch is associated with a decrease 
# in fuel efficiency of 0.0412 miles per gallon 


### 4.3 
# Is the relationship between these two variables positive or negative? Why do you think that might be?
# The disp estimate is negative, therefore the relationship is negative. This could be because larger engines 
# are less fuel efficient, or because larger engines tend to be paired with larger cars, which are less fuel efficient.
# There could be other reasons.


### 4.4 What is the predicted average efficiency in miles per gallon of a car with a 200 cubic inch engine?

# 29.6 - 0.0412 * 200 = 21.36 mpg.

# Let's transform the independent variable:
mtcars$disp_centred <- mtcars$disp - mean(mtcars$disp)

### 4.5
# compare the mean and variance of the new variable with the untransformed variable. What do you notice?

mean(mtcars$disp) #  230.7219
mean(mtcars$disp_centred) # ~0

var(mtcars$disp) #  15360.8
var(mtcars$disp_centred) # 15360.8

# The mean goes from 230 to 0 but the variance stays the same

### 4.6
# Run the linear regression again, but this time with disp_centred as the independent variable.
# Interpret the Estimate value in the disp_centred row.
# What is the point of performing this transformation?

model_centred <- lm(mpg ~ disp_centred, data = mtcars)
summary(model_centred)
# The expected fuel efficiency of a car with an engine displacement of 230.7219 cubic inches (the sample mean) is 20.1 miles per gallon​
# The transformation has made the intercept estimate more realistic to interpret.


### 4.7
# 1 cubic inch is 16.4 cubic centimeters
# 1 mile per gallon is 0.425 km/L
# Transform the disp variable so that it is in cubic centimeters instead of cubic inches, then centre it as before
# Transform the mpg variable so that it is in km/L
# Run the regression one final time with the new variables
# Interpret the two parameter estimates.
# What is the predicted average efficiency in km/L of a car with an engine displacement of 6500cc?

mtcars$disp_cc <- mtcars$disp * 16.4
mtcars$disp_cc_centred <- mtcars$disp_cc - mean(mtcars$disp_cc) 
mtcars$kml <- mtcars$mpg * 0.425

model_cc <- lm(kml ~ disp_cc_centred, data = mtcars)
summary(model_cc)

# b0: The expected fuel efficiency of a car with an engine displacement of 3784cc (the sample mean) is 8.54 km/L
# b1: An increase in engine displacement of 1 cc is associated with a decrease 
# in fuel efficiency of 0.0011 km/L

# 8.54 - 0.0011 * (6500 -3784)  = 5.55 km/L
# The expected fuel efficiency of a car with an engine displacement of 6500 cubic centimeters is 5.55 km/L​

### 4.8
# Run the following code:
y <- mtcars$mpg
x <- cbind(1,mtcars$wt)

# A couple of functions for you to know:
# t() returns the transpose of any matrix
# solve() returns the inverse of any (invertible) matrix
# %*% is matrix multiplication

# with that in mind try to code the following expression in R:
# (x'x)^(-1) * (x'y)
# where ' means the transpose
# Run the code you have written. Compare to the regression output from the lecture (lm(mpg ~ wt, data = mtcars))
# What do you find?

solve(t(x)%*%x)%*%t(x)%*%y 
# This gives the parameter estimates of the regression model because it is the formula for the OLS estimator


###################################
###################################
########                   ########
########   Data Science    ########
########       Lab 7       ########
########   2nd Dec. 2025   ########
########                   ########
###################################
###################################

## Welcome to lab #7. Today we will start with an introduction to the ggplot2,
# Then you will write your own lm() function, and finally a couple of exercises

###########################
####     ggplot2      ####
###########################

# ggplot2 is the tidyverse package for data visualisation.
# It is based on the “grammar of graphics”: each plot is built from layers.
# A typical plot consists of:
#   - data
#   - aesthetics (aes)
#   - geometric layers (geoms)
#   - scales
#   - labels
#   - themes

library(tidyverse)

# Example: a simple scatterplot
data(mtcars)
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point()

# Here, the first row of the plot code is a call to the ggplot() function.
# it includes the data argument as well as a call to the aes() function, which defines the global aesthetics for the plot.
# The second row is a call to a specific geom function, specifically geom_point(), which creates a scatterplot.

#############################
####   Aesthetics (aes)  ####
#############################

# aes() defines how variables map to visual properties such as:
# x, y, col (colour), fill (background), size, alpha (transparency), shape, etc.
# Mappings that depend on data should go inside aes().

# Example with shape mapped to a variable:
ggplot(mtcars, aes(x = wt, y = mpg, shape = factor(cyl))) +
  geom_point()

### 1.1
# Create a scatterplot mpg vs wt from the mtcars dataset, with shape mapped to number of cylinders (cyl).
ggplot(mtcars, aes(x = wt, y = mpg, shape = factor(cyl))) +
  geom_point()
### 1.2
# Add an argument to the aes() function so that point size reflects engine displacement (disp).
ggplot(mtcars, aes(x = wt, y = mpg, shape = factor(cyl), size = disp)) +
  geom_point()

#################################
####    Geoms and Layers     ####
#################################

# ggplot builds plots layer by layer using +.
# You can overlay multiple geoms.

# Example: scatterplot with regression line and 97% confidence interval
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(alpha = 0.6) +
  geom_smooth(method = lm, se = TRUE, level = 0.97)


### 2.1
# You can also include aes() functions within individual geoms. If you do so, these aesthetics will override those specified in the first line,
# but will not apply to any other geom.
# Try running the code from above again, but this time add aes(col = factor(cyl)) first to the geom_point layer, then the geom_smooth layer,
# and finally col = factor(cyl) to the aes() function in the base (ggplot) layer.
# What is the difference between these plots?
# in the geom_point layer i had blue and blue,green and red dots,then in the geom_smooth layer i had three lines and black dots and finally three lines in different color and dots in different colors.
### 2.2
# Now change the color of the confidence bands using the "fill" argument in the geom_smooth layer.
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(aes(col = factor(cyl)), alpha = 0.6) +
  geom_smooth(method = lm, se = TRUE, level = 0.97, fill = "red")
### 2.3
# Make a histogram of the wt variable using geom_histogram(). There will be no y aesthetic here!
# Have the color of the bars be a hex colour of your choosing
# #(you can use the colour picker in positron like this: '#FF0000')
# In geom_hist, the outline of the bar is determined by "col" and the fill by "fill".
# Remember, if you aren't mapping a variable to an aesthetic, you don't need to use aes().
ggplot(mtcars, aes(x = wt)) +
  geom_histogram(fill = "#00AFBB", col = "white")

### 2.3
# Make a boxplot of wt by number of cylinders (cyl) using geom_boxplot(). Make it as colourful as you like.
# Think carefully about what you are mapping to x and y here.

# There are many other types of geoms
# E.g. geom_density(), geom_line(), geom_area(), geom_bar(), geom_segment(), geom_hex(), geom_polygon() ...
ggplot(mtcars, aes(x = factor(cyl), y = wt, fill = factor(cyl))) +
  geom_boxplot()
#################################
###    Facets for Subplots    ###
#################################

# Facets divide a plot into multiple subplots.
# facet_wrap(~variable) creates one subplot per category.

# Example:
ggplot(mtcars, aes(wt, mpg)) +
  geom_point() +
  facet_wrap(~ factor(cyl))

### 3.1
# Plot mpg vs wt with a regression line and 99% confidence interval, faceted by am.
# Have different coloursed points, lines, and CI bands for the different transmission types
ggplot(mtcars, aes(x = wt, y = mpg, col = factor(am), fill = factor(am))) +
  geom_point() +
  geom_smooth(method = lm, level = 0.99) +
  facet_wrap(~am)
#################################
####      Customisation      ####
#################################

# Labels, titles, scales and themes help refine your plot.

# Example:
ggplot(mtcars, aes(wt, mpg, col = factor(am))) +
  geom_point() +
  geom_smooth(method = lm, se = TRUE, level = 0.97) +
  labs(
    title = "Automobile weight as a function of fuel efficiency",
    x = "Weight (1000 lbs)",
    y = "Fuel efficiency (miles per gallon)",
    col = "Transmission type (0 = automatic, 1 = manual)"
  ) +
  theme_minimal()

# experiment with different themes!
# eg. theme_bw(), theme_classic(), theme_dark(), theme_light(), theme_minimal(), theme_grey(), theme_void()

##########################
####      Scales      ####
##########################

# Scales are used to change the default colour palettes and axis scales.

# Continuous colour scale
ggplot(mtcars, aes(wt, mpg, colour = hp)) +
  geom_point(size = 3) +
  scale_colour_gradient(low = "#a2e998ff", high = "#0faf01ff")

ggplot(mtcars, aes(wt, mpg, colour = hp)) +
  geom_point(size = 3) +
  scale_colour_gradientn(colours = c("red", "yellow", "green"))

# Discrete fill scale
# Convert cyl to factor for a discrete scale
ggplot(mtcars, aes(factor(cyl), fill = factor(gear))) +
  geom_bar() +
  scale_fill_manual(values = c("#c22727ff", "#25b825ff", "#3535d6ff")) #

# Setting axis limits, labels, and breaks
ggplot(mtcars, aes(wt, mpg)) +
  geom_point(size = 3) +
  scale_x_continuous(
    limits = c(1, 6), # Restrict x-axis range
    breaks = seq(2, 5, 0.5) # Specify tick marks
  ) +
  scale_y_continuous(
    breaks = seq(10, 35, 5),
    labels = paste0(
      seq(10, 35, 5),
      " mpg (",
      seq(10, 35, 5) * 0.425144,
      " km/l)"
    ) # Format y-axis labels
  )

# There's so much more to do...
# You can flip x and y axes with coord_flip()
# You can change the scale of the axes with functions like scale_y_log10() (applies a log 10 scale to the y-axis)
# You can change text size, colour, font...

# This official book is a free resource!
# https://ggplot2-book.org/

# I highly recommend playing around with it.
# If you have an idea for your graph and you don't know how to implement it
# start by looking in the book
# If you can't find it, this is one of the few places where I endorse asking an LLM.

####################################
#### Saving Plots with ggsave()  ###
####################################

# Create a plot and save it
p <- ggplot(mtcars, aes(wt, mpg, colour = factor(cyl))) +
  geom_point(size = 3) +
  theme_minimal()

# Save the last displayed plot
ggsave("plot_default.png")

# Save a specific plot
ggsave("plot_explicit.png", plot = p)

# Save with custom dimensions and DPI
ggsave(
  filename = "plot_custom.png",
  plot = p,
  width = 6, # inches
  height = 4, # inches
  dpi = 300 # resolution
)

# Save as PDF
ggsave("plot.pdf", plot = p)


#######################################################
####    Code your own lm and predict functions!    ####
#######################################################

### 4.1 lm()

# Here I will walk you through the steps needed to write these functions. Follow along with the slides from this week's and last week's lectures - they contain all of the maths and some of the code that you need!

# At each step of the way, you should save each new element you calculate into a new object.

# Your lm function should take as input a y variable, and one or more x variables which should be inputted as a matrix or dataframe with one variable per column.

my.lm <- function(y, x) {
  # Start by saving the sample size (n). You will need it later for calculating degrees of freedom for the test statistics and sampling distributions.
  n <- nrow(as.matrix(x))
  # Next create the X matrix using as.matrix. Don't forget to add the column of 1s!
  x <- cbind(1, as.matrix(x))
  # use the y input and your newly constructed x matrix to calculate the parameter estimates (or coefficients).
  # Hint: see lab 6, and remember that t() gives the transpose of a matrix and solve() gives its inverse
  b <- solve(t(x) %*% x) %*% t(x) %*% y
  # Next, using these calculated coefficients, calculate all of the predicted values, y_hat, for each of the values of x (each of the rows of the X matrix).
  # Hint: look at the formula for the linear model - and remember we are multiplying matrices!
  y_hat <- x %*% b
  # Next, calculate the residuals (actual values of y minus the predicted values y_hat)
  e <- y - y_hat
  # Next calculate the estimate of the residual standard error, s. Careful about the denominator here: check how many degrees of freedom you have!
  k <- ncol(x)
  s <- sqrt(sum(e^2) / (n - k))
  # Using s, calculate the variance covariance matrix of the coefficients.
  vcov_coef <- s^2 * solve(t(x) %*% x)
  # from this covariance matrix, extract the standard errors of the coefficients
  se_coef <- sqrt(diag(vcov_coef))
  # use these standard errors to calculate the t-values for each of the coefficients
  t_vals <- b / se_coef
  # And use these t-values to calculate p-values.
  p <- 2 * pt(-abs(t_vals), df = n - k)
  # Next, calculate the R2 value

  RSS <- sum(e^2)
  TSS <- sum((y - mean(y))^2)
  r2 <- 1 - (RSS / TSS)
  # Bonus points if you want to look up how to calculate adjusted R2
  adj_r2 <- 1 - (1 - r2) * ((n - 1) / (n - k))
  # Next, calculate the F-statistic and the p-value for the model.
  f_stat <- ((TSS - RSS) / (k - 1)) / (RSS / (n - k))
  model_p <- pf(f_stat, df1 = k - 1, df2 = n - k, lower.tail = FALSE)

  # Finally, put all of these elements into a list, and have your function return that list.
  return(list(
    coefficients = b,
    residuals = e,
    fitted.values = y_hat,
    sigma = s,
    vcov = vcov_coef,
    se = se_coef,
    t_values = t_vals,
    p_values = p,
    r_squared = r2,
    adj_r_squared = adj_r2,
    f_statistic = f_stat,
    model_p_value = model_p,
    df = n - k
  ))
}

# compare your function against the built-in R function in R.

lm(mpg ~ wt + cyl, data = mtcars)
my.lm(y = mtcars$mpg, x = mtcars[, c('wt', 'cyl')])

### 4.2 predict()

# This will be much shorter. Create a new function that takes as input the output from your first function, along with a new_data object that has as many columns as there are predictor variables in the model output, and a confidence interval size

my.predict <- function(model_output, new_data, ci_level = 0.97) {
  # Extract coefficients from your my.lm output
  coef = model_output$coefficients
  # Add a column of 1s to the new_data
  new_data = cbind(1, as.matrix(new_data))
  # generate the predicted values of y from the new_data object based on the coefficients from the model
  # Again, remember the formula for the linear model!
  y_hat = new_data %*% coef
  #for each of these predicted values, calculate a confidence interval
  # first calculate the critical levels of the t-distribution using the ci_level and the degrees of freedom
  area_in_tails = (1 - ci_level) / 2
  df_residual <- model_output$df
  t_lower = qt(p = area_in_tails, df = df_residual)
  t_upper = qt(p = 1 - area_in_tails, df = df_residual)
  # next, for each row of the new_data object, calculate the standard error of the predicted value
  # Check the slides, and remember that 𝒗𝒄𝒐𝒗(𝒃) was saved as "vcov" in the model output
  sy = sqrt(diag(new_data %*% model_output$vcov %*% t(new_data)))
  # next, calculate the upper and lower confidence boundaries for each prediction using the critical t-levels and the previously calculated standard error
  ci_lower = y_hat + (t_lower * sy)
  ci_upper = y_hat + (t_upper * sy)
  # finally, put these confidence intervals into a dataframe
  ci = data.frame(lower = ci_lower, upper = ci_upper)
  colnames(ci) <- paste0(ci_level, '%_', c('lower', 'upper'))
  df = cbind(y_hat = y_hat, ci)
  return(df)
}

### Testing it out!
# Use your functions to run the following model
model <- my.lm(y = mtcars$mpg, x = mtcars$wt)

# Then plot predicted marginal effect of weight for a car with 4 cylynders. Add 96% confidence intervals to the grap
x <- seq(0, 6, 0.1)

ci <- my.predict(model, new_data = cbind(wt = x), ci_level = 0.96)

plot(mtcars$wt, mtcars$mpg, pch = 20)
lines(x, model$coefficients[1, ] + x * model$coefficients[2, ])
polygon(
  x = c(x, rev(x)),
  y = c(ci$'0.96%_lower', rev(ci$'0.96%_upper')),
  col = adjustcolor('slateblue', alpha.f = 0.4)
)

# compare this to:
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(method = lm, se = TRUE, level = 0.96)

################################################################################
# Student Name: Celestin Hakorimana
# Course: Data Science 1 - Contest Entry
# Date: Jan 4th, 2026
# File Name: Celestin_Hakorimana.R
# Description: Analysis of Class Promo06 Demographics (Nationality & Gender)
################################################################################
# Load necessary library
install.packages("tidyverse")
library(tidyverse)
install.packages("dplyr")
library(dplyr)
# Dataframe based on the provided class composition
# Counts:
# Morocco: 7 F, 1 M
# Nigeria: 2 F, 11 M
# Rwanda: 2 F, 1 M
# Ghana: 0 F, 1 M
# Ivory Coast: 0 F, 1 M
# creating the vectors for each country.
morocco <- data.frame(
    Nationality = rep("Morocco", 8),
    Gender = c(rep("Female", 7), "Male")
)
nigeria <- data.frame(
    Nationality = rep("Nigeria", 13),
    Gender = c(rep("Female", 2), rep("Male", 11))
)
rwanda <- data.frame(
    Nationality = rep("Rwanda", 3),
    Gender = c(rep("Female", 2), "Male")
)
ghana <- data.frame(Nationality = rep("Ghana", 1), Gender = "Male")
ivory <- data.frame(Nationality = rep("Ivory Coast", 1), Gender = "Male")
# combining data into one dataframe
class_data <- bind_rows(morocco, nigeria, rwanda, ghana, ivory)


# adding Student IDs with three digits  (S001 to S026)
class_data$Student_ID <- sprintf("S%03d", 1:nrow(class_data))

# putting the columns on a specific order
class_data <- class_data %>% select(Student_ID, Nationality, Gender)

# displaying the data structure using str() function.
structure <- str(class_data)
# ##########################################################
# 1. CLASS COMPOSITION
# Question: "How is the class distributed across nationalities,
#            and what is the gender volume within these groups?"
# #########################################################
p1 <- class_data %>%
    count(Nationality, Gender) %>%
    group_by(Nationality) %>%
    mutate(Total = sum(n)) %>%
    ungroup() %>%
    mutate(Nationality = reorder(Nationality, Total)) %>%
    ggplot(aes(x = n, y = Nationality, Total, fill = Gender)) +
    geom_bar(stat = "identity", position = "stack", width = 0.7) +
    geom_text(
        aes(label = n),
        position = position_stack(vjust = 0.5),
        color = "white",
        size = 3,
        fontface = "bold"
    ) +

    # customizing colors for both female and male and giving a titles and captions.
    scale_fill_manual(values = c("Female" = "#008080", "Male" = "#2F4F4F")) +
    labs(
        title = "Class Demographics: Nationality & Gender Breakdown",
        subtitle = "Nigeria and Morocco represent the largest student cohorts with opposing gender dominance",
        x = "Number of Students",
        y = "",
        caption = "Data Source: Class Promo06 Records"
    ) +
    theme_minimal() +
    theme(
        plot.title = element_text(face = "bold", size = 14),
        panel.grid.major.y = element_blank(),
        legend.position = "top"
    )
# saving the graph in png format
ggsave(
    "Graph1_Class_Composition.png",
    plot = p1,
    width = 8,
    height = 5,
    dpi = 300
)
#############################################################
## GRAPH 2: GENDER BALANCE INDEX
## Question: "Which nationalities are driving Female representation
##            in the cohort?" Percentage of Females per Nationality.
#############################################################
p2 <- class_data %>%
    group_by(Nationality) %>%
    summarise(
        Total = n(),
        Female_Count = sum(Gender == "Female"),
        P_Female = (Female_Count / Total) * 100
    ) %>%
    # putting Nationality on the x-axis and the percentage on the y-axis.
    mutate(Nationality = reorder(Nationality, P_Female)) %>%
    ggplot(aes(x = Nationality, y = P_Female)) +
    geom_segment(
        aes(x = Nationality, xend = Nationality, y = 0, yend = P_Female),
        color = "gray50",
        size = 1
    ) +
    geom_point(aes(size = Total, color = P_Female), show.legend = F) +
    # adding the a Line to the graph at 50%  to check which country has passed the parity line.
    geom_hline(
        yintercept = 50,
        linetype = "dashed",
        color = "red",
        alpha = 0.5
    ) +
    annotate(
        "text",
        x = 1,
        y = 52,
        label = "Gender Parity (50%)",
        color = "red",
        size = 3,
        hjust = 0
    ) +
    # adding labels on top of points on every country
    geom_text(
        aes(label = paste0(round(P_Female, 0), "%")),
        vjust = -1.2,
        size = 3.5,
        fontface = "bold"
    ) +
    scale_y_continuous(limits = c(0, 100), labels = function(x) {
        paste0(x, "%")
    }) +
    scale_color_gradient(low = "#2F4F4F", high = "#008080") +
    labs(
        title = "The 'Female-Drive' Index",
        subtitle = "Percentage of Female students per Nationality (Size of bubble = Total Students)",
        x = "",
        y = "Percentage Female",
        caption = "Note: Rwanda and Morocco are the only female-majority cohorts"
    ) +
    theme_classic() +
    theme(
        plot.title = element_text(face = "bold", size = 14),
        axis.line.y = element_blank(),
        axis.ticks.y = element_blank()
    )
# Save the graph as a png file
ggsave(
    "Graph2_Gender_Balance_Index.png",
    plot = p2,
    width = 8,
    height = 5,
    dpi = 300
)

#############################################################
## Data Science 1 Midterm Exams

## Question by Celestin Hakorimana
#############################################################

# 1.a)
barplot(c(2,6,4,6,1,1)/20, names.arg = 1:6, xlab = "Roll", ylab = "Probability", main = "Probability mass function for a die roll")

# 1.b)
values <- rep(1:6, c(2,6,4,6,1,1))
mean(values)
# mean: 3.05
# median: 3
# mode: 2 and 4

sqrt(sum((values - mean(values))^2)/length(values))
# standard deviation: 1.28355

# 1.c) We use a denominator of N rather than N-1 because we are not estimating a population sd from a sample,
# but rather calculating the sd of the PMF which is a distribution.

# 1.d)
# p(5 or 6) = 2/20 = 0.1
# p(5 or 6 at least 2 times out of ten)
1 - pbinom(1, 10, 0.1)
sum(dbinom(2:10,10,0.1)) # both work
# answer: 0.2639

#2. a)
# The perimeter is a linear funcion of the radius so the correlation
# between the two will be exactly 1 with perfect measurement

# 2.b)
# The area is not a linear function of the radius but the will still increase as the radius increases
# Therefore the correlation will be positive but less than 1 (so weaker than the previous answer)

# 3.a)
qnorm(0.95) # = 1.645

# 3.b)
qnorm(c(0.25,0.75)) # +- 0.67449

# 4.a)
data(ToothGrowth)
d <- ToothGrowth

# 4.b)
plot(d$supp, d$len, xlab = "Treatment type", ylab = "Length", main = "Tooth cell length by treatment type (juice or vitamin C)")
# There's actually no info about units here, woops. Anything is acceptable therefore.

# 4.c)
# Orange juice is associated with more tooth growth on average

# 4.d)
t.test(d$len ~ d$supp)
# p = 0.06 so greater than our alpha of 0.01. We do not reject the null hypothesis.
# The difference between treatments is not significant at the 0.01 level

# 4.e) 
# As seen on the boxplot, the longest tooth cells belonged to a guinea pig that received vitamin C

# 4.f)
plot(d$dose, d$len, xlab = "Dose (mg/day)", ylab = "Length", col = ifelse(d$supp == "OJ", "orange", "green"),
                                                             pch = ifelse(d$supp == "OJ", 10, 3),
                                                            main = "Tooth cell length by dose")
legend (1.3,15, legend = c("Orange juice", "Vitamin C"), col = c("orange", "green"), pch = c(10,3), cex = 0.6)
# There's actually no info about units here, woops. Anything is acceptable therefore.

# 4.g)
# Higher dosages are associated with greater tooth growth

# 4.h)
# No, the difference between OJ and VC appears stronger for lower dosages.

# 4.i)

for(dose in unique(d$dose)){
  subset <- d[d$dose == dose,]
  t.test(len ~ supp, data = subset)
  print(paste("Dose", dose, "p-value:", t.test(len ~ supp, data = subset)$p.value))
}

# The tests are significant at the 0.01 level for dosages of 0.5 mg/day and 1mg/day but not for 2mg/day

# Bonus:
# Since we are performing 3 tests we need to correct for multiple comparisons to avoid spurious significant results
# One way to do this would be Bonferroni correction (dividing our alpha by the number of tests, so alpha = 0.01/3 = 0.0033)