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
fruits <- c('apple', 'banana', 'pineapple', 'mango', 'orange')
for (i in fruits) {
  # it doesn't matter that we use the letter i here. It could be anything. It serves as a placeholder that represents the elements of the vector or list that we are iterating over.
  print(paste('My favourite fruit is', i, sep = ': '))
}

useless_function <- function(n) {
  for (i in 1:n) {
    print(paste0(i, '. This number is: ', c('even', 'odd')[i %% 2 + 1]))
  }
}
useless_function(7)

### 1.1
data(iris)
# Write a for loop that iterates over the column names of the iris dataset and print each together with the number of characters in the column name in parenthesis. Example output: Sepal.Length (12). To get the number of characters use the function nchar().
for (col_name in names(iris)) {
  print(paste0(col_name, " (", nchar(col_name), ")"))
}


# Next, WHILE loops continue to loop until the boolean statment in the defining parentheses, e.g.
x <- 0
while (x < 100) {
  print(x)
  x <- x + sample(1:20, 1)
}

### 1.2 How many numbers do you need in the sequence 1*2*3*4*5*... before the product exceeds 10 million?
# Use a while loop to get the answer
product <- 1
i <- 1
while (product <= 10000000) {
  i <- i + 1
  product <- product * i
}
print(paste("The number of terms needed is:", i))
print(paste("The product is:", product))

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
N <- 100
# 2.2 Next, create a vector of 1s and 0s, so that half of your sample receives the treatement (coded 1), and the other half doesn't (coded 0)

treatment <- c(rep(1, N / 2), rep(0, N / 2))
# Next we will run 60 different t-tests using a for loop, and save the p-value for each of these tests
# 2.3 start by initializing an empty vector for your p-values using an empty c() function.
p_values <- c()
# 2.4 Next, write a for loop for a total of 60 loops
# For each loop, save a new y-variable that you have sampled completely at random
# your y-variable should be of length N, but otherwise you can sample it however you like (rnorm,runif,rbinom... any probability distribution you like with any parameter values you like)

# Next (still within the for loop), run a t-test comparing the y-values corresponding to treatment == 1 with the y-values corresponding to treatment ==0

# extract the p-value for that t-test and save it to the vector of p-values
for (i in 1:60) {
  y <- rnorm(N)
  test_result <- t.test(y ~ treatment)
  p_values <- c(p_values, test_result$p.value)
}
# 2.5 After your for-loop is run, calculate the sum of the saved p-values that are less than 0.05

# 2.6 How many significant results are there at the 0.05 level?

print(significant_count)
# 2.7 Run the whole for loop again several times. How many significant results do you find each time?

# 2.8 Write a for loop that runs the previous for-loop multiple times, and save the number of significant results you get each time. Run this for loop at least 100 times
sim_results <- c()
for (experiment in 1:100) {
  p_vals_inner <- c()
  for (j in 1:60) {
    y <- rnorm(N)
    test <- t.test(y ~ treatment)
    p_vals_inner <- c(p_vals_inner, test$p.value)
  }
  sim_results <- c(sim_results, sum(p_vals_inner < 0.05))
}
# 2.9 Plot the histogram of the number of significant results you get for each multiple comparisons experiment. What is the average number?

hist(
  sim_results,
  main = "Histogram of False Positives per Experiment",
  xlab = "Number of Significant Results"
)
mean_results <- mean(sim_results)
print(paste("Average number of significant results:", mean_results))
#The average is 3
# 2.10 Run this whole code again, but this time increase the sample size N. Does your histogram look any different? why?
N_large <- 1000
treatment_large <- c(rep(1, N_large / 2), rep(0, N_large / 2))
sim_results_large <- c()

for (experiment in 1:100) {
  p_vals_inner <- c()
  for (j in 1:60) {
    y <- rnorm(N_large)
    test <- t.test(y ~ treatment_large)
    p_vals_inner <- c(p_vals_inner, test$p.value)
  }
  sim_results_large <- c(sim_results_large, sum(p_vals_inner < 0.05))
}
hist(sim_results_large, main = "Histogram with Large N")
print(mean(sim_results_large))
# No, the histogram does NOT look significantly different. The average is still around 3.
# 2.11 Run the code again, but this time instead of counting how many results are less than 0.05, divide this threshold by the total number of comparisons (60).
bonferroni_threshold <- 0.05 / 60
sim_results_bonferroni <- c()

for (experiment in 1:100) {
  p_vals_inner <- c()
  for (j in 1:60) {
    y <- rnorm(N)
    test <- t.test(y ~ treatment)
    p_vals_inner <- c(p_vals_inner, test$p.value)
  }
  sim_results_bonferroni <- c(
    sim_results_bonferroni,
    sum(p_vals_inner < bonferroni_threshold)
  )
}

# 2.12 What does your new histogram look like?
#The new histogram consists almost entirely of Zeros.
# 2.13 This (dividing the p-value required for significance by the number of comparisons made) is called Bonferroni correction for multiple comparisons.
# Why is it important?
#It is important because it controls the "Family-Wise Error Rate."  
