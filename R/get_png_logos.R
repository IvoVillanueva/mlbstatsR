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
#' \donttest{get_png_logos()}
#'
  get_png_logos <- function() {
   message("4 MLB ESPN logos in png!")
   team_url <- "https://site.api.espn.com/apis/site/v2/sports/baseball/mlb/teams?&limit=50"
   raw_teams <- jsonlite::read_json(team_url)
   raw_teams$sports[[1]]$leagues[[1]]$teams %>%
   tibble::enframe() %>%
   dplyr::select(-"name") %>%
   tidyr::unnest_wider("value") %>%
   tidyr::unnest_wider("team") %>%
   dplyr::select(-"record", -"links") %>%
   dplyr::as_tibble()  %>%
   dplyr::mutate("logoDefault" = purrr::map_chr(.data$logos, function(df) df[[1]][[1]]),
                 "logoDark" = purrr::map_chr(.data$logos, function(df) df[[2]][[1]]),
                 "logoScoreboard" = purrr::map_chr(.data$logos, function(df) df[[3]][[1]]),
                 "logoDarkScoreboard" = purrr::map_chr(.data$logos, function(df) df[[4]][[1]])) %>%
    dplyr::select("id", "name":"alternateColor",-"shortDisplayName", "logoDefault":"logoDarkScoreboard") %>%
    purrr::set_names(
      nm = c(
        "uid", "team_name", "team_nickname", "full_name", "team_color",
        "alternate_color", "logologodefault", "logodark", "logoscoreboard", "logodarkscoreboard"
      )) %>%
    dplyr::mutate(
      "team_color" = paste0("#", .data$team_color),
      "alternate_color" = paste0("#", .data$alternate_color)

      )

  }
