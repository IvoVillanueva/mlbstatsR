#' @title Estadisticas de los jugadores de la MLB en ESPN
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
#' espn_player_stats(2015, "pitching", "regular")
#'
#'
#'

espn_player_stats <- function(year = year_actual, stats = "batting", season_type = "regular" ){

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

  url <-  glue::glue("https://www.espn.com/mlb/stats/player/_/view/{stats}/season/{year}/seasontype/{season_type}&limit=200")


  batting_n <- c("year", "season_type", "rank", "name", "team", "pos", "games_played", "at_bats",
                 "runs", "hits", "batting_avg","doubles", "triples", "home_runs", "runs_batted_in",
                 "total_bases", "walks","strikeouts", "stolen_bases", "on_base_pct",
                 "slugging_pct","opb_slg_pct", "war")

  pitching_n  <-  c("year", "season_type","rank", "name", "team", "pos", "games_played", "games_started",
                    "quality_starts", "earned_run_avg", "wins", "losses", "saves", "holds",
                    "innings_pitched", "hits", "earned_runs", "home_runs", "walks", "strikeouts",
                    "strikes_x_9_i", "war", "whip")

  fielding_n <- c("year", "season_type", "rank", "name", "team", "pos", "games_played",
                  "games_started", "full_innings", "total_chances", "putouts", "assists",
                  "fielding_pct", "errors", "double_plays", "range_factor", "passed_balls",
                  "stolen_bases_allowed", "caught_stealing", "caught_stealing_pct", "dwar")

  fix_names <- dplyr::case_when(
    stats == "batting" ~ list(batting_n),
    stats == "pitching" ~ list(pitching_n),
    stats == "fielding" ~ list(fielding_n)
  )[[1]]

  espn <- url %>%
    rvest::read_html() %>%
    rvest::html_table(fill = TRUE) %>%
    dplyr::bind_cols() %>%
    janitor::clean_names() %>%
    dplyr::as_tibble() %>%
    dplyr::mutate(team = stringr::str_extract(.data$name, "[^.[::a-z::]]+$"),
                  name = stringr::str_remove(.data$name, "[^.[::a-z::]]+$"),
                  name = stringr::str_squish(.data$name),
                  year = year,
                 season_type = dplyr::if_else(season_type == 2, "regular", "playoffs")
      )%>%
    dplyr::select(
      "year", "season_type", "rk", "name", "team", dplyr::everything()
    ) %>%
    purrr::set_names(nm = fix_names)


  return(espn)

}


