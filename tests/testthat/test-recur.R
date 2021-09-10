# Skip for run time
skip_on_cran()

test_that("recur() has appropriate outputs based on model type", {

	# Setup variables
	library(card)
	data("mims")
	mims <- mims[sample(nrow(mims), 100), ]
	id <- "patid"
	first <- "first_visit_date_bl"
	last <- "ldka"
	event_dates <- c("mi_date_1", "mi_date_2", "mi_date_3", "CHF_DATE_1", "CHF_DATE_2", "CHF_DATE_3")
	model_type <- "trad"
	censor <- "DEATH_CV_YN"

	# Traditional
	trad <- recur(mims, model_type = "trad", id, first, last, censor)
	expect_length(trad, 7)
	expect_equal(nrow(trad), nrow(mims))
	expect_equal(trad$strata[1], "strata_0")
	expect_equal(unique(trad$start), 0)

	# Marginal
	marg <- recur(mims, model_type = "marginal", id, first, last, censor, event_dates)
	expect_length(marg, 7)
	expect_gt(nrow(marg), nrow(mims))
	expect_gt(length(unique(marg$strata)), 1)

	# PWP Total Time
	pwptt <- recur(mims, model_type = "pwptt", id, first, last, censor, event_dates)
	expect_gt(nrow(pwptt), nrow(mims))
	expect_gt(length(unique(pwptt$strata)), 1)
	expect_gt(sum(pwptt$start), 0)

	# PWP Gap Time
	pwpgt <- recur(mims, model_type = "pwpgt", id, first, last, censor, event_dates)
	expect_gt(nrow(pwpgt), nrow(mims))
	expect_gt(length(unique(pwpgt$strata)), 1)
	expect_equal(sum(pwpgt$start), 0)

	# Andersen Gill
	ag <- recur(mims, model_type = "ag", id, first, last, censor, event_dates)
	expect_gt(nrow(ag), nrow(mims))
	expect_equal(length(unique(ag$strata)), 1)
	expect_gt(sum(ag$start), 0)

})

