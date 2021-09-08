#' @title Clasificaciones de los equipos de la MLB en Baseball Reference
#' @param year  numeric
#' @return Estadisticas de la MLB en baseball-reference.com
#' @export
#' @import tidyr dplyr purrr janitor rvest stringr
#' @importFrom dplyr %>%
#' @importFrom glue glue
#' @importFrom janitor clean_names
#' @importFrom xml2 read_html
#' @examples
#' # year = year que queremos visualizar
#' # Get las estadisticas de pitcheo de 1873
#'  \donttest{get_reference_team_standings(2021)}
#'


# https://www.baseball-reference.com/leagues/majors/2021-standings.shtml#expanded_standings_overall


get_reference_team_standings <- function(year = year_actual){

  year_actual <- as.double(substr(Sys.Date(), 1, 4))

  if (!dplyr::between(as.numeric(year), 1876, year_actual)) {
    stop(paste("Please choose season between 1876 and", year_actual))
  }
  referenceurl <- glue::glue("https://www.baseball-reference.com/leagues/majors/{year}-standings.shtml")
  df <- referenceurl %>%
    xml2::read_html() %>%
    rvest::html_nodes(xpath = "//comment()") %>%
    rvest::html_text() %>%
    paste(collapse = "") %>%
    xml2::read_html() %>%
    rvest::html_element("#expanded_standings_overall") %>%
    rvest::html_table(fill = TRUE)%>%
    janitor::clean_names()%>%
    dplyr::filter("tm" !="Average") %>%
    dplyr::mutate("year" = year) %>%
    dplyr::select(year,
                  dplyr::everything())
 return(df)

}



