%
\name{temp_convert}
\alias{temp_convert}
\title{Converts temperature}
\usage{
temp_convert(tp, to =  c("f2c", "c2f", "f2k", "c2k", "k2c", "k2f"))
}
\arguments{
\item{tp}{a vector temperature}

\item{to}{type to be converted. f2c: Fahrenheit to Celsius; c2f: Celsius to	Fahrenheit; f2k: Fahrenheit to Kelvin; k2f: Kelvin to Fahrenheit; c2f: Celsius to Kelvin and k2c: Kelvin to Celsius}
}
\value{
a vector temperature
}
\description{
Convert temperature
}
\examples{
dd = data.frame(t = c(23, 24, 25, 25))
temp_convert(dd, "c2f")
}
