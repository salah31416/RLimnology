
##-------------------------------------------------------------
## 
##-------------------------------------------------------------
ion2ec = function(dta)
{
	ions = dta
	## ions
	ni = c("Ca", "Mg", "K", "Na", "HCO3", "Cl", "SO4", "NO3")
	
	## constants
	ki = data.frame(
			## cations
			Ca = 2.60,
			Mg = 3.82,
			K  = 1.84,
			Na = 2.13,
			## anions
			HCO3 = 0.716,
			Cl   = 2.14,
			SO4  = 1.54,
			NO3  = 1.15)
	
	## check which ions are present
	ip = ni[ni %in% names(ions)]

	## order
	ions = ions[ip]
	
	## separates the constants
	k = data.frame(ki[ip])

	## apply the constants
	EC_ions = do.call(rbind, apply(ions, 1, function(x) x * k))
	
	## names the columns for EC (electro conductivity)
	names(EC_ions) = paste0("EC_", names(ions))
	
	## Total EC
	EC_ions$EC_est = rowSums(EC_ions, na.rm = TRUE)
	## Estimated TDS
	EC_ions$TDS_est = rowSums(ions, na.rm = TRUE)
	
	## TDS   = A x EC :: A = TDS/EC
	## 824.9 = A x 1286.148
	## A = 0.64
	EC_ions$Factor_TDS = EC_ions$TDS_est/EC_ions$EC_est
	
	return(cbind(dta, EC_ions))
	
}#end ion2ec
