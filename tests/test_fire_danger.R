# Test that fire_danger works

test_that("fire_danger works", {
  expect_length(fire_danger(fire_df), 2)
  })

# Test for reasonable values

expect_true(nrow(fire_danger(fire_df)) > 0)
expect_true(sum(fire_danger(fire_df)$fire_score) > 0)

# Test for accurracy

fake_fire_data = data.frame(temp = c(40, 10),
                            humidity = c(10, 100),
                            wind_speed = c(40, 2),
                            fuel_moisture = c(100, 0))
fire_danger(fake_fire_data)

test_that("fire_danger works correctly", {
  expect_match(as.character(fire_danger(fake_fire_data)$fire_danger_level[1]), "Extreme")
  expect_match(as.character(fire_danger(fake_fire_data)$fire_danger_level[2]), "Low")
  })
