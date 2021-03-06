% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_mlb_pitcheo.R
\name{get_mlb_pitcheo}
\alias{get_mlb_pitcheo}
\title{Estadistica oficial de pitcheo de la MLB (baseball)}
\usage{
get_mlb_pitcheo(year, quiet = FALSE)
}
\arguments{
\item{year}{numeric}

\item{quiet}{character}
}
\value{
Estadisticas de la pagina oficial mlb.com
}
\description{
Estadistica oficial de pitcheo de la MLB (baseball)
}
\examples{
# year = año que queremos visualizar
# quiet = indica que se esta cargando la tabla
# Get las estadisticas de pitcheo del 1975
\donttest{get_mlb_pitcheo(1975)}

}
