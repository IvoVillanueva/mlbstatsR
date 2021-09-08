#' @title Estadisticas de los equipos de la MLB en ESPN
#' @param year  numeric
#' @param stats character
#' @param season_type character
#' @return Estadisticas de la MLB en ESPN
#' @export
#' @import tidyr dplyr purrr janitor rvest stringr
#' @importFrom dplyr %>%
#' @importFrom jsonlite fromJSON
#' @importFrom glue glue
#' @importFrom janitor clean_names
#' @examples
#' # year = year que queremos visualizar
#' # stats = batting, pitching, fielding
#' # season_type = regular o playoffs
#' # Get las estadisticas de pitcheo en playoffs de 2003
#' \donttest{espn_team_stats(2015, "pitching", "regular")}
#'
#'



espn_team_stats <- function(year = year_actual, stats = "batting", season_type = "regular" ){

  year_actual <- as.double(substr(Sys.Date(), 1, 4))


  if (!season_type %in% c("regular", "playoffs")) {
    stop("Please choose season_type of 'regular' or 'playoffs'")
  }

  if (!stats %in% c("batting", "pitching", "fielding")) {
    stop("Please choose season_type of 'batting', 'pitching' o 'fielding!'")
  }

  if (!dplyr::between(as.numeric(year), 2002, year_actual)) {
    stop(paste("Please choose season between 2002 and", year_actual))
  }


  message(
    dplyr::if_else(
      season_type == "regular",
      glue::glue("Getting {stats} stats de la {season_type} season del {year}!"),
      glue::glue("Getting {stats} stats de los {season_type} del {year}!")
    )
  )

  season_type <- dplyr::if_else(season_type == "regular", "2", "3")

  teamsurl <- glue::glue("https://www.espn.com/mlb/stats/team/_/view/{stats}/season/{year}/seasontype/{season_type}")

  batting_t <- c("year", "season_type", "rank", "team", "g_played", "at_bats", "runs",
              "hits", "doubles", "triples", "home_runs", "runs_batted_in",
              "total_bases", "walks", "strikeouts", "stolen_bases", "batting_avg",
              "on_base_pct", "slugging_pct", "opb_pct_slg_pct")

  pitching_t <- c("year", "season_type", "rank", "team", "g_played", "wins", "losses",
                  "earned_run_avg", "saves", "complete_games", "shutouts", "quality_starts",
                  "innings_pitched", "hits", "earned_runs", "home_runs", "walks", "strikeouts",
                  "opponent_batting_avg", "whip")

  fielding_t <- c("year", "season_type","rank", "team", "g_played", "errors", "fielding_percentage",
                  "total_chances", "putouts", "assists")

  fix_names <- dplyr::case_when(
    stats == "batting" ~ list(batting_t),
    stats == "pitching" ~ list(pitching_t),
    stats == "fielding" ~ list(fielding_t)
  )[[1]]

  espn <- teamsurl %>%
    rvest::read_html() %>%
    rvest::html_table(fill = TRUE) %>%
    dplyr::bind_cols() %>%
    janitor::clean_names() %>%
    dplyr::as_tibble() %>%
    dplyr::mutate( team = stringr::str_squish(.data$team),
                   year = year,
                   season_type = dplyr::if_else(season_type == 2, "regular", "playoffs")
  )%>%
    dplyr::select(
      "year", "season_type", "rk", "team", dplyr::everything()
    ) %>%
    purrr::set_names(nm = fix_names)






return(espn)

}


