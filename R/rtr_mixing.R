
##-------------------------------------------------------------
## 
##-------------------------------------------------------------
rtr_mixing = function(dt, ...)
{
	rtr=N=d1=d2=layer=t1=t2=wd1=wd2=grp=.=NULL

	setDT(dt)
	
	nm = names(dt)
	
	data = copy(dt)	
	
	setnames(data, c(1:3), c("grp", "d1", "t1"))
	
	setorderv(data, c("grp", "d1"))
	
	d4 = water_density(4)
	d5 = water_density(5)
	
	data[, t2 := c(t1[c(2:.N)], NA)]
	data[, d2 := c(d1[c(2:.N)], 0)]
	
	data[, wd1 := water_density( t1[c(1:.N)])]
	data[, wd2 := water_density(t2)]
	data[, rtr := (wd2 - wd1) / (d4 - d5)]
	
	data[, layer := paste(d1, d2, sep="-")]
	data[layer == paste(max(d2), min(d1), sep="-"), rtr := NA]
	data[layer == paste(max(d2), min(d1), sep="-"), layer := NA]
	
	data = data[, .(grp, d1, t1, wd1, layer, rtr)]
	
	setnames(data, c(1,2,3,4), c(nm[1], nm[2], nm[3], "density"))	
	
	return(data)
}#end rtr_mixing
