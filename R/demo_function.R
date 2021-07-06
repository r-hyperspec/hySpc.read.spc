#' This is demo function.
#'
#' You should delete this function.
#'
#' @return `NULL`
#'
#' @export
demo_function <- function() {
  NULL
}

# Unit tests -----------------------------------------------------------------

hySpc.testthat::test(demo_function) <- function() {
  context("demo_function")

  expect_silent(demo_function())
  expect_equal(demo_function(), NULL)
}
