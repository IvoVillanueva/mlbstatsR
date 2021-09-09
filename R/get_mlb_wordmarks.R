#' @title Wordmarks & colors for MLB (baseball)
#'
#' @description MLB Profesional league baseball data table , Wordmarks
#'
#' @return Wordmarks and colors
#' @export
#' @importFrom jsonlite fromJSON
#' @import dplyr stringr rvest
#' @importFrom utils sessionInfo
#' @examples
#'
#'
#' \donttest{get_mlb_wordmarks()}
#'

get_mlb_wordmarks <- function() {
  
  message("MLB teams wordmarks and colors!")
  
  url <- "https://sportslogohistory.com/mlb-wordmark-logo" %>%
    rvest::read_html()
  
  
  l <- tibble(
    tm = url %>% rvest::html_elements("a") %>% rvest::html_attr("href") %>% .[39:68],
    wordmark = url %>% rvest::html_elements("img") %>% rvest::html_attr("src") %>% .[6:35]
  ) %>%
    dplyr::mutate(
      tm = stringr::str_replace_all(tm, c("/" = "", "-" = " ", " wordmark logo" = "")),
      tm = stringr::str_to_title(tm),
      tm = case_when(
        tm == "St Louis Cardinals" ~ "St. Louis Cardinals",
        TRUE ~ tm
      ),
      wordmark = case_when(
      wordmark == "https://sportslogohistory.com/wp-content/uploads/2018/04/los_angeles_dodgers_2012-pres_w.png" ~"https://sportslogohistory.com/wp-content/uploads/2018/04/los_angeles_dodgers_2012-pres-w-150x150.png",
      wordmark == "https://sportslogohistory.com/wp-content/uploads/2019/01/miami_marlins_2019-pres-w.png" ~"https://sportslogohistory.com/wp-content/uploads/2019/01/miami_marlins_2019-pres_w-150x150.png",
      wordmark == "https://sportslogohistory.com/wp-content/uploads/2018/03/chicago_cubs_1979-pres_w.png"~ "https://sportslogohistory.com/wp-content/uploads/2018/03/chicago_cubs_1937-pres_w.png",
        TRUE ~ wordmark
      )
    )
  
  df <- utils::read.csv("https://raw.githubusercontent.com/IvoVillanueva/dataMLB/main/MLBlogos.csv", stringsAsFactors = FALSE) %>%
    dplyr::select(tm = name, team, division, primary:quaternary) %>%
    dplyr::mutate(
      tm = str_squish(tm),
      division = stringr::str_extract(division, "\\w+$")
    ) %>%
    left_join(l, by = c("tm"))
  
  return(df)
  
}
