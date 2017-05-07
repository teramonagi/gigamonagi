context("map.R")

test_that("geocode() for a single address", {
  address <- "285 Fulton St, New York"
  expect_equal(data.frame(lat=40.713008, lng=-74.013169), geocode(address))
})

test_that("geocode() for multiple addresses", {
  address <- c("東京都中央区月島２－１０－１", "東京都江東区豊洲３－６－８")
  expect_equal(data.frame(lat=c(35.66357, 35.65986), lng=c(139.7844, 139.7962)), geocode(address))
})
