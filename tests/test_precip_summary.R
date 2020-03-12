
# Test that precip_summary works

expect_length(precip_summary(precip_data$amount, precip_data$type), 5)

# Test for reasonable values

expect_true(precip_summary(precip_data$amount, precip_data$type)$min <precip_summary(precip_data$amount, precip_data$type)$mean)

expect_true(precip_summary(precip_data$amount, precip_data$type)$max > precip_summary(precip_data$amount, precip_data$type)$mean)

# Dummy data for testing
fake_precip_amt = c(5, 3, 6, 9)
fake_precip_type = c("rain", "snow", "rain", "rain")

# Test for accuracy

test_that("precip_summary works correctly", {
expect_equal(precip_summary(fake_precip_amt, fake_precip_type)$min, 3)
expect_equal(precip_summary(fake_precip_amt, fake_precip_type)$max, 9)
expect_equal(precip_summary(fake_precip_amt, fake_precip_type)$snowdays, 1)
})
