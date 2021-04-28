#' @title  Estadistica oficial de bateo de la MLB (baseball)
#' @param year  numeric
#' @param quiet character
#' @return Estadisticas de la pagina oficial mlb.com
#' @export
#' @import tidyr dplyr purrr
#' @importFrom dplyr %>%
#' @importFrom jsonlite fromJSON
#' @importFrom glue glue
#' @importFrom janitor clean_names
#' @examples
#' # year = año que queremos visualizar
#' # quiet = indica que se esta cargando la tabla
#' # Get las estadisticas de bateo del 1975
#' get_mlb_bateo(1975)
#'
#'


get_mlb_bateo <- function(year, quiet= FALSE){

       year <- as.numeric(year)

       offset <- seq(0, 400, 25)

       current_year <- as.double(substr(Sys.Date(), 1, 4))

  if (!dplyr::between (as.numeric(year), 1903, current_year)) {
    stop(paste("Por favor escoge un year entre 1903 y ", current_year))
  }

  if(isFALSE(quiet)){
    message(glue::glue("Cargando {year} con 400 players"))
  }
  urls <- paste0("https://bdfed.stitch.mlbinfra.com/bdfed/stats/player?stitch_env=prod&season=",
                 year,"&sportId=1&stats=season&group=hitting&gameType=R&offset=",
                 offset,
                 "&sortStat=onBasePlusSlugging&order=desc&playerPool=ALL")

          purrr::map(urls, ~jsonlite::fromJSON(.x)) -> crudos

          purrr::map_dfr(crudos, "stats") -> df

  df <- df %>%
          dplyr::select("year","playerId", "playerName", "playerFirstName", "playerLastName",
                      "playerUseName", "playerInitLastName", "teamId":"atBatsPerHomeRun") %>%
          janitor::clean_names()

  return(df)


}


