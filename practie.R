data(mtcars)
plot(mtcars$wt,mtcars$mpg,
ylim=c(0,50),
xlim=c(-0.5,7),
,pch=20,main  = 'Car efficiency as a function of weight',ylab = 'Fuel efficiency(Miles per gallon)', xlab= 'weight(1000s of lbs)')

model<-lm(mtcars$mpg~mtcars$wt)
summary(model)

y = 37.2851+(-5.3445)*4.2
abline(h=14.8382, v= 4.2, c("blue","red"))