%
\name{rtr_mixing}
\alias{rtr_mixing}
\title{Relative Thermal Resistance to Mixing (RTRM)}
\usage{
rtr_mixing(dt,...)
}
\arguments{
\item{dt}{data.table or dataframe with date, depth and water temperature}

\item{...}{parameters sent to \code{water_density}}
}
\value{
A data.table or data.frame with date e or group, layers and rtrm
}
\description{
This function estimate RTRM - Another important aspect of stratification in freshwater is that the change
in density of water becomes greater as temperature increases. Thus, a few
degrees difference between surface and bottom at high temperature will
provide more stability (resistance to mixing) than the same degree change
at low temperature. This is illustrated by the term relative thermal resistance
to mixing (RTRM), which compares the density gradient against the density
gradient between 4 and 5 degrees Celsius.
}

\references{
Welch, E. B. & Jacoby, Jean M. (2004). Pollutant effects in freshwater: applied limnology 3nd
Wetzel, Robert A. &  Likens, Gene E. (1991). Limnological analyses 2nd
}
\seealso{
\code{\link{water_density}}
}
