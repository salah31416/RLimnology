##-------------------------------------------------------------
## 
##-------------------------------------------------------------
temp_convert = function(tp, to = c("f2c", "c2f", "f2k", "c2k", "k2c", "k2f"))
{
	to = match.arg(to)

	switch(to,
		   f2c = { out = 5*(tp - 32)/9  }, 	# Fahrenheit to Celsius
		   c2f = { out = 9/5 * tp + 32  },	# Celsius to Fahrenheit
		   f2k = { out = 1.8*tp - 459.4 },	# Fahrenheit to Kelvin
		   k2f = { out = tp*9/5 - 459.67},	# Kelvin to Fahrenheit
		   c2k = { out = tp + 273.15    },	# Celsius to Kelvin
		   k2c = { out = tp - 273.15    }	# Kelvin to Celsius
	)#end switch

	return(out)

}#end temp_convert

