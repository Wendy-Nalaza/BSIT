#VIRGINICA DATA
#1.)Declare the data of iris
data("iris")
iris

#2.)A subset virginica from iris
subset(iris, Species == "virginica")

#2.1)A subset of each characteristics of virginica
subset(iris, Species == "virginica", Sepal.Length:Petal.Width)

#3.)Declare each column of iris to calculate the total mean of the virginica
Sepal_Length <- iris$Sepal.Length[101:150]
Sepal_Width <- iris$Sepal.Width[101:150]
Petal_Length <- iris$Petal.Length[101:150]
Petal_Width <- iris$Petal.Width[101:150]

Sepal_Length
Sepal_Width
Petal_Length
Petal_Width

#3.)The total mean of virginica
Total_Mean <- c(Sepal_Length, Sepal_Width, Petal_Length, Petal_Width)
Total_Mean
mean(Total_Mean) #Answer is 4.285

#.4)The mean of each characteristics of virginica
mean(Sepal_Length)#Answer is 6.588
mean(Sepal_Width)#Answer is 2.974
mean(Petal_Length)#Answer is 5.552
mean(Petal_Width)#Answer is 2.026
