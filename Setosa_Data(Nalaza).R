#SETOSA DATA
#1.)Declare the data of iris
data("iris")
iris

#2.)A subset setosa from iris
subset(iris, Species == "setosa")

#2.1)A subset of each characteristics of setosa
subset(iris, Species == "setosa", Sepal.Length:Petal.Width)

#3.)Declare each column of iris to calculate the total mean of the setosa
Sepal_Length <- iris$Sepal.Length[1:50]
Sepal_Width <- iris$Sepal.Width[1:50]
Petal_Length <- iris$Petal.Length[1:50]
Petal_Width <- iris$Petal.Width[1:50]

Sepal_Length
Sepal_Width
Petal_Length
Petal_Width

#3.)The total mean of setosa
Total_Mean <- c(Sepal_Length, Sepal_Width, Petal_Length, Petal_Width)
Total_Mean
mean(Total_Mean) #Answer is 2.5355

#.4)The mean of each characteristics of setosa
mean(Sepal_Length)#Answer is 5.006
mean(Sepal_Width)#Answer is 3.428
mean(Petal_Length)#Answer is 1.462
mean(Petal_Width)#Answer is 0.246