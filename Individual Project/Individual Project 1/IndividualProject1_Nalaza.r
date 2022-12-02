#Wendy Nalaza
#BSIT 2-A
#Individual Project

#Packages applied
library("twitteR")
library(tm)
library(dplyr)
library("plotly")
library(ggplot2)
library(RColorBrewer)
library(tidytext)
library(stringr)
library(tidyr)
library(rtweet)
library(corpus)
library(magrittr)
library(wordcloud)
library(wordcloud2)
library(syuzhet)

#Extract from twitter using your developer's credentials. Choose any keyword you want.------------- 

CONSUMER_SECRET <- "gbuzairwHJDlzG6zmK3fFxqcEo2GIHbRy89NISU80IaqvVhjIx"
CONSUMER_KEY <- "s2yMTMlykz9iJ2I86kHzWsqtF"
ACCESS_SECRET <- "znEI53FQ3P1xhF3BAfvwiptXKtTMSAmD9BTzozQD8ax98"
ACCESS_TOKEN <- "1598161218618867713-qojQanThDqRQOlGJ4YcCXhFkYDx1gr"

setup_twitter_oauth(consumer_key = CONSUMER_KEY,
                    consumer_secret = CONSUMER_SECRET,
                    access_token = ACCESS_TOKEN,
                    access_secret = ACCESS_SECRET)

#Get 10000 observations "excluding retweets.-------------------------------------------------------

TrendTweets <- searchTwitter("#wednesdaynetflix -filter:retweets",
                             n = 10000,
                             lang = "en",
                             since = "2022-11-23",
                             until = "2022-11-30",
                             retryOnRateLimit=120)

TrendTweets
TrendTweetsDF <- twListToDF(TrendTweets)

save(TrendTweetsDF,file = "TrendTweetsDF.Rdata")
load(file = "TrendTweetsDF.Rdata")

##Or

#for existed data
setwd("C:/CS101_DATA_SCIENCE/Nalaza_Repo/Individual Project/Individual Project 1")
#use the data file
load(file = "TrendTweetsDF.Rdata")

sapply(TrendTweetsDF, function(x) sum(is.na(x)))

tweetsDF <- TrendTweetsDF %>% select(screenName,text,created,statusSource)
tweetsDF
#Plot the time series from the date created. with legends.--------------------------

#Plot the trend retweets with number of tweets and date.

ggplot(data = tweetsDF, aes(x = created), fill = tweetsDF) +
  geom_histogram(aes(fill = ..count..)) + 
  theme(legend.position="right",
        axis.title.x = element_blank(),
        axis.text.x = element_text(angle = 45, hjust = 1)) +
   xlab("Time") + ylab("Number of tweets") + 
  scale_fill_gradient(low = "black", high = "midnightblue") + 
  ggtitle("Trendtweets #wednesdaynetflix")


#summary of date created.
tweetsDF %>% group_by(1) %>%  
  summarise(max = max(created), min = min(created))

tweetsDF %<>% 
  mutate(Created_At_Round = created%>% 
           round(units = 'hours') %>% 
           as.POSIXct())

tweetsDF %>% pull(created) %>% min()

tweetsDF %>% pull(created) %>% max()

#plot of created trend tweets
plt <- tweetsDF %>% 
  dplyr::count(Created_At_Round) %>% 
  ggplot(mapping = aes(x = Created_At_Round, y = n)) +
  theme_light() +
  geom_line() +
  xlab(label = 'Date') +
  ylab(label = NULL) +
  ggtitle(label = "Number of Tweets per Hour")

plt %>% ggplotly()
#Frequency of tweets
Frequency <- ts_plot(tweetsDF, "hours") + 
  labs(x = NULL, y = NULL,
       title = "Frequency of tweets with a #wendesdaynetflix hashtag",
       subtitle = paste0(format(min(tweetsDF$created), "%d %B %Y"), " to ", 
                         format(max(tweetsDF$created),"%d %B %Y")),
       caption = "Data collected from Twitter's REST API via twitteR") +
  theme_minimal()

ggplotly(Frequency)
#Plot a graph (any graph you want)based on the type of device -
#found in Source - that the user use. Include the legends. -----------------------------

#The encode source of tweets
encodeSource <- function(x) {
  if(grepl(">Twitter for iPhone</a>", x)){
    "iphone"
  }else if(grepl(">Twitter for iPad</a>", x)){
    "ipad"
  }else if(grepl(">Twitter for Android</a>", x)){
    "android"
  } else if(grepl(">Twitter Web Client</a>", x)){
    "Web"
  } else if(grepl(">Twitter for Windows Phone</a>", x)){
    "windows phone"
  }else if(grepl(">dlvr.it</a>", x)){
    "dlvr.it"
  }else if(grepl(">IFTTT</a>", x)){
    "ifttt"
  }else if(grepl(">Facebook</a>", x)){
    "facebook"
  }else {
    "others"
  }
}

tweetsDF$tweetSource = sapply(tweetsDF$statusSource, 
                              encodeSource)

tweet_appSource <- tweetsDF %>% 
  select(tweetSource) %>%
  group_by(tweetSource) %>%
  summarize(count=n()) %>%
  arrange(desc(count)) 

Source_subset <- subset(tweet_appSource,count >10)

dataDF <- data.frame(
  category = tweet_appSource$tweetSource,
  count = tweet_appSource$count
)

dataDF$fraction = dataDF$count / sum(dataDF$count)
dataDF$percentage = dataDF$count / sum(dataDF$count) * 100
dataDF$ymax = cumsum(dataDF$fraction)
dataDF$ymin = c(0, head(dataDF$ymax, n=-1))
dataDF$roundP = round(dataDF$percentage, digits = 2)

#Plotting the tweet source 
ggplot(tweetsDF[tweetsDF$tweetSource != 'others',], aes(tweetSource, fill = tweetSource)) +
  geom_bar() +
  theme(legend.position="right",
        axis.title.x = element_blank(),
        axis.text.x = element_text(angle = 45, hjust = 1)) +
  ylab("Number of tweets") +
  ggtitle("Tweets by Source")

#Convert into corpus

namesCorpus <- Corpus(VectorSource(tweetsDF$screenName))

#Create a wordcloud from the screenName----------------------------------------

tweet_appScreen <- tweetsDF %>%
  select(screenName) %>%
  group_by(screenName) %>%
  summarize(count=n()) %>%
  arrange(desc(count))

#Running the code using the wordcloud()

wordcloud2(data=tweet_appScreen, 
           size=2, 
           color='random-dark',
           shape = 'diamond')
#===============================================================================