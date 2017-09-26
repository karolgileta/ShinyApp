library(testthat)
library(ShinyApp)

test_that("Correct time series argument in function", {
  expect_error(plotConditionalGraph(), 'argument "time.series" is missing, with no default')
})

test_that("Correct time series argument in function", {
  dataset.to.test = datasets::WorldPhones
  expect_error(plotConditionalGraph(dataset.to.test, 12, 0.2))
})

test_that("Correct months argument in function", {
  months = '12'
  expect_error(plotConditionalGraph(datasets::AirPassengers, months, 0.2))
})
