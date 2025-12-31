###################################
###################################
########                   ########
########   Data Science 1  ########
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

# compare this to:e
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(method = lm, se = TRUE, level = 0.96)
