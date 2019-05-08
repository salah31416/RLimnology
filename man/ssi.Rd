%
\name{ssi}
\alias{ssi}
\title{Calculate the Schmidt Stability Index (SSI)}
\usage{
ssi(dt, Az, dA, dz = 0.1, ...)
}
\arguments{
\item{dt}{a data.frame with date or group, depth (m) and temperature}

\item{Az}{a numeric vector of area a depth z (m^2)}

\item{dA}{profundidade da area Az (m)}

\item{dz}{passo de sequencia}

\item{...}{parameters sent to \code{water_density}}
}
\value{
a data.table thermal stability (J/m^2)
}
\description{
The computations of thermal stability (S) require a determination of the amount of
work needed to fully destratify a lake instantaneously, without having to consider the
addition or removal of heat requerid over time.
}
\examples{
date = c(as.Date(rep("2017-01-01", 7)), as.Date(rep("2017-02-01", 7)))
grp = c(rep("A", 7), rep("B", 7))
Az = c(1000, 900, 864, 820, 200, 10, 5)
dA = c(0, 2.3, 2.5, 4.2, 5.8, 7, 7.5)
wt = c(28, 27, 26.4, 26, 25.4, 24, 23.3, 28, 27, 26.4, 26, 25.4, 24, 23.3)
z = c(0, 1, 2, 3, 4, 5, 6, 0, 1, 2, 3, 4, 5, 6)

dt = data.frame(grp, z, wt)

ssi(dt, Az, dA)

}
\seealso{
\code{\link{water_density}}
}
