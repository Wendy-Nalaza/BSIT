#Wendy Nalaza
#BSIT 2-A
#Individual Project 2

#Packages applied---------------------------------------------------------------

setwd("C:/CS101_DATA_SCIENCE/Nalaza_Repo/Individual Project/Individual Project 2/Load_Packages")
source("Load_Packages.R")

#set the directory to save data

setwd("C:/CS101_DATA_SCIENCE/Nalaza_Repo/Individual Project/Individual Project 2")

#Extract from twitter using your developer's credentials.

CONSUMER_SECRET <- "gbuzairwHJDlzG6zmK3fFxqcEo2GIHbRy89NISU80IaqvVhjIx"
CONSUMER_KEY <- "s2yMTMlykz9iJ2I86kHzWsqtF"
ACCESS_SECRET <- "znEI53FQ3P1xhF3BAfvwiptXKtTMSAmD9BTzozQD8ax98"
ACCESS_TOKEN <- "1598161218618867713-qojQanThDqRQOlGJ4YcCXhFkYDx1gr"

setup_twitter_oauth(consumer_key = CONSUMER_KEY,
                    consumer_secret = CONSUMER_SECRET,
                    access_token = ACCESS_TOKEN,
                    access_secret = ACCESS_SECRET)


#Get 10000 observations including retweets--------------------------------------
trendTweets <- searchTwitter("#TheGameAwards",
                             n = 10000,
                             lang = "en",
                             since = "2022-12-01",
                             until = "2022-12-08",
                             retryOnRateLimit=120)
trendTweets

#Converting data into dataframe

TrendTweetsDF <- twListToDF(trendTweets)

#Saving File

save(TrendTweetsDF,file = "TrendTweetsDF.Rdata")

#using the existed data
load(file = "TrendTweetsDF.Rdata")

#Subset the retweets and the original tweets into a separate file---------------
#Plot the retweets and the original tweets using bar graph in vertical manner and 
#Include legends

#Original Tweets================================================================
Original <- subset(TrendTweetsDF, isRetweet=="FALSE",
                         select= c(text,screenName,created, isRetweet))
Original


Original %>%
  group_by(1) %>%
  summarise(max = max(created), min= min(created))


Tweets <- Original %>%  mutate(Created_At_Round = 

             created %>% round(units = 'hours') %>% as.POSIXct())
Tweets 

mini <- Tweets %>% pull(created) %>% min()
mini

maxi <- Tweets %>% pull(created) %>% max()
maxi

#Plot of the original tweets
Original_tweets <- ggplot(Tweets, aes(x = created)) +
  geom_histogram(aes(fill = ..count..)) +
  theme(legend.position = "right") +
  xlab("Time") + ylab("Number of tweets") + 
  scale_fill_gradient(low = "midnightblue", high = "purple") + 
  labs(title = "The Original Tweets", subtitle = "December 7,2022")

Original_tweets %>% ggplotly()

#The Retweets==================================================================
Retweets <- subset(TrendTweetsDF, isRetweet=="TRUE",
                   select= c(text,screenName,created, isRetweet))

Retweets %>%  
  group_by(1) %>%  
  summarise(max = max(created), min = min(created))

Retweets_1 <- Retweets %>% mutate(Created_At_Round = created%>% 
                            round(units = 'hours') %>%
                            as.POSIXct())
Retweets_1

mini <- Retweets_1 %>% pull(created) %>% min()
mini
maxi <- Retweets_1 %>% pull(created) %>% max()
maxi

#Plot of the retweets
Retweets_2<- ggplot(Retweets_1, aes(x = created)) +
  geom_histogram(aes(fill = ..count..)) +
  theme(legend.position = "right") +
  xlab("Time") + ylab("Number of Retweets") + 
  scale_fill_gradient(low = "midnightblue", high = "skyblue") +
  labs(title = "The Retweets", subtitle = "December 7,2022")

Retweets_2 %>% ggplotly()

