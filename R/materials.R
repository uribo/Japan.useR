#' Japanese useR Community's material
#' 
#' @import dplyr
#' @param community
#' @param number
#' @param session
#' @param browse a logical value indicading wheater the browse material.
#' @examples materials(community = "Tokyo.R")
#' @export
materials <- function (community = c("HijiyamaR", "Hiroshima.R", "Kashiwa.R", "Nagoya.R", "Osaka.R", "SappoRo.R", "Tokyo.R", "Tsukuba.R", "Yokohama.R"), 
                      number = NULL, session = NULL, browse = FALSE) {
  community <- match.arg(community)
  res <- filter(JRSlide, Community == community)
   if (!is.null(number)) { # NULL でなければ、NULLであれば
     if (!is.null(session)) {
       if (browse == FALSE) {
         res <- filter(res, Number == number, Session == session)
       } else {
         res <- filter(res, Number == number, Session == session)
         browseURL(paste(res$Slide)) # すべて指定
       }
       return(res) # どちらも指定、browse = F
     }
     res <- filter(res, Number == number)
     return(res)
   }
   return(head(res)) # Community だけを指定
}
