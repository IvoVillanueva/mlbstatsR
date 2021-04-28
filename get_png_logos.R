#' @title  4 png Logos & colors for MLB (baseball)
#'
#' @description MLB Profesional league baseball data table , logos and colors
#'
#' @return Logos and colors
#' @export
#' @importFrom jsonlite fromJSON
#' @import dplyr purrr
#' @importFrom utils sessionInfo
#' @importFrom janitor clean_names
#' @examples
#'
#'
#' get_png_logos()
#'
  get_png_logos <- function() {
  message("4 MLB ESPN logos in png!")
  team_url <- "http://site.api.espn.com/apis/site/v2/sports/baseball/mlb/teams"
  raw_teams <- jsonlite::fromJSON(team_url)

     dm <-  purrr::pluck(raw_teams,
                         "sports",
                         "leagues",
                         1, "teams",
                         1,
                         "team") %>%
      dplyr::as_tibble() %>%
      dplyr::mutate(logoDefault = purrr::map_chr(logos, function(df) df[1, 1]),
                    logoDark = purrr::map_chr(logos, function(df) df[2, 1]),
                    logoScoreboard = purrr::map_chr(logos, function(df) df[3, 1]),
                    logoDarkScoreboard = purrr::map_chr(logos, function(df) df[4, 1])
                    ) %>%
      dplyr::select("id",
                    "slug",
                    "location",
                    "name",
                    "abbreviation",
                    "displayname" = "displayName",
                    "shortDisplayName",
                    "primary" = "color",
                    "secondary" = "alternateColor",
                    "logoDefault",
                    "logoDark",
                    "logoScoreboard",
                    "logoDarkScoreboard") %>%janitor::clean_names() %>%
    dplyr::mutate(
                    "primary" = paste0("#", "primary"),
                    "secondary" = paste0("#", "secondary"))

return(dm)
}


