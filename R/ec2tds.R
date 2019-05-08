
##-------------------------------------------------------------
## 
##-------------------------------------------------------------
ec2tds = function(ec, k = 0.64)
{
	## range
	if(k < 0.3 || k > 1) stop("Factor value: 0.3 <= k <= 1", call. = FALSE)
	
	## equation 1
	tds = ec * k
	
	## out vector
	if(is.data.frame(tds)) return(tds[,1])
	
	return(tds)
	
}##end function
