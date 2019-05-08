ssi = function(dt, Az, dA, dz = .1, ...)
{
	.=z=wt=zg=SSI=pm=pz=NULL

	setDT(dt)
	
	## first name 
	nm = names(dt)[1]
	## copy data.table
	DT = copy(dt)
	## rename col
	setnames(DT, c(1:3), c("date", "z", "wt"))
	## order
	setorderv(DT, c("date", "z"))
	
	DD = DT[, .(z = seq(min(z), max(z), dz)), by = .(date)]
	
	DD[, Az := approx(dA, Az, z)$y, by = .(date, z)]
	
	grp = DT[, unique(date)]
	
	##
	for(i in 1:length(grp))
	{
		DD[date == grp[i], wt := approx(DT[date == grp[i],z], DT[date == grp[i],wt], unique(z))$y]
	}#end for
	
	# densidade da agua
	DD[, pz := water_density(wt), by = date]
	
	## densidade média
	DD[, pm := mean(pz), by = date]
	#DT[, pm := sum(pz * Az * h, na.rm=T)/sum(V, na.rm=T)]
	
	## centro de gravidade
	DD[, zg := 1/sum(Az * pz, na.rm=T) * sum(Az*pz*z, na.rm=T), by = date]
	
	## gravidade
	g = 9.8 ## m^2/s
	
	## estabilidade schmidt	
	DD[, SSI := sum(g * Az/Az[1] * (pz - pm) * (z - zg)) * dz, by = date]

	## renomear
	setnames(DD, "date", nm)
	
	## out
	DD = DD[, .(SSI = unique(SSI)), by = nm]
	
	return(DD[])
	
}#end funtion
