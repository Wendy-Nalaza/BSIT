#VERSICOLOR DATA
#1.)Declare the data of iris
data("iris")
iris

#2.)A subset versicolor from iris
subset(iris, Species == "versicolor")

#2.1)A subset of each characteristics of versicolor
subset(iris, Species == "versicolor", Sepal.Length:Petal.Width)

#3.)Declare each column of iris to calculate the total mean of the versicolor
Sepal_Length <- iris$Sepal.Length[51:100]
Sepal_Width <- iris$Sepal.Width[51:100]
Petal_Length <- iris$Petal.Length[51:100]
Petal_Width <- iris$Petal.Width[51:100]

Sepal_Length
Sepal_Width
Petal_Length
Petal_Width

#3.)The total mean of versicolor
Total_Mean <- c(Sepal_Length, Sepal_Width, Petal_Length, Petal_Width)
Total_Mean
mean(Total_Mean) #Answer is 3.573

#.4)The mean of each characteristics of versicolor
mean(Sepal_Length)#Answer is 5.936
mean(Sepal_Width)#Answer is 2.77
mean(Petal_Length)#Answer is 4.26
mean(Petal_Width)#Answer is 1.326