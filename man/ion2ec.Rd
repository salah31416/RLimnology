%
\name{ion2ec}
\alias{ion2ec}
\title{Estimate the Electral Conductivity}
\usage{
ion2ec(ions)
}
\arguments{
\item{ions}{a data.frame of ion concentration (mg/L)}
}
\value{
A data.frame of electrical conductivity (microS/cm), estimate TDS (TDS_est) and factor TDS
}
\description{
Estimate electrical conductivity
}
\examples{
ions = data.frame(
	Ca = c(85, 0.85, 0.085), 
	Mg = c(43.0, 0.43, 0.043), 
	K = c(2.9, 0.029, 0.0029), 
	Na = c(92.0, 0.92, 0.092), 
	HCO3 = c(362.0, 3.62, 0.362), 
	Cl = c(131.0, 1.31, 0.131), 
	SO4 = c(89.0, 0.89, 0.089), 
	NO3 = c(20.0, 0.2, 0.02))
ion2ec(ions)

}
\references{
Sawyer, C.N., McCarty, P.L. & Parkin G F. (2003). Chemistry for Environmental Engineering. McGraw-Hill 5th ed.

American Public Health Assoc., American Water Works Assoc. & Water Environment Federation. (1999). Standard Methods for the Examination of Water and Wastewater (20th ed.). Baltimore, MD: American Public Health Association.
}
