library(testthat)
library(ShinyApp)

test_that("Correct data frame", {
  test.data.frame.to.save = turnTimeSeriesToDataFrame(datasets::AirPassengers)
  expect_true(is.data.frame(test.data.frame.to.save))
})

test_that("Correct time series - no arguments", {
  expect_error(turnTimeSeriesToDataFrame())
})

test_that("Correct time series - character arguments", {
  expect_error(turnTimeSeriesToDataFrame('test123'))
})
