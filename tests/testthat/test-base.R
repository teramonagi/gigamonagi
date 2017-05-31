context("base.R")

test_that("is_numeric() for vector", {
  x <- c(1, 2, NA, "AAA", "123")
  expect_equal(is_numeric(x), c(TRUE, TRUE, FALSE, FALSE, TRUE))
  expect_equal(is_numeric(x, na=TRUE),  c(TRUE, TRUE, TRUE, FALSE, TRUE))
  expect_equal(is_numeric(x, na=FALSE), c(TRUE, TRUE, FALSE, FALSE, TRUE))
})

test_that("is_numeric() for data.frame", {
  df <- dplyr::data_frame(a=c(NA, "A", "", "123", "432"))
  expect_equal(dplyr::filter(df, is_numeric(a)), dplyr::tibble(a=c("123", "432")))
  expect_equal(dplyr::filter(df, is_numeric(a, na=TRUE)), dplyr::tibble(a=c(NA, "123", "432")))
})

test_that("has_na()", {
  df <- data.frame(a=1:3, b=5:7, c=c(NA, 1:2))
  expect_equal(has_na(df), c(a=FALSE, b=FALSE, c=TRUE))
})

test_that("mode()", {
  print(mode(c("A", "A", "A", "B")))
  expect_equal(mode(c(1,2,3,3,3,6)), 3)
  expect_equal(mode(c("A", "A", "A", "B")), "A")
})
