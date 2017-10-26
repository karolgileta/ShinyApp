library(testthat)
library(ShinyApp)

test_that("Correct file.name argument in function", {
  expect_error(addCompanyLogo(),
               'argument "file.name" is missing, with no default')
})
