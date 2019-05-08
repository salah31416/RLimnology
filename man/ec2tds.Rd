%
\name{ec2tds}
\alias{ec2tds}
\title{Electral conductivity (EC) to Total Dissolvid Solids (TDS)}
\usage{
ec2tds(ec, k = 0.64)
}
\arguments{
\item{ec}{a numeric vector of EC (microS/cm)}

\item{k}{a TDS factor}
}
\value{
A numeric vector of TDS (mg/L)
}
\description{
Calculating total dissolved solids from a conductivity measurement in water
}
\details{
When calculating total dissolved solids from a conductivity measurement, a TDS factor is used. 
This TDS constant is dependent on the type of solids dissolved in water, and can be changed depending on 
the water source.
}
\examples{
## estimate 10 microS/cm ec to tds
ec2tds(10)

}
\references{
Sawyer, C.N., McCarty, P.L. & Parkin G F. (2003). Chemistry for Environmental Engineering. McGraw-Hill 5th ed.

American Public Health Assoc., American Water Works Assoc. & Water Environment Federation. (1999). 
Standard Methods for the Examination of Water and Wastewater (20th ed.). Baltimore, MD: American Public Health Association.
}
