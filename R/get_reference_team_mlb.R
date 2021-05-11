#' @title Estadisticas de los equipos de la MLB en Baseball Reference
#' @param year  numeric
#' @param stats character
#' @param type character
#' @return Estadisticas de la MLB en baseball-reference.com
#' @export
#' @import tidyr dplyr purrr janitor rvest stringr
#' @importFrom dplyr %>%
#' @importFrom glue glue
#' @importFrom janitor clean_names
#' @importFrom xml2 read_html
#' @examples
#' # year = year que queremos visualizar
#' # stats = batting, pitching, fielding
#' # type = 'standard', 'appearances', 'pitcher', 'catcher', 'firstbase', 'secondbase',
#' # 'thirdbase',  'shortstop', 'leftfield', 'centerfield', 'rightfield', 'outfield'
#' # 'standard', 'advanced', 'value', 'probability', 'ratio', 'baserunning', 'batting',
#' # 'battingagainst', 'startingpitching'
#' #
#' # Get las estadisticas de pitcheo de 1903
#' get_reference_team_mlb(1903, "pitching", "standard")
#'
#'









get_reference_team_mlb <- function(year = year_actual,  stats = "batting", type = "standard" ){

year_actual <- as.double(substr(Sys.Date(), 1, 4))

if (!dplyr::between(as.numeric(year), 1876, year_actual)) {
  stop(paste("Please choose season between 1876 and", year_actual))
}


if (!stats %in% c("batting", "pitching", "fielding")) {
  stop("Please choose stat of 'batting', 'pitching' o 'fielding!'")
}

if (stats == "fielding" & !type %in% c('standard', 'appearances', 'pitcher', 'catcher', 'firstbase', 'secondbase',
                                       'thirdbase',  'shortstop', 'leftfield', 'centerfield', 'rightfield', 'outfield')) {
  stop("Please choose type of 'standard', 'appearances', 'pitcher', 'catcher', 'firstbase', 'secondbase',
                                        'thirdbase',  'shortstop', 'leftfield', 'centerfield', 'rightfield', 'outfield'")
}

if (stats == "batting" & !type %in% c('standard', 'advanced', 'value', 'probability', 'ratio', 'baserunning',
                                      'pitchesbatting', 'neutralizedbatting', 'situational')) {
  stop("Please choose type of 'standard', 'standard', 'advanced', 'value', 'probability', 'ratio', 'baserunning',
                                        'pitchesbatting', 'neutralizedbatting', 'situational'")
}

if (stats == "pitching" & !type %in% c('standard', 'batting', 'value', 'probability', 'ratio', 'battingagainst', 'startingpitching',
                                       'reliefpitching', 'basesituation')) {
  stop("Please choose type of 'standard', 'standard', 'batting', 'value', 'probability', 'ratio', 'battingagainst', 'startingpitching',
                                         'reliefpitching', 'basesituation'")
}

message(
  dplyr::case_when(
    stats == "batting"~ glue::glue("LOADING {year} {stats} {type} from the index:
                                        'advanced', 'value', 'probability', 'ratio', 'baserunning',
                                        'standard', 'pitchesbatting', 'situational' o 'baserunning'"
    ),
    stats == "pitching"~ glue::glue("LOADING {year} {stats} {type} from the index:
                                        'batting', 'value', 'probability', 'ratio', 'battingagainst', 'startingpitching',
                                        'reliefpitching',  'basesituation', 'standard'"
    ),
    stats == "fielding"~ glue::glue("LOADING {year} {stats} {type} from the index:
                                   'appearances', 'pitcher', 'catcher', 'firstbase', 'secondbase', 'thirdbase',
                                            'shortstop', 'leftfield', 'centerfield', 'rightfield', 'outfield'")))
    type <- dplyr::case_when(
      type ==  "pitcher" ~ "specialpos_p",
      type ==  "catcher"~ "specialpos_c",
      type ==  "firstbase" ~ "specialpos_1b",
      type ==  "secondbase" ~ "specialpos_2b",
      type ==  "thirdbase" ~ "specialpos_3b",
      type ==  "shortstop" ~ "specialpos_ss",
      type ==  "leftfield" ~ "specialpos_lf",
      type ==  "centerfield" ~ "specialpos_cf",
      type ==  "rightfield" ~ "specialpos_rf",
      type ==  "outfield" ~ "specialpos_of",
      type ==  "probability"~ "win_probability",
      type ==  "pitchesbatting" ~ "pitches",
      type ==  'pitchespitching' ~ 'pitches',
      type ==  "neutralizedbatting" ~ "neutral",
      type ==  "neutralizedpitching" ~ "neutral",
      type ==  "battingagainst" ~ "batting",
      type ==  "startingpitching" ~ "starter",
      type ==  "reliefpitching" ~ "reliever",
      TRUE~ type)

 situ_n <-  c("years", "stats", "stats_ype", "tm", "run_games", "plate_apparences", "plate_advance_pct", "hits", "infield_hits", "bunt_hits",
              "pinchit_atbats", "pinch_hits", "pinchit_homeruns", "pinchit_runsatbat_in", "pinchit_lave_indx", "home_runs", "grand_slam_hrun",
              "grand_slam_opt","hrunoff_right_handers", "hrunoff_left_handers", "hrun_home", "hrun_road", "inside_park_hrun", "sacrifice_att",
              "sacriface_succes", "sacrifice_succ_pct", "double_play_opp", "double_play_grounded", "double_play_grounded_pct",
              "prdouts_made_fail", "prdouts_succes", "prdouts_pct", "baserun_batter_plate", "baserun_who_score", "baserun_who_score_pct",
              "pas_less2_runneron3", "pas_ls2_run3_score", "pas_ls2_run3_score_pct", "pas_nout_runer_on2", "pas_nout_runer_on2_adv",
              "pas_nout_runer_on2_adv_pct"
             )


    if (!type == "situational") {
      referenceurl <-  glue::glue("https://www.baseball-reference.com/leagues/MLB/{year}-{type}-{stats}.shtml")

    df <- referenceurl %>%
      xml2::read_html() %>%
      rvest::html_node("table") %>%
      rvest::html_table(fill = TRUE) %>%
      janitor::clean_names() %>%
      filter("tm" != "Tm" &
             "tm" !="LgAvg" &
             "tm" != "" ) %>%
      dplyr::mutate("year" = year,
                    "stats" = stats,
                    "stats_type" = type) %>%
      dplyr::select("year", "stats", "stats_type",
                dplyr::everything())
       } else {
    referenceurl <-  glue::glue("https://www.baseball-reference.com/leagues/MLB/{year}-situational-batting.shtml")

    df <- referenceurl %>%
      xml2::read_html() %>%
      rvest::html_node("#teams_situational_batting") %>%
      rvest::html_table(fill = TRUE) %>%
      janitor::clean_names() %>%
      dplyr::slice(-1) %>%
      dplyr::filter(  "x" != "Tm" &
               "x" !="LgAvg" &
               "x" != "" ) %>%
      dplyr::mutate("year" = year,
                    "stats" = stats,
                    "stats_type" = type) %>%
      dplyr::select("year", "stats", "stats_type",
                    dplyr::everything(),
                    -"x_5"
                    ) %>%

      purrr::set_names(nm = situ_n )

                }

    return(df)

}



