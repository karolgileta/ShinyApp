library(testthat)
library(ShinyApp)

test_that("Correct file.name argument in function", {
  expect_error(add7NWatermark(), 'argument "file.name" is missing, with no default')
})
