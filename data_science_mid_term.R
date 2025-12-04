#number 1
#a.
x <- c(1, 2, 3, 4, 5, 6)
y <- c(2, 6, 4, 6, 1, 1)
plot(x, y)

#b.
number_1 <- 2 / 20
number_2 <- 6 / 20
number_3 <- 4 / 20
number_4 <- 6 / 20
number_5 <- 1 / 20
number_6 <- 1 / 20
mode # the mode is 2 and 4
mean(number_1, number_2, number_3, number_4, number_5, number_6) # Mean is 0.1 = 10% corresponding to number 1
median(number_1, number_2, number_3, number_4, number_5, number_6) # the median is 0.1
var(
  number_1,
  number_2,
  number_3,
  number_4,
  number_5,
  number_6,
  y = NULL,
  na.rm = FALSE,
  use
)
x <- c(number_1, number_2, number_3, number_4, number_5, number_6)
standard_deviation <- function(x) sqrt(sum((x - mean(x))^2) / length(x))
standard_deviation(x) # standard_deviation = 0.1067

#c : I used N as N-1 dealing with sampling from population and N works on population.

#d
x <- sample(1:6, 10, replace = TRUE)
dbinom(x, 10, 0.1067) # the probability of rolling either a 5 or 6 at least two times is 0.22 = 22%


#QUESTION NUMBER.2
#a.I would expect the positive correlation between these two measures and correlation will be stronger.
#b The colleration between radius and the area of a circle is stronger as the area of the circle is equal to pi times the radius squared so the bigger radius the area we get.

#Question 3
#a z-score associated with the top 5 percent in given metric is a positive z-score and standardizing score to be in above 95%
#a the value is at 95th percentile

#b the z-scores shows that the value is at 50th percentile from mean at left and right

#Question 4
#a
d <- data(ToothGrowth)

#B
boxplot(
  len ~ supp,
  data = ToothGrowth,
  +col = c("orange", "lightgreen"),
  +xlab = "Length",
  +ylab = "Supplement",
  +main = "Difference in length OJ VS VC"
)


#C Vitamin C-fed guinea pigs Treatment appears to  lead to the fastes growth average

# d Since P-Value is less than alpha rate we reject the null-hypothesis
#e Supplement type VC

# f
boxplot(
  len ~ dose,
  data = ToothGrowth,
  +col = c("orange", "lightgreen"),
  +xlab = "Length",
  +ylab = "Supplement",
  +main = "Difference in relationship between length and dose"
)

# g the amount of dose has correlation with the length the higher dose lead to higher length

#h the affect do appeared in c are similar across all dosage levels!

# i

for (i in dose(ToothGrowth)) {
  print(t - t.test(dose))
}

# Arrangining dosages by using the with-in subject methods.
