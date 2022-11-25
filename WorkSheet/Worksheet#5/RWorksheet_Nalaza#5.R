#Worksheet5

#1. The table shows the enrollment of BS in Computer Science, SY 2010-2011.
#Course Year 2019 - 2020
#  1st           80
#  2nd           75
#  3rd           70
#  4th           60

#a. Plot the data using a bar graph. Write the codes and copy the result.
date2019_2020 <- c(80,75,70,60)
R1a <- barplot(date2019_2020, col = rainbow(4))


#b. Using the same table, label the barchart with
#Title = ” Enrollment of BS Computer Science
#horizontal axis = “Curriculum Year” and
#vertical axis = “number of students”
course <- c("1st","2nd","3rd","4th")
R1a <- barplot(date2019_2020, col = rainbow(4),
               main = "Enrollment of BS Computer Science",
               xlab = "Curriculum Year", names.arg = course)

#2. The monthly income of De Jesus family was spent on the following:
#60% on Food, 10% on electricity, 5% for savings, and
#25% for other miscellaneous expenses.


#a. Create a table for the above scenario.
#Write the codes and its result.
expenses <- c(60,10,5,25)
barplot(expenses, col = rainbow(4), names.arg = c("Food", "Electricity", "Savings", "Miscllaneous"))
#b. Plot the data using a pie chart. Add labels, colors and legend.
#Write the codes and its result.
pie(expenses)
R2b <- pie(expenses,
           col = rainbow(length(expenses)),
           labels = c(60,10,5,25))
ex_labels <- round(expenses/sum(expenses) * 100, 1)
ex_labels <- paste(ex_labels,"%",sep = "")
pie(expenses, main = "Expenses",col=rainbow(length(expenses)),labels = ex_labels,cex=0.8)
legend(1, c("Food", "Electricity", "Savings", "Miscllaneous"),
       cex = 0.8,fill = rainbow((length(expenses))))
#3. Open the mtcars dataset.
data(mtcars)
#a. Create a simple histogram specifically for mpg (miles per gallon) variable.
#Use $ to select the mpg only. Write the codes and its result.
Histo <- mtcars$mpg
Histo2 <-hist(Histo, xlab="Miles Per Gallon",
              main="Histogram of mpg")

#b. Colored histogram with different number of bins.
Bins <-hist(Histo, breaks=12, col="blue", xlab="Miles Per Gallon",
            main="Histogram of mpg")

#Note: breaks= controls the number of bins

#c. Add a Normal Curve

abc <-hist(Histo, breaks=12, col="Magenta", xlab="Miles Per Gallon",
           main="Histogram with Normal Curve")
xfit<-seq(min(Histo),max(Histo),length=40)
yfit<-dnorm(xfit,mean=mean(Histo),sd=sd(Histo))
yfit <- yfit*diff(abc$mids[1:2])*length(Histo)
lines(xfit, yfit, col="black", lwd=2)

#Copy the result.


#4. Open the iris dataset. Create a subset for each species.

#a. Write the codes and its result.
data("iris")
var <- subset(iris, Species == "setosa")
ver <- subset(iris, Species == "versicolor")
vir <- subset(iris, Species == "virginica")

#b. Get the mean for every characteristics of each species using colMeans().
#Write the codes and its result.
var <- subset(iris, Species == "setosa")
setosa <- colMeans(var[sapply(var,is.numeric)])
setosa

verbal <- subset(iris, Species == "versicolor")
versicolor <- colMeans(verbal[sapply(verbal,is.numeric)])
versicolor

youth <- subset(iris, Species == "virginica")
virginica <- colMeans(youth[sapply(youth,is.numeric)])
virginica


#Example: setosa <- colMeans(setosa[sapply(setosaDF,is.numeric)])
#c. Combine all species by using rbind()
#The table should be look like this:
Combine <- rbind(setosa,
                 versicolor,
                 virginica)
Combine

#Sepal.Length Sepal.Width Petal.Length Petal.Width
#setosa
#versicolor
#virginica


#d. From the data in 4-c: Create the barplot().
#Write the codes and its result.
#The barplot should be like this.
barplot(Combine, beside = TRUE,
        main = "Iris Mean",
        xlab = "Characteristics",
        ylab = "Mean Scores",
        col = c("red","green","blue"))

#Figure 1: Iris Data using Barplot