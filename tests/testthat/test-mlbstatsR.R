

test_that("Check Names", {

  df_mlb <- get_mlb_teams()
  names_teams <-
    df_mlb <- df_mlb %>% names()
  columna_names <- c("name",
                     "liga",
                     "league",
                     "division",
                     "location",
                     "mascot",
                     "logo",
                     "team",
                     "primary",
                     "secondary",
                     "tertiary",
                     "quaternary")

  expect_equal(object = names_teams, expected = columna_names)
})



test_that("Check Names1", {
  df_mlb_data <- get_mlb_players()
  names_teams1 <-
    df_mlb_data <- df_mlb_data %>% names()
  columna_names1 <- c("id_player",
                      "espn_nombres",
                      "cabezas",
                      "mlb_names",
                      "liga",
                      "league",
                      "division",
                      "location",
                      "mascot",
                      "logo",
                      "team",
                      "primary",
                      "secondary",
                      "tertiary",
                      "quaternary")


  expect_equal(object = names_teams1, expected = columna_names1)
})
