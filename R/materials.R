#' Broswe Japanese useR Community's material
#' 
#' @import dplyr
#' @param community a character string. select useR community for one of the strings "HijiyamaR", "Hiroshima.R", "Kashiwa.R", "Nagoya.R", "Osaka.R", "SappoRo.R", "Tokyo.R", "Tsukuba.R" or "Yokohama.R".
#' @param number
#' @param session
#' @param browse a logical value indicading wheater the browse material.
#' @examples materials(community = "Tokyo.R")
#' @export
materials <- function (community = c("HijiyamaR", "Hiroshima.R", "Kashiwa.R", "Nagoya.R", "Osaka.R", "SappoRo.R", "Tokyo.R", "Tsukuba.R", "Yokohama.R"), 
                      number = NULL, session = NULL, browse = FALSE) {
  community <- match.arg(community, several.ok = TRUE)
  res <- filter(JRSlide, Community %in% community)
   if (!is.null(number)) { # If when number is NULL else NULL
     if (!is.null(session)) {
       if (browse == FALSE) {
         res <- filter(res, Number == number, Session == session)
       } else {
         res <- filter(res, Number == number, Session == session)
         browseURL(paste(res$Slide)) # When specified all arguments
       }
       return(res)
     }
     res <- filter(res, Number == number)
     return(res)
   }
   return(res) # select Community
}
