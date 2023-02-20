test_that("multiplication works", {

	x <- runif(10)
	t <- seq(0.1, 1, by = 0.1)
	a <- c("Special", "Error", NA_character_, "Event", rep(NA_character_, 6))
	f <- "seconds"

	obj <- rhythm(x = x, t = t, f = f, a = a)
	expect_s3_class(obj, "rhythm_rcrd")
	expect_equal(nrow(obj), 10)
	expect_equal(ncol(obj), 3)
})
