#' heat_records
#'
#' Gives the number of days where the temperature exceeded the previous temperature record.

#' @param temp Average daily temperature
#' @param records Record high temperature
#' @return record_high = number of days that exceeded the previous record high temperature
#' @author Allison Hacker

heat_records = function(temps, records){
  dif = temps-records
  record_high <- ifelse(dif>0, 1, 0)
  return(sum(record_high))
}

