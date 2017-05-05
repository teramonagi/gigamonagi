context("base.R")

test_that("is_numeric() for vector", {
  x <- c(1, 2, NA, "AAA", "123")
  expect_equal(is_numeric(x), c(TRUE, TRUE, FALSE, FALSE, TRUE))
})

test_that("is_numeric() for data.frame", {
  df <- dplyr::data_frame(a=c(NA, "A", "", "123", "432"))
  expect_equal(dplyr::filter(df, is_numeric(a)), dplyr::tibble(a=c("123", "432")))
  expect_equal(dplyr::filter(df, is_numeric(a, na="123")), dplyr::tibble(a="432"))
})
