library(testthat)
library(ShinyApp)

test_that("Correct time series argument in function", {
  expect_error(plotGraph(), 'argument "time.series" is missing, with no default')
})

test_that("Correct arguments - no space character in directory", {
  directory = 'test 123'
  expect_error(plotGraph(datasets::AirPassengers, name, directory))
})

test_that("Correct time series argument in function - not a data frame", {
  expect_error(plotGraph(datasets::WorldPhones, name, directory))
})

test_that("Correct arguments - no name provided", {
  expect_error(plotGraph(datasets::AirPassengers, directory))
})

test_that("Correct arguments - no directory provided", {
  expect_error(plotGraph(datasets::AirPassengers, name))
})
