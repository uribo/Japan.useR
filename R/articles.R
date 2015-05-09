#' JRBlogger's article and entry
#' 
#' @import RCurl
#' @import XML
#' @import rvest
#' @param n integer. as return article numbers.
#' @export
articles <- function() {
  
  
}


library(RCurl)
library(XML)
library(rvest)
library(rlist)
library(tidyr)
library(pforeach)

df <- read.csv("inst/assets/raw_data/JapanRWebsite.csv", header = TRUE)
xml.url <- paste(df[1, 4])

url <- "http://d.hatena.ne.jp/teramonagi/"
url <- "http://blog.goo.ne.jp/r-de-r"

url <- c("http://d.hatena.ne.jp/teramonagi/", "http://blog.goo.ne.jp/r-de-r")

df <- read.csv("tmp.csv", header = TRUE)
url <- df$url
rss.url <- list()
for (i in 1:length(url)) {
  url[i] %>% paste(.) %>% html() %>% html_nodes(., "head link") %>% {
    res0 <<- .
    res <<- html_attr(., "type")
    res2 <<- res %>% grep("rss", x = ., value = FALSE)
  }
  res0[res2[1]] %>% html_attr("href") -> rss.url[i]
}


for (i in 1:length(url)) {
  url[i] %>% html() %>% html_nodes(., "head link") %>% {
    res0 <<- .
    res <<- html_attr(., "type")
    res2 <<- res %>% grep("rss", x = ., value = FALSE)
  }
  res0[res2[1]] %>% html_attr("href") -> rss.url[i]
}

url %>% html() %>% html_nodes(., "head link") %>% {
  res0 <<- .
  res <<- html_attr(., "type")
  res2 <<- res %>% grep("rss", x = ., value = FALSE)
}

res0[res2[1]] %>% html_attr("href") -> rss.url
# [1] "http://d.hatena.ne.jp/teramonagi/rss"
## ---- RSSのURLは取得できた --------------------------------------------------------------------


xmlParse(rss.url[[1]]) %>% xmlToList() -> res
res$channel$title # My Life as a Mock Quant

res[[2]]$title

doc <- xmlTreeParse(xml.url)
xpathApply(xmlRoot(doc), "//entry") 
script  <- getURL(xml.url)

xpathApply(xmlRoot(doc), "//entry") 
doc     <- xmlParse(script)
titles    <- xpathSApply(doc,'//item/title',xmlValue)
# descriptions    <- xpathSApply(doc,'//item/description',xmlValue)
pubdates <- xpathSApply(doc,'//item/pubDate',xmlValue)
