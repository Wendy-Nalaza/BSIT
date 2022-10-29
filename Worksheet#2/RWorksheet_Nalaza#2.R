#1. Create a vector using : operator

#a. Sequence from -5 to 5.
seq(-5:5)

#b. x <- 1:7.
x <- 1:7
#2.* Create a vector using seq() function

#a. seq(1, 3, by=0.2) # specify step size
seq(1, 3, by=0.2)

#3. A factory has a census of its workers. There are 50 workers in total. The following list shows their ages:
Workers <- c(34, 28, 22, 36, 27, 18, 52, 39, 42, 29, 35, 31, 27,
             22, 37, 34, 19, 20, 57, 49, 50, 37, 46, 25, 17, 37, 43, 53, 41, 51, 35,
             24,33, 41, 53, 40, 18, 44, 38, 41, 48, 27, 39, 19, 30, 61, 54, 58, 26,
             18)

#3. a. Access 3rd element
Workers[3]
#3. b. Access 2nd and 4th element
Workers[2]
Workers[4]
#3. c. Access all but the 1st element is not included.
Workers[2:49]

#4. *Create a vector x <- c("first"=3, "second"=0, "third"=9). Then named the vector,names(x).
#a-b. Print the results. Then access x[c("first", "third")].Describe the output.
x <- c("first"=3, "second"=0, "third"=9)
names(x)

#5a-b. Create a sequence x from -3:2. Modify 2nd element and change it to 0
x <- -3:2
x[2] <- 0
x

#6 a.Create a data frame for month, price per liter (php) and purchase-quantity (liter).

Month <- c("Jan", "Feb", "March", "Apr", "May", "June")
Price_per_liter_php <- c(52.50, 57.25, 60.00, 65.00, 74.25, 54.00)
Purchase_quantity_liter <- c(25, 30, 40, 50, 10, 45)  

data_frame <- data.frame(Month, Price_per_liter_php, Purchase_quantity_liter)
data_frame
#6 b.Use weighted.mean(liter, purchase)
weighted.mean(Price_per_liter_php, Purchase_quantity_liter)

#7 a-c. Type “rivers” in your R console. Create a vector data with 7 elements, containing the number of elements (length) in rivers,their sum (sum), mean (mean), median (median), variance (var) standard deviation (sd), minimum (min) and maximum (max).
data <- c(length(rivers), sum(rivers), mean(rivers), median(rivers), var(rivers),
          sd(rivers), min(rivers), max(rivers))
data

#8.a. Create vectors according to the above table.
PowerRanking <- 1:25
CelebrityName <- c("Tom Cruise", "Rolling Stones", "Oprah Winfrey", "U2", 
                   "Tiger Woods", "Steven Spielberg", "Howard Stern", "50 Cent", "Cast of the sopranos",
                   "Dan Brown", "Bruce Springsteen", "Donald Trump", "Muhammad Ali", "Paul McCartney",
                   "George Lucas", "Elton John", "David Letterman", "Phil Mickelson", "J.K Rowling",
                   "Bradd Pitt", "Peter Jackson", "Dr. Phil McGraw", "Jay Lenon", "Celine Dion", "Kobe Bryant")
Pay <- c(67, 90, 225, 110, 90, 332, 302, 41, 52, 88, 55, 44, 55, 40,
         233, 34, 40, 47, 75, 25, 39, 45, 32, 40, 31)
Data_Ranking <- data.frame(PowerRanking, CelebrityName, Pay)
Data_Ranking
#8.b. Modify the power ranking and pay of J.K. Rowling. Change power ranking to 15 and pay to 90.
PowerRanking [19] <- 15
PowerRanking
Pay [19] <- 90
Pay
#8.c. Interpret the data.
PowerRanking[19] <- 15;
PowerRanking

Pay[19] <- 90;
Pay

ArtistRanking <- data.frame(PowerRanking, Celebrities, Pay)
ArtistRanking

#(Interpret: The first data declares the power ranking at the data ranking of set variables, 
#and the index 19 declares the power ranking of the row, which then changes from 19 to 15.)
#(Interpret: The second data declares the pay at the data ranking, same as the process at 
#the first data but as the Pay row and declares 19 of the column to change from 75 to 90.)
#(Interpret: The last data declares another new data as "Artist Ranking" 
#to process the changes inside the data of power ranking, celebrities, and pay.)

