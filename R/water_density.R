
##------------------------------------------------------------------
##                 -- WATER DENSITY --
##------------------------------------------------------------------
water_density = function(wt,
						 tds = 0, 
						 tss = 0, 
						 sal = 0, 
						 sg = 2.5, 
						 method = c("gill_m", "tilton")) 
{
	method = match.arg(method)

	## original
	a0 = 999.842594
	a1 = 6.79395199e-2
	a2 = -9.095290e-3
	a3 = 1.001685e-4
	a4 = -1.120083e-6
	a5 = 6.5363319995e-9


	switch(method,
		   gill_m = {
			   ##----------------------------------------------------
			   ##                 -- WATER DENSITY --
			   ##----------------------------------------------------
			   ## modificado
			   a0 = 999.8701
			   a1 = 6.732158e-2	

			   ## equation 1
			   rho_wt = a0 + a1*wt + a2*wt^2 + a3*wt^3 + a4*wt^4 + a5*wt^5 

			   ## The total solid, includes wto parts: 
			   ## 1 The total suspended solid (tss) and 
			   ## 2 the total dissolved solid (tds).
			   g = (1 - 1/sg) * 10^(-3)
			   b0 = 8.221e-4
			   b1 = -3.87e-6 
			   b2 = 4.99e-8

			   ## equation 2
			   rho_ts = tss*g + tds*(b0 + b1*wt + b2*wt^2)

			   ##----------------------------------------------------
			   ##    -- WATER DENSITY INCREMENT DUE TO SALINITY --
			   ##----------------------------------------------------
			   A = 0.824493 - 4.0899e-3*wt + 7.6438e-5*wt^2 - 8.2467e-7*wt^3 +
				   5.3875e-9*wt^4
			   B = -5.72466e-3 + 1.0227e-4*wt - 1.6546e-6*wt^2
			   C = 4.8314e-4 

			   ## equation 3
			   rho_sal = A*sal + B*sal^(3/2) + C*sal^2

			   ##----------------------------------------------------
			   ##            -- DENSITY Kg/m^3 --
			   ##----------------------------------------------------
			   rho = (rho_ts + rho_wt + rho_sal)

		   }, #gill

		   tilton = {

			   A = (wt - 3.9863)^2
			   B = 508929.2
			   C = wt + 288.9414
			   D = wt + 68.12963

			   ## equation 4
			   rho = (1 - A/B * C/D) * 1000

		   }# tilton
	)#end switch

	return(rho)

}#end water_density

#water_density(0:14, method="g")
