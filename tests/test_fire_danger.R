# Test that fire_danger works

test_that("fire_danger_works", {
  expect_length(fire_danger(fire_df), 2)
  })

# Test for reasonable values

expect_true(nrow(fire_danger(fire_df)) > 0)
expect_true(sum(fire_danger(fire_df)$fire_score) > 0)

