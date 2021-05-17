

# mlbstatsR
![netratingmlb-01](https://user-images.githubusercontent.com/56939175/117880956-f6cfde80-b2a8-11eb-8d75-5c6948a7a284.png)

![wardf_heads](https://user-images.githubusercontent.com/56939175/117881069-1a932480-b2a9-11eb-83dc-006fa0a1dcef.png)


El objetivo de mlbstatsR es recopilar y proporcionar estadisticas de jugadores y 
equipos, con fotos, logos y colores de la liga profesional de Baseball MLB
---
## Installation

The **mlbstatsR** package can be installed from **CRAN** with:

```{r install_cran, eval=FALSE}
install.packages("mlbstatsR")
```
And

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

> get_reference_players_mlb( 1945, "batting", "value")
``` r
LOADING 1945 batting value from the index:
'advanced', 'value', 'probability', 'ratio', 'baserunning', 'standard'
'pitchesbatting', 'neutralizedbatting','situational', 'baserunning' o 'cumulative'
# A tibble: 547 x 27
    year stats   stats_type rk    name            age   tm    g     pa    rbat  rbaser rdp   rfield rpos  raa   waa   rrep  rar   war   waa_wl_percent x162wl_percent o_war d_war o_rar salary    acquired             pos_summary
   <dbl> <chr>   <chr>      <chr> <chr>           <chr> <chr> <chr> <chr> <chr> <chr>  <chr> <chr>  <chr> <chr> <chr> <chr> <chr> <chr> <chr>          <chr>          <chr> <chr> <chr> <chr>     <chr>                <chr>      
 1  1945 batting value      1     Ace Adams       35    NYG   65    20    -2    0      0     0      2     0     0.1   0     0     0.1   .501           .500           0.1   0.0   0     ""        "Rule 5 Draft"       1          
 2  1945 batting value      2     Buster Adams    30    2TM   154   707   15    0      1     -3     -2    11    1.1   21    32    3.2   .507           .507           3.5   -0.5  35    ""        "Traded"             *87/H      
 3  1945 batting value      3     Morrie Aderholt 29    2TM   70    174   -1    -1     1     1      -1    -2    -0.2  6     4     0.4   .498           .499           0.3   0.0   3     ""        "Traded"             H7/49      
 4  1945 batting value      4     Nate Andrews    31    BSN   22    53    -5    0      0     0      5     0     0.0   0     0     0.0   .499           .500           0.0   0.0   0     ""        "Traded"             1/H        
 5  1945 batting value      5     Stan Andrews    28    2TM   34    89    -4    1      0     -2     1     -4    -0.5  3     -2    -0.2  .486           .498           0.0   -0.1  0     ""        ""                   2/H        
 6  1945 batting value      6     John Antonelli  29    2TM   127   540   -16   -2     -1    -10    1     -28   -3.0  17    -11   -1.3  .477           .483           -0.2  -0.9  -1    ""        "Traded"             *54/H36    
 7  1945 batting value      7     Pete Appleton   41    2TM   8     5     0     0      0     0      0     0     0.0   0     0     0.0   .500           .500           0.0   0.0   0     "$9,200"  "Free Agency"        /1         
 8  1945 batting value      8     Luke Appling    38    CHW   18    70    7     0      0     -1     1     8     0.8   2     10    1.0   .546           .505           1.2   0.0   11    "$11,000" "Purchased"          6/H        
 9  1945 batting value      9     Joe Astroth     22    PHA   10    18    -3    0      0     -3     0     -5    -0.6  1     -5    -0.6  .438           .496           -0.2  -0.3  -2    "$2,400"  "Amateur Free Agent" /2H        
10  1945 batting value      10    Jim Bagby       28    CLE   25    61    -1    0      0     0      5     5     0.6   0     5     0.6   .523           .504           0.6   0.0   5     "$10,200" "Traded"             1       
```
mlb_player_full( 1990, "hitting", "playoffs")

``` r
Getting hitting stats de los playoffs del 1990!
# A tibble: 81 x 72
   season_type stat   year  player_id player_name   rank player_full_name player_first_name player_last_name player_use_name player_init_last… team_id team_abbrev team_name    team_short_name league_name league_id position_abbrev
   <chr>       <chr>  <chr>     <int> <chr>        <int> <chr>            <chr>             <chr>            <chr>           <chr>               <int> <chr>       <chr>        <chr>           <chr>           <int> <chr>          
 1 Post Season hitti… 1990     110680 Billy Bates      1 Billy Bates      William           Bates            Billy           B Bates               113 CIN         Cincinnati … Reds            NL                104 X              
 2 Post Season hitti… 1990     111410 Sid Bream        2 Sid Bream        Sidney            Bream            Sid             S Bream               134 PIT         Pittsburgh … Pirates         NL                104 1B             
 3 Post Season hitti… 1990     115602 Billy Hatch…     3 Billy Hatcher    William           Hatcher          Billy           B Hatcher             113 CIN         Cincinnati … Reds            NL                104 CF             
 4 Post Season hitti… 1990     111153 Wade Boggs       4 Wade Boggs       Wade              Boggs            Wade            W Boggs               111 BOS         Boston Red … Red Sox         AL                103 3B             
 5 Post Season hitti… 1990     121606 Chris Sabo       5 Chris Sabo       Christopher       Sabo             Chris           C Sabo                113 CIN         Cincinnati … Reds            NL                104 3B             
 6 Post Season hitti… 1990     116529 Doug Jennin…     6 Doug Jennings    James             Jennings         Doug            D Jennings            133 OAK         Oakland Ath… Athletics       AL                103 X              
 7 Post Season hitti… 1990     119946 Ron Oester       6 Ron Oester       Ronald            Oester           Ron             R Oester              113 CIN         Cincinnati … Reds            NL                104 X              
 8 Post Season hitti… 1990     120028 Paul O'Neill     8 Paul O'Neill     Paul              O'Neill          Paul            P O'Neill             113 CIN         Cincinnati … Reds            NL                104 RF             
 9 Post Season hitti… 1990     110456 Harold Bain…     9 Harold Baines    Harold            Baines           Harold          H Baines              133 OAK         Oakland Ath… Athletics       AL                103 DH             
10 Post Season hitti… 1990     110826 Jay Bell        10 Jay Bell         Jay               Bell             Jay             J Bell                134 PIT         Pittsburgh … Pirates         NL                104 SS     
```
