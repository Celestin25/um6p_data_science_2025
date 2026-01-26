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
