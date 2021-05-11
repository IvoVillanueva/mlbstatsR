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
