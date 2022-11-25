#Based on the above vector LETTERS:
LETTERS <- c("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", 
             "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z")
LETTERS
letters <- c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", 
             "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z")
letters

#a. You need to produce a vector that contains the first 11 letters.
LETTERS[1:11]

#b. Produce a vector that contains the odd numbered letters
odd <- letters[1:26 %% 2 != 0]
odd

#c. Produce a vector that contains the vowels
#Based on the above vector letters:
vowel_letters <- LETTERS [c(1,5,9,15,21)]
vowel_letters

#d. Produce a vector that contains the last 5 lowercase letters.
letters[21:26]

#e. Produce a vector that contains letters between 15 to 24 letters in lowercase.
letters[15:24]

#2.
#a. What is the R code and its result for creating a character vector for the city/town of
#Tuguegarao City, Manila, Iloilo City, Tacloban, Samal Island, and Davao City? Name the
#object as city. The names should follow the same order as in the instruction.
City <- c("Tuguegarao City","Manila","Iloilo City","Tacloban","Samal Island","Davao City")
City

#b. The average temperatures in Celcius are 42, 39, 34, 34, 30, and 27 degrees.
#Name the object as temp. Write the R code and its output. Numbers should also follow what
#is in the instruction.
Temperature <- c(42,39,34,34,30,27)
Temperature
#c. Associate the temperature temp with the city by using names() function. What is
#the R code and its result?
names(Temperature) <- City
Temperature

#d. From the answer in c, what is the content of index 5 and index 6? 
#What is its R code?
Temperature[5:6]

#2. Create a matrix of one to eight and eleven to fourteen with four columns and 
#three rows.

#a. What will be the R code for the #2 question and its result?
x <- matrix(data = c(1:8,11:14),3,4)
x

#b. Multiply the matrix by two. What is its R code and its result?
x*2

#c. What is the content of row 2? What is its R code?
x[2,]

#d. What will be the R code if you want to display the column 3 and column 4 in row 1 and row 2? 
#What is its output?
x[c(1,2),c(3,4)]

#e. What is the R code is you want to display only the #columns in 2 and 3, row 3? 
#What is its output?
x[c(3),c(2,3)]

#f. What is the R code is you want to display only the #columns 4? 
#What is its output?
x[,4]

#g. Name the rows as isa, dalawa, tatlo and columns as uno, dos, tres, quatro
#for the matrix that was created in b.‘. What is its R code and corresponding output?
dimnames(x) <- list(c("isa", "dalawa", "tatlo"),c("uno", "dos", "tres", "quatro"))
x

#h. From the original matrix you have created in a, reshape the matrix by assigning a
#new dimension with dim(). New dimensions should have 2 columns and 6 rows. What will
#be the R code and its output?
dim(x) <- c(6,2)
x

#3. An array contains 1, 2, 3, 6, 7, 8, 9, 0, 3, 4, 5, 1

#a. Create an array for the above numeric values. Each values will be repeated twice 
# What will be the R code if you are to create a three-dimensional array with 4 columns and 2 rows. 
#What will be its output?

Array_Data <- c(1, 2, 3, 6, 7, 8, 9, 0, 3, 4, 5, 1)
Array_Data

val <- array(rep(Array_Data, 2), dim = c(2,4,3))
val

#b. How many dimensions do your array have?

#3-Dimension

#c. Name the rows as lowercase letters and columns as uppercase letters starting from the A
#The array names should be “1st-Dimensional Array”, “2nd-Dimensional Array”, and “3rd-Dimensional Array”.
# What will be the R codes and its output?

dimnames(val) <- list(letters[1:2], LETTERS[1:4], c("1st-Dimensional Array", "2nd-Dimentional Array", 
                                                    "3rd-Dimensional Array"))
val
