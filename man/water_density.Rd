%
\name{water_density}
\alias{water_density}
\title{Estimate Water Density}
\usage{
water_density(wt, tds = 0, tss = 0, sal = 0, sg = 2.5,
  method = c("gill_m", "tilton"))
}
\arguments{
\item{wt}{a numeric vector of water temperature (Degrees Celsius)}

\item{tds}{a numerical vector of total dissolved solids (g/m^3)}

\item{tss}{a numerical vector of total suspend solids (g/m^3)}

\item{sal}{a numerical vector of salinity (Practical Salinity Scale Units)}

\item{sg}{specific gravity of the total suspended solid (Dimensionless)}

\item{method}{gill_m or tilton}
}
\value{
A numeric vector of water densities in kg/m^3
}
\description{
This function estimate water density determined by three parameters: temperature, salinity and concentration of total solid.
}
\examples{
## water density
water_density(0:5, method = "tilton")
water_density(0:5, method = "gill")
 
}
\references{
Ji, Zhen-Gang (2007). Hydrodynamics and water quality: modeling rives, lakes, and estuaries 

Tilton, L. W., and J. K. Taylor. (1937). Accurate representation of reflectivity and density of distilled water as a function of temperature. J. Res. U.S. Bur. Stand. 18:205-214.

Gill, Adrian E. (1982). Atmosphere-Ocean Dynamics. Academic Press
}
\author{
Izidro Sousa-Filho, Lorena Pinheiro-Silva
}
