#' precip_summary
#'
#' Summarizes the minimum, maximum, and mean amount of daily precipitation. Also gives the number snow days and the total snow water equivalent (SWE)

#' @param amount Precipitation amount (cm)
#' @param type Precipitation type (rain or snow)
#' @param snow_density Desnity of snow (kg/m2)
#' @return min_precip = minimum daily precipitation (cm)
#' @return max_precip = maximum daily precipitation (cm)
#' @return mean_precip = mean daily precipitation (cm)
#' @return snowdays = number of days with snow
#' @return total_swe = snow water equivalent (cm/day)
#' @example precip_summary(amt = precip_data$amount, type = precip_data$type)
#' @author Allison Hacker

precip_summary = function(amt, type, snow_density = 0.312){

 swe = ifelse(type == "snow", amt*snow_density, 0)

 num_snow = ifelse(type == "snow", 1, 0)

 precip_sum = data.frame(min = min(amt),
                          max = max(amt),
                          mean = mean(amt),
                          snowdays = sum(num_snow),
                          total_swe = sum(swe))

  return(as.list(precip_sum))
}


