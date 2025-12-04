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
data(mtcars)

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
plot(mtcars$wt,mtcars$mpg,pch="✌")

# To change x axis and y axis labels, and add a title you can use
plot(mtcars$wt,mtcars$mpg, pch=20, xlab='Weight (1000 lbs)', ylab='Fuel efficiency (mpg)', main='Association between car weight and fuel efficiency')

# And to change the range of the plot, use
plot(mtcars$wt,mtcars$mpg, pch=20, ylim = c(0,40), xlim = c(0,7))

# Instead of a scatterplot, you can change the type of the plot using 'type'
plot(dnorm(seq(-4,4,0.2)),pch=20)
plot(dnorm(seq(-4,4,0.2)),type='l')
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


