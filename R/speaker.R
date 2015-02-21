#' Listup favorite spearker's material
#' 
#' @import dplyr
#' @param id
#' @param max
#' @examples speaker(id = "u_ribo", max = 2)
#' @export
speaker <- function (id = NULL, max = 5) {
  tmp <- filter(JRSlide, Speaker == id)
  tmp[1:max, ]
}