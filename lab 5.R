###################################
###################################
########                   ########
########   Data Science 1  ########
########       Lab 5       ######## 
########  04th Nov. 2025   ########
########                   ########
###################################
###################################

## Welcome to lab #8. 

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

### 1.1 
data(iris)
# Write a for loop that iterates over the column names of the iris dataset and print each together with the number of characters in the column name in parenthesis. Example output: Sepal.Length (12). To get the number of characters use the function nchar().



# Next, WHILE loops continue to loop until the boolean statment in the defining parentheses, e.g.
x <- 0
while(x<100){
  print(x)
  x <- x+sample(1:20,1)
}

### 1.2 How many numbers do you need in the sequence 1*2*3*4*5*... before the product exceeds 10 million?
# Use a while loop to get the answer


########################
####  2. P-hacking  ####
########################

# THE ICE BATH STUDY
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
# 2.1 Start by saving a sample size of 100 to an object N

# 2.2 Next, create a vector of 1s and 0s, so that half of your sample receives the treatement (coded 1), and the other half doesn't (coded 0)


# Next we will run 60 different t-tests using a for loop, and save the p-value for each of these tests
# 2.3 start by initializing an empty vector for your p-values using an empty c() function. 

# 2.4 Next, write a for loop for a total of 60 loops
# For each loop, save a new y-variable that you have sampled completely at random
# your y-variable should be of length N, but otherwise you can sample it however you like (rnorm,runif,rbinom... any probability distribution you like with any parameter values you like)

# Next (still within the for loop), run a t-test comparing the y-values corresponding to treatment == 1 with the y-values corresponding to treatment ==0

# extract the p-value for that t-test and save it to the vector of p-values


# 2.5 After your for-loop is run, calculate the sum of the saved p-values that are less than 0.05

# 2.6 How many significant results are there at the 0.05 level?


# 2.7 Run the whole for loop again several times. How many significant results do you find each time?

# 2.8 Write a for loop that runs the previous for-loop multiple times, and save the number of significant results you get each time. Run this for loop at least 100 times


# 2.9 Plot the histogram of the number of significant results you get for each multiple comparisons experiment. What is the average number?


# 2.10 Run this whole code again, but this time increase the sample size N. Does your histogram look any different? why?

# 2.11 Run the code again, but this time instead of counting how many results are less than 0.05, divide this threshold by the total number of comparisons (60).



# 2.12 What does your new histogram look like?

# 2.13 This (dividing the p-value required for significance by the number of comparisons made) is called Bonferroni correction for multiple comparisons.
# Why is it important?
