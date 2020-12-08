#' Word Cloud Title Search
#'
#'Collects top 100 stream titles and makes a word cloud of most popular words used
#'
#'@author Marcus Daffner
#'
#'@param x up to a maximum of 100 streams (100 default)
#'@param y language (english by defaults)
#'
#'@return A word cloud of most used terms in stream title
#'
#'@examples
#'top100_streams_title_wordcloud(100,"en")
#'
#'@export

#dependencies

    library(rTwitchAPI)

    library(wordcloud)

    library(tm))

top100_streams_title_wordcloud = function(x = 100, y = "en"){

    twitch_auth()

    streams_live = get_streams(first = x, language = y)

    streamsdata = as.data.frame(streams_live$data)

    Titles = streamsdata[, c(7, drop=FALSE)]

    wordcloud(Titles, colors=brewer.pal(6,"Dark2"),random.order=FALSE)

}
top100_streams_title_wordcloud()
