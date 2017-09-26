library(testthat)
library(ShinyApp)

test_that("Correct time series argument in function", {
  expect_error(saveToCsv(), 'argument "time.series" is missing, with no default')
})

test_that("Correct time series argument in function - a time series", {
  expect_error(saveToCsv(datasets::WorldPhones))
})

test_that("Correct directory argument in function", {
  directory = datasets::AirPassengers
  expect_error(saveToCsv(datasets::AirPassengers, 'testname', directory))
})
