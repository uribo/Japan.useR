#' Listup favorite spearker's material
#' 
#' @import dplyr
#' @param id user name
#' @examples speaker(id = "u_ribo")
#' @export
speaker <- function (id = NULL) {
  tmp <- filter(JRSlide, Speaker == id)
  tmp[1:length(tmp), ]
}