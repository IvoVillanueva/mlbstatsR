#' @title  Logos & colors for MLB (baseball)
#'
#' @description MLB Profesional league baseball data table , logos and colors
#'
#' @return Logos and colors
#' @export
#' @import utils
#' @examples
#' \donttest{get_mlb_teams()}
#'
get_mlb_teams <- function() {

  get_mlb_teams <- utils::read.csv("https://raw.githubusercontent.com/IvoVillanueva/dataMLB/main/MLBlogos.csv", stringsAsFactors = FALSE)

  return(get_mlb_teams)

}







