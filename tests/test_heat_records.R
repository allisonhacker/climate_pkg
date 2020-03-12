# Test that heat_records function works

test_that("heat_records_works", {

  expect_equal(heat_records(temps = c(102, 104, 110), records= c(90, 90, 90)), 3)
  expect_equal(heat_records(temps = c(102, 104, 105), records= c(130, 130, 130)), 0)
})
