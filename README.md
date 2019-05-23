# RLimnology

Functions and methods for calculate parameters of physical and chemical characteristics in water bodies. It includes water density based on temperature, relative thermal resistance and others.

<img src="https://github.com/salah31416/RLimnology/blob/master/inst/figures/logo_rlimnology.png" title="Rlimnology"/>


* [Installation](#installation)
* [Estimate Electroconductivity to Dissolved Total Solids](#estimate-electroconductivity-to-dissolved-total-solids)
* [Estimate Electrical Conductivity](#estimate-electrical-conductivity)
* [Relative Thermal Resistance to Mixing](#relative-thermal-resistance-to-mixing)
* [Calculate the Schmidt Stability Index](#calculate-the-schmidt-stability-index)
* [Estimate Water Density](#estimate-water-density)

# Installation

```r
devtools::install_github("salah31416/RLimnology")
```

# Estimate Electroconductivity to Dissolved Total Solids


```r
## estimate 10 muS/cm EC to TDS
ec2tds(10)
#[1] 6.4
```

# Estimate Electrical Conductivity

```r
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
#     EC_Ca     EC_Mg     EC_K     EC_Na    EC_HCO3     EC_Cl    EC_SO4 EC_NO3      EC_est  TDS_est Factor_TDS
# 1 221.000 164.26000 5.336000 195.96000 259.192000 280.34000 137.06000 23.000 1286.148000 824.9000  0.6413725
# 2   2.210   1.64260 0.053360   1.95960   2.591920   2.80340   1.37060  0.230   12.861480   8.2490  0.6413725
# 3   0.221   0.16426 0.005336   0.19596   0.259192   0.28034   0.13706  0.023    1.286148   0.8249  0.6413725
```

# Relative Thermal Resistance to Mixing

```r
Date = c(as.Date(rep("2017-01-01", 7)), as.Date(rep("2017-02-01", 7)))
Depth = rep(c(0, 5, 10, 15, 20, 25, 30), 2)
Sal = rep(5, 14)
Temperature = c(30.76, 29.77, 24.28, 21.93, 20.91, 20.43, 20.22,
		25.16, 24.77, 22.28, 21.93, 19.41, 18.43, 18.22)
df = data.frame(Date, depth, temperature)

rtr_mixing(df)
#           Date Depth Temperature  density layer        rtr
#  1: 2017-01-01     0       30.76 995.4277   0-5  34.184779
#  2: 2017-01-01     5       29.77 995.7294  5-10 171.443805
#  3: 2017-01-01    10       24.28 997.2425 10-15  63.495407
#  4: 2017-01-01    15       21.93 997.8028 15-20  25.610235
#  5: 2017-01-01    20       20.91 998.0289 20-25  11.633032
#  6: 2017-01-01    25       20.43 998.1315 25-30   5.004173
#  7: 2017-01-01    30       20.22 998.1757  <NA>         NA
#  8: 2017-02-01     0       25.16 997.0188   0-5  11.336374
#  9: 2017-02-01     5       24.77 997.1188  5-10  68.441441
# 10: 2017-02-01    10       22.28 997.7229 10-15   9.063321
# 11: 2017-02-01    15       21.93 997.8028 15-20  61.057910
# 12: 2017-02-01    20       19.41 998.3417 20-25  21.700247
# 13: 2017-02-01    25       18.43 998.5332 25-30   4.497137
# 14: 2017-02-01    30       18.22 998.5729  <NA>         NA
```

# Calculate the Schmidt Stability Index

```r
grp = c(rep("A", 7), rep("B", 7))
Az = c(1000, 900, 864, 820, 200, 10, 5)
dA = c(0, 2.3, 2.5, 4.2, 5.8, 7, 7.5)
wt = c(28, 27, 26.4, 26, 25.4, 24, 23.3, 30, 29, 28.4, 26, 25.4, 24, 23.3)
z = c(0, 1, 2, 3, 4, 5, 6, 0, 1, 2, 3, 4, 5, 6)

df = data.frame(grp, z, wt, stringsAsFactors = F)

ssi(df, Az, dA)
#   Grp      SSI
#1:   A 21.62950
#2:   B 39.47064
``` 

# Estimate Water Density

```r
water_density(0:5, method = "tilton")
#[1]  999.8676  999.9265  999.9678  999.9922
#[5] 1000.0000  999.9919

water_density(0:5, method = "gill")
#[1]  999.8701  999.9284  999.9691  999.9928
#[5] 1000.0000  999.9912
```


