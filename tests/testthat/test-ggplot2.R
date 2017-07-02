context("ggplot2.R")

test_that("scientific_10()", {
  answer <- c("1 %*% 10^-2", "1 %*% 10^-1", "1 %*% 10^0", "1 %*% 10^1", "1 %*% 10^2")
  expect_equal(answer, as.character(scientific_10(10^(-2:2))))
})
