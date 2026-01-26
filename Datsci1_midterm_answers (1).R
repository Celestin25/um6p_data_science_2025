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