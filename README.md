---
title: "TwitchAPI"
author: "Marcus Daffner"
date: "11/17/2020"
output: github_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Installation

Install from GitHub with the following code:

```{r install, eval = FALSE}
if (!requireNamespace("devtools", quietly = TRUE)) {
  install.packages("devtools")
}
devtools::install_github(("dafftildawn/TwitchAPI"))
```

This package requires the following packages  [<code> rTwitchAPI </code>](https://github.com/Freguglia/rTwitchAPI) , [<code> usethis </code>](https://usethis.r-lib.org/),
[<code> wordcloud </code>](https://cran.r-project.org/web/packages/wordcloud/wordcloud.pdf) , and [<code> tm </code>](https://cran.r-project.org/web/packages/tm/tm.pdf). 

## Authentication

This package directly connects to [Twitch's Developer Console](https://dev.twitch.tv/console)

You must register for a Twitch account and then register your console

To [register your console](https://dev.twitch.tv/console) you must

+ Create a **Name**

+ Assign the **OAuth Redirect URLs** as http://localhost

+ Choose a **Category**

+ Copy and paste the end of your URL into the **Client ID** section

_Example of Client ID:_ https://dev.twitch.tv/console/apps/**xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"**

Next you must generate a **Client Secret** that will be used like a password to allow your application to be recognized by Twitch

Copy and paste this secret somewhere safe until it is needed

Load and use the following code from  <code> usethis </code>

```{r, eval = FALSE}
library(usethis)
edit_r_environ()
```

This will open your .Renviron file in your text editor. Now, you can paste your **Client ID** and **Client Secret**

```{r, eval = FALSE}
TWITCH_CLIENT_ID = YOUR_CLIENT_ID
TWITCH_CLIENT_SECRET = YOUR_CLIENT_SECRET
```

Save the file and restart R for the changes to take effect


Connect to the Twitch API using code

```{r, eval = FALSE}
#setup authentication
twitch_auth()
```

Once you this code has been  run you can begin making requests

Test that you set up the package correctly by running this code

```{r, eval = FALSE}
#pulls information on top 15 streams currently live and in english
Streams_live = get_streams(first = 15, language = "en")
#> # A tibble: 15 x 11
#>    id    user_id user_name game_id type  title viewer_count started_at language
#>    <chr> <chr>   <chr>     <chr>   <chr> <chr>        <int> <chr>      <chr>   
#>  1 1900~ 228592~ DreamHac~ 32399   live  "LIV~        60862 2020-06-0~ en      
#>  2 3857~ 7601562 Chess     743     live  "Che~        52289 2020-06-0~ en      
#>  3 3857~ 262614~ Asmongold 18122   live  "SHA~        39309 2020-06-0~ en      
#>  4 3857~ 504976~ PardonMy~ 271198  live  "DUG~        30313 2020-06-0~ en      
#>  5 3857~ 173375~ DrDisres~ 512710  live  "Gam~        30263 2020-06-0~ en      
#>  6 3857~ 231613~ LIRIK     516867  live  "HAL~        23891 2020-06-0~ en      
#>  7 3857~ 444455~ pokimane  27471   live  "cha~        21049 2020-06-0~ en      
#>  8 1903~ 198182~ MrSavage  33214   live  "Tri~        19693 2020-06-0~ en      
#>  9 3857~ 1423946 Gernader~ 497057  live  "New~        19236 2020-06-0~ en      
#> 10 3857~ 155648~ NICKMERCS 512710  live  "MFA~        17108 2020-06-0~ en      
#> 11 3857~ 520918~ Castro_1~ 32982   live  "tox~        16638 2020-06-0~ en      
#> 12 3857~ 106013~ Pestily   491931  live  "Dro~        16546 2020-06-0~ en      
#> 13 3857~ 269911~ Hiko      516575  live  "100~        16401 2020-06-0~ en      
#> 14 3857~ 297959~ nl_Kripp  138585  live  "NEW~        15389 2020-06-0~ en      
#> 15 3857~ 514960~ loltyler1 21779   live  "oh ~        15283 2020-06-0~ en      
#> # ... with 2 more variables: thumbnail_url <chr>, tag_ids <list>
```

If you get a result similiar to the example above you are successfully connected

## Usage

Currently the TwitchAPI package only has one function that pulls the top 100 streams  top 100 streams currently active and compiles all of the titles into a wordcloud showcasing the most popular terms used in these titles . 

This is achieved by using the command 

```{r, eval = FALSE}
#setup authentication
top100_streams_title_wordcloud()
```

This function is helpful for those studying ongoing trends in the Twitch community as well as those who are looking to see what information is relevant and needed in their own stream titles. 
