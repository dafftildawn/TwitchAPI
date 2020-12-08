#dependencies

library(rTwitchAPI)

library(wordcloud)

library(tm)

#function pulls top 100 streams in english
#takes the titles and creates and word cloud

top100_streams_title_wordcloud = function(x = 100, y = "en"){ 
  
    twitch_auth()
  
    streams_live = get_streams(first = x, language = y)
      
    streamsdata = as.data.frame(streams_live$data) 
      
    Titles = streamsdata[, c(6, drop=FALSE)] 
      
    wordcloud(Titles, colors=brewer.pal(6,"Dark2"),random.order=FALSE)
    
}
top100_streams_title_wordcloud( )
