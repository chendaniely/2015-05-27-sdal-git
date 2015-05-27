library(testthat)

f_to_k <- function(temp) {
	return((temp - 32) * (5 /9) + 273.15)	
}

expect_equal(f_to_k(32), 273.15)


k_to_c <- function(temp) {
	return(temp - 273.15)
}

k_to_c(0)

f_to_c <- function(temp) {
	k_convert <- f_to_k(temp)
	c_convert <- k_to_c(k_convert)
	return(c_convert)
}

f_to_c(32)
