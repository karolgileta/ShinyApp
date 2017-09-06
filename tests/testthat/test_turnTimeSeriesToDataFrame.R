library(testthat)
library(ShinyApp)

test_that("Correct data frame", {
  test.data.frame.to.save = turnTimeSeriesToDataFrame(datasets::AirPassengers)
  expect_true(is.data.frame(test.data.frame.to.save))
})
