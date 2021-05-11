
# mlbstatsR

El objetivo de mlbstatsR es recopilar y proporcionar estadisticas de jugadores y 
equipos, con fotos, logos y colores de la liga profesional de Baseball MLB
---
## Installation


``` r
# install.packages("devtools")
devtools::install_github("IvoVillanueva/mlbstatsR")
```

## Example

``` r
library(mlbstatsR)
``` 

``` r
#Extrae la lista de jugadores
get_mlb_players()

id_player     espn_nombres                                                      cabezas         mlb_names liga league division  location  mascot
1     39948       John Means https://a.espncdn.com/i/headshots/mlb/players/full/39948.png Baltimore Orioles   AL    mlb  AL East Baltimore Orioles
2     31214      Matt Harvey https://a.espncdn.com/i/headshots/mlb/players/full/31214.png Baltimore Orioles   AL    mlb  AL East Baltimore Orioles
3     41118 Bruce Zimmermann https://a.espncdn.com/i/headshots/mlb/players/full/41118.png Baltimore Orioles   AL    mlb  AL East Baltimore Orioles
4     33833      Jorge Lopez https://a.espncdn.com/i/headshots/mlb/players/full/33833.png Baltimore Orioles   AL    mlb  AL East Baltimore Orioles
5     34950      Dillon Tate https://a.espncdn.com/i/headshots/mlb/players/full/34950.png Baltimore Orioles   AL    mlb  AL East Baltimore Orioles
6     33909         Paul Fry https://a.espncdn.com/i/headshots/mlb/players/full/33909.png Baltimore Orioles   AL    mlb  AL East Baltimore Orioles
                                                            logo team primary secondary tertiary quaternary
1 https://www.mlbstatic.com/team-logos/team-cap-on-light/110.svg  BAL #DF4601   #000000  #FC4C02    #27251F
2 https://www.mlbstatic.com/team-logos/team-cap-on-light/110.svg  BAL #DF4601   #000000  #FC4C02    #27251F
3 https://www.mlbstatic.com/team-logos/team-cap-on-light/110.svg  BAL #DF4601   #000000  #FC4C02    #27251F
4 https://www.mlbstatic.com/team-logos/team-cap-on-light/110.svg  BAL #DF4601   #000000  #FC4C02    #27251F
5 https://www.mlbstatic.com/team-logos/team-cap-on-light/110.svg  BAL #DF4601   #000000  #FC4C02    #27251F
6 https://www.mlbstatic.com/team-logos/team-cap-on-light/110.svg  BAL #DF4601   #000000  #FC4C02    #27251F
```
---
``` r
#Extrae la lista de los equipos

get_mlb_teams()

                  name liga league   division  location       mascot                                                           logo team primary secondary tertiary
1 Arizona Diamondbacks   NL    mlb    NL West   Arizona Diamondbacks https://www.mlbstatic.com/team-logos/team-cap-on-light/109.svg  ARI #A71930   #E3D4AD  #000000
2       Atlanta Braves   NL    mlb    NL East   Atlanta       Braves https://www.mlbstatic.com/team-logos/team-cap-on-light/144.svg  ATL #CE1141   #13274F  #EAAA00
3    Baltimore Orioles   AL    mlb    AL East Baltimore      Orioles https://www.mlbstatic.com/team-logos/team-cap-on-light/110.svg  BAL #DF4601   #000000  #FC4C02
4       Boston Red Sox   AL    mlb    AL East    Boston      Red Sox https://www.mlbstatic.com/team-logos/team-cap-on-light/111.svg  BOS #BD3039   #0C2340     <NA>
5         Chicago Cubs   NL    mlb NL Central   Chicago         Cubs https://www.mlbstatic.com/team-logos/team-cap-on-light/112.svg  CHC #0E3386   #CC3433     <NA>
6    Chicago White Sox   AL    mlb AL Central   Chicago    White Sox https://www.mlbstatic.com/team-logos/team-cap-on-light/145.svg  CHW #27251F   #C4CED4  #002663
  quaternary
1    #30CED8
2    #CE1141
3    #27251F
4       <NA>
5       <NA>
6    #CC092F
> 
```
get_png_logos()

<img width="482" alt="imagen_1" src="https://user-images.githubusercontent.com/56939175/117878970-a8b9db80-b2a6-11eb-97a9-0671c7657b89.png">

get_mlb_bateo()
<img width="980" alt="imagen_2" src="https://user-images.githubusercontent.com/56939175/117879187-f59db200-b2a6-11eb-83bf-a648b8a7d2dc.png">

get_mlb_pitcheo()
<img width="973" alt="imagen_3" src="https://user-images.githubusercontent.com/56939175/117879226-01897400-b2a7-11eb-945a-b4bd6b079f98.png">

get_reference_players_mlb(1945, “batting”, “value”)

A tibble: 547 x 27
  year stats stats_type rk    name  age   tm    g     pa    rbat  rbaser rdp  
 <dbl> <chr> <chr>      <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr>  <chr>
  1945 batt… value      1     Ace … 35    NYG   65    20    -2    0      0    
  1945 batt… value      2     Bust… 30    2TM   154   707   15    0      1    
  1945 batt… value      3     Morr… 29    2TM   70    174   -1    -1     1    
  1945 batt… value      4     Nate… 31    BSN   22    53    -5    0      0    
  1945 batt… value      5     Stan… 28    2TM   34    89    -4    1      0    
  1945 batt… value      6     John… 29    2TM   127   540   -16   -2     -1   
  1945 batt… value      7     Pete… 41    2TM   8     5     0     0      0    
  1945 batt… value      8     Luke… 38    CHW   18    70    7     0      0    
  1945 batt… value      9     Joe … 22    PHA   10    18    -3    0      0    
  1945 batt… value      10    Jim … 28    CLE   25    61    -1    0      0    
  with 537 more rows, and 15 more variables: rfield <chr>, rpos <chr>,
  raa <chr>, waa <chr>, rrep <chr>, rar <chr>, war <chr>,
  waa_wl_percent <chr>, x162wl_percent <chr>, o_war <chr>, d_war <chr>,
  o_rar <chr>, salary <chr>, acquired <chr>, pos_summary <chr>
