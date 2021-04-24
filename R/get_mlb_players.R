#' @title Photos & Logos a& colors for MLB (baseball)
#'
#' @description MLB Profesional league baseball data table with Photos, logos and colors
#'
#' @return Photos, logos and colors
#' @export
#' @import utils
#' @examples
#' get_mlb_players()
#'
get_mlb_players <- function() {

  get_mlb_players <- utils::read.csv("https://raw.githubusercontent.com/IvoVillanueva/dataMLB/main/dataMLB.csv", stringsAsFactors = FALSE)

  return(get_mlb_players)

}
