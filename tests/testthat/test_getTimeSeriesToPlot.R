library(testthat)
library(ShinyApp)

test_that("Correct data frame", {
  test.data.frame.to.plot = getTimeSeriesToPlot(datasets::AirPassengers)
  expect_true(is.data.frame(test.data.frame.to.plot))
})

test_that("Correct time series", {
  dataset.to.test = datasets::WorldPhones
  expect_error(getTimeSeriesToPlot(dataset.to.test))
})

test_that("Correct time series - no arguments", {
  expect_error(getTimeSeriesToPlot())
})
