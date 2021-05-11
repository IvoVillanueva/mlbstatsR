#' @title Estadistica oficial bateo y pitcheo de los equipos de la MLB (baseball)
#' @param year  numeric
#' @param stats character
#' @param season_type character
#' @return Estadisticas de la pagina oficial mlb.com
#' @export
#' @import tidyr dplyr purrr
#' @importFrom dplyr %>%
#' @importFrom jsonlite fromJSON
#' @importFrom glue glue
#' @importFrom janitor clean_names
#' @examples
#' # year = year que queremos visualizar
#' # stats = hitting o pitching
#' # season_type = 'regular', 'playoffs', 'wildcard',
#' # 'divisionales', 'championship','mundiales' o 'pretemporada
#' # Get las estadisticas de pitcheo del 2018
#' # mlb_team_stats(2018, "pitching", "regular")
#'


mlb_team_stats <- function(year = year_actual, stats= "hitting", season_type = "regular"){

   year_actual <- as.double(substr(Sys.Date(), 1, 4))


    if (!dplyr::between (as.numeric(year), 1903, year_actual)) {
     stop(paste("Por favor escoge un year entre 1903 y ", year_actual))
    }
   if (!season_type %in% c("regular", "playoffs", "wildcard",
                           "divisionales","championship","mundiales","pretemporada")) {
     stop("Please choose one season of 'regular', 'playoffs', 'wildcard', 'divisionales', 'championship',
                            'mundiales' o 'pretemporada'")
   }
   if (!stats %in% c("hitting", "pitching")) {
     stop("Please choose season_type of 'hitting' o 'pitching'")
   }


   message(
     dplyr::case_when(
       season_type == "regular"~ glue::glue("Getting {stats} stats de la {season_type} season del {year}!"),
       season_type == "playoffs" ~ glue::glue("Getting {stats} stats de los {season_type} del {year}!"),
       season_type == "wildcard" ~ glue::glue ("Getting {stats} stats del {season_type} del {year}!"),
       season_type == "divisionales" ~ glue::glue ("Getting {stats} stats de las series {season_type} del {year}!"),
       season_type == "championship" ~ glue::glue ("Getting {stats} stats de la league {season_type} series del {year}!"),
       season_type == "mundiales" ~ glue::glue ("Getting {stats} stats de las series {season_type} del {year}!"),
       season_type == "pretemporada" ~ glue::glue ("Getting {stats} stats de la {season_type} del {year}!")
       )
     )[[1]]


  season_type <- dplyr::case_when( season_type == "regular" ~ "R",
                                   season_type == "playoffs" ~ "P",
                                   season_type == "wildcard"~ "F",
                                   season_type == "divisionales" ~ "D",
                                   season_type == "championship" ~ "L",
                                   season_type == "mundiales" ~ "W",
                                   season_type == "pretemporada" ~ "S")[[1]]


  orden <-  dplyr::case_when( stats == "hitting" ~ "onBasePlusSlugging",
                              stats == "pitching" ~ "earnedRunAverage")[[1]]


  urls <- glue::glue("https://bdfed.stitch.mlbinfra.com/bdfed/stats/team?stitch_env=prod&sportId=1&gameType={season_type}&group={stats}&order=desc&sortStat={orden}&stats=season&season={year}&limit=30&offset=0")

  raw_mlb <- jsonlite::fromJSON(urls)
  df <- purrr::pluck(raw_mlb ,"stats") %>%
    dplyr::as_tibble() %>%
    janitor::clean_names() %>%
    dplyr::as_tibble() %>%
    dplyr::mutate(stat = stats,
                  season_type = case_when( season_type == "R" ~ "Regular Season",
                                           season_type == "P" ~ "Post Season",
                                           season_type == "F" ~ "Wild Card",
                                           season_type == "D" ~ "Division Series",
                                           season_type == "L" ~ "League Championship Series",
                                           season_type == "W" ~ "World Series",
                                           season_type == "S" ~ "Spring Training",
                                           TRUE ~ season_type))%>%

    dplyr::select(
      "season_type", "stat", "year",  dplyr::everything(),-"type" )

  return(df)



}








