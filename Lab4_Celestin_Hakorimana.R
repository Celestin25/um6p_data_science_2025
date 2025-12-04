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
####    EXERCISES    ####
#########################

## 1. Scatterplots
# Load the mtcars dataset
data(mtcars)
# a) Make a scatterplot of horsepower (hp) against miles per gallon (mpg) from the mtcars dataset.
plot(mtcars$hp, mtcars$mpg)
# b) Change the plotting symbol to solid circles and color the points darkgreen.
plot(mtcars$hp, mtcars$mpg, pch=19, col='darkgreen')
# c) Add appropriate axis labels and a main title describing the relationship.
plot(mtcars$hp, mtcars$mpg,
     pch=19,
     col='darkgreen',
     xlab='Horsepower (hp)',
     ylab='Miles per Gallon (mpg)',
     main='Relationship between Horsepower and Fuel Efficiency')
## 2. Customizing plots
# a) Make the same plot as before, but restrict the x-axis to 50–350 and the y-axis to 0–40.
plot(mtcars$hp, mtcars$mpg,
     pch=19,
     col='darkgreen',
     xlab='Horsepower (hp)',
     ylab='Miles per Gallon (mpg)',
     main='Relationship between Horsepower and Fuel Efficiency',
     xlim=c(50, 350),
     ylim=c(0, 40))
# b) Add a horizontal line showing the mean mpg using abline().
mean_mpg <- mean(mtcars$mpg)
abline(h=mean_mpg, col='red', lty=2, lwd=1.5)
# c) Add a vertical line showing the mean hp.
mean_hp <- mean(mtcars$hp)
abline(v=mean_hp, col='blue', lty=2, lwd=1.5)
## 3. Plot types
# Using the sequence x <- seq(-4, 4, 0.1),
x <- seq(-4, 4, 0.1) 
# plot the normal density curve using type = 'l' (a line plot) in some shade of blue.
plot(x, dnorm(x, sd=1),
     type='l',
     col='dodgerblue',
     lwd=2,
     ylim=c(0, 0.45),
     xlab='x',
     ylab='Density',
     main='Comparison of Normal Density Curves')
# Overlay another line on the same plot (use lines()) for a different normal distribution
lines(x, dnorm(x, sd=2),
      col='firebrick',
      lwd=2)
# with a different standard deviation (sd = 2) in a shade of red.
legend("topright",
       legend=c("SD = 1", "SD = 2"),
       col=c("dodgerblue", "firebrick"),
       lty=1,
       lwd=2,
       bty="n")
## 4. Axes and annotations
# a) Plot mpg against wt again, but remove both axes.
plot(mtcars$wt, mtcars$mpg,
     pch=20,
     xlab="Weight (1000 lbs)",
     ylab="Miles per Gallon",
     main="MPG vs. Weight (Lightest Car Highlighted)",
     xaxt='n', 
     yaxt='n')
# b) Add new axes manually using axis().
axis(1, at=seq(1, 6, 1))
axis(2, at=seq(10, 35, 5))
# c) Add a text label to the lightest car.
lightest_car_index <- which.min(mtcars$wt)
car_label <- rownames(mtcars)[lightest_car_index]
# Hint: use the text() function and the which.min() function to find its position.
text(mtcars$wt[lightest_car_index],
     mtcars$mpg[lightest_car_index] + 1.2, 
     cex=0.8,
     col='red',
     font=2)
## 5. Multiple plots on one device
# a) Use par(mfrow = c(1,3)) to make three plots side by side:
par(mfrow=c(1,3), mar=c(4, 4, 3, 1))
#    1. mpg vs wt
plot(mtcars$wt, mtcars$mpg,
     pch=16,
     col='dodgerblue',
     xlab='Weight',
     ylab='MPG',
     main='MPG vs. Weight')
#    2. mpg vs hp
plot(mtcars$hp, mtcars$mpg,
     pch=17,
     col='firebrick',
     xlab='Horsepower',
     ylab='MPG',
     main='MPG vs. Horsepower')
#    3. mpg vs disp
plot(mtcars$disp, mtcars$mpg,
     pch=18,
     col='darkorange',
     xlab='Displacement',
     ylab='MPG',
     main='MPG vs. Displacement')
# Use different colors and symbols for each.
# b) Reset the device when you are done.
dev.off()
## 6. Barplots and boxplots
# a) Make a barplot of the number of cars by number of cylinders (the 'cyl' variable).
# Hint: use table() to create the counts.
counts_cyl <- table(mtcars$cyl)
barplot(counts_cyl,
        col=c("skyblue", "lightgreen", "salmon"),
        xlab="Number of Cylinders",
        ylab="Count of Cars",
        main="Car Counts by Cylinder Number")
# b) Make a boxplot of mpg by number of cylinders
boxplot(mpg ~ cyl, data = mtcars,
        col = c("skyblue", "lightgreen", "salmon"),
        xlab = "Number of Cylinders",
        ylab = "Miles per Gallon (MPG)",
        main = "MPG Distribution by Cylinder Count")
## 7. Saving plots
# a) Open a png device and save a barplot of the number of cars by number of gears.
# b) Give the file a descriptive name and set the width to 700 and height to 500 pixels.
png(file="barplot_cars_by_gear_700x500.png",
    width=700, height=500)
# Code for the barplot
counts_gear <- table(mtcars$gear)
barplot(counts_gear,
        col="plum",
        xlab="Number of Forward Gears",
        ylab="Count of Cars",
        main="Number of Cars by Gear Count (mtcars)")
# c) Close the device properly when done.
dev.off()
## 8. Creative exercise
par(mar=c(5, 5, 4, 2))
# 1. Scatterplot of wt vs mpg
plot(mtcars$wt, mtcars$mpg,
     pch=ifelse(mtcars$am==1, 17, 19), # Triangle for Manual (17), Circle for Automatic (19)
     col=ifelse(mtcars$am==1, "blue", "red"),
     xlab="Weight (1000 lbs)",
     ylab="Miles per Gallon (MPG)",
     main="MPG vs. Weight by Transmission Type",
     cex=1.2)
# Create a plot that communicates *something interesting* about the mtcars dataset
# using only base R functions.
# Line for Automatic (am=0)
abline(lm(mpg ~ wt, data=subset(mtcars, am==0)), col="red", lty=2)
# Line for Manual (am=1)
abline(lm(mpg ~ wt, data=subset(mtcars, am==1)), col="blue", lty=1)
# You can combine multiple plot types, add labels, legends, or annotations.
#Add a legend
legend("topright",
       legend=c("Manual (Line & Triangle)", "Automatic (Line & Circle)"),
       col=c("blue", "red"),
       pch=c(17, 19),
       lty=c(1, 2),
       lwd=2,
       bty="o")
# Add a short comment describing what your plot shows.
#The plot demonstrates the negative association between car weight and fuel efficiency (MPG) is influenced by the transmission type.
