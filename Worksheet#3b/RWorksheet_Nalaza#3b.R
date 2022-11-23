#1. Create a data frame using the table below.
#a. Write the codes
Residents <- data.frame(
  Respondents = c(1:20),
  sex = c(2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 1, 2),
  Fathers_Occupation = c(1, 3, 3, 3, 1, 2, 3, 1, 1, 1, 3, 2, 1, 3, 3, 1, 3, 1, 2, 1),
  Persons_at_Home = c(5, 7, 3, 8, 5, 9, 6, 7, 8, 4, 7, 5, 4, 7, 8, 8, 3, 11, 7, 6),
  Siblings_at_school = c(6, 4, 4, 1, 2, 1, 5, 3, 1, 2, 3, 2, 5, 5, 2, 1, 2, 5, 3, 2),
  Types_of_Houses = c(1, 2, 3, 1, 1, 3, 3, 1, 2, 3, 2, 3, 2, 2, 3, 3, 3, 3, 3, 2))

Residents
#b. Describe the data.
#---Declaring the object as a "resident" and using the function data frames to collect 
#---the variables of respondents and make matrices and lists 
#Get the structure or the summary of the data
summary(Residents)

#c. Is the mean number of siblings attending is 5?
#Answer: No

#d. Extract the 1st two rows and then all the columns using the subsetting functions.
#Write the codes and its output.
Subset <- subset(Residents[1:2, 1:6, drop = FALSE])
Subset

#e. Extract 3rd and 5th row with 2nd and 4th column. Write the codes and its result.
Subset1 <- subset(Residents[c(3,5),c(2,4)])
Subset1

#f. Select the variable types of houses then store the vector that results as types_houses.
#Write the codes.
Store <- Residents[c(6)]

type_of_houses <- Store

#g. Select only all Males respondent that their father occupation was farmer. Write
#the codes and its output.

subset(Residents, sex == 1, select = Fathers_Occupation == 1)

#h. Select only all females respondent that have greater than or equal to 5 number
#of siblings attending school. Write the codes and its outputs

females <- subset(Residents[c(1:20), c(2,5)])
females
girls <- females[Residents$Siblings_at_school >= 5,]
girls

#2. Write a R program to create an empty data frame. Using the following codes:
df = data.frame(Ints=integer(),
                Doubles=double(), Characters=character(),
                Logicals=logical(),
                Factors=factor(),
                stringsAsFactors=FALSE)
print("Structure of the empty dataframe:")
print(str(df))
