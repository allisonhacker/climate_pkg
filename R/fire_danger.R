#' fire_danger
#'
#' Gives the fire danger index score and fire danger level based on temperature, humidity, wind speed, live fuel moisture content.

#' @param fire_df A dataframe containing columns temp (C), humidity (RH), wind_speed (mph), and fuel_moisture (Live fuel moisture content)
#' @return fire_score   =  Fire danger index score
#' @return fire_danger_level   =  Fire danger level
#' @example fire_danger(fire_df)
#' @author Allison Hacker


fire_danger = function(fire_df){

  temp_score = ifelse(fire_df$temp > 37, 5,
                      ifelse(fire_df$temp>34, 4,
                             ifelse(fire_df$temp>28, 3,
                                    ifelse( fire_df$temp>24, 2, 1))))
  humidity_score = ifelse(fire_df$humidity < 15, 5,
                      ifelse(fire_df$humidity < 25, 4,
                             ifelse(fire_df$humidity < 40, 3,
                                    ifelse(fire_df$humidity < 60, 2, 1))))
  wind_score = ifelse(fire_df$wind_speed > 30, 5,
                      ifelse(fire_df$wind_speed > 25, 4,
                             ifelse(fire_df$wind_speed > 20, 3,
                                    ifelse(fire_df$wind_speed >15, 2, 1))))
  fuel_score = ifelse(fire_df$fuel_moisture < 60, 5,
                                       ifelse(fire_df$fuel_moisture < 70, 4,
                                              ifelse(fire_df$fuel_moisture < 80, 3,
                                                     ifelse(fire_df$fuel_moisture < 90, 2, 1))))

  fire_score= 0.2*temp_score + 0.3*humidity_score + 0.35*wind_score + 0.15*fuel_score

  fire_danger_level= ifelse(fire_score > 4, "Extreme",
                      ifelse(fire_score > 3, "High",
                                    ifelse(fire_score> 2, "Moderate", "Low")))
  fire_danger_df = data.frame(fire_score = fire_score, fire_danger_level = fire_danger_level)
  return(fire_danger_df)
}

