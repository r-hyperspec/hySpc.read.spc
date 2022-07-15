#' @concept io
read_spc_Shimadzu <- function(filename) {
  stop("Import of Shimadzu SPC file format (OLE CF) is not yet implemented.")
}

hySpc.testthat::test(read_spc_Shimadzu) <- function() {
  context("read_spc_Shimadzu()")

  test_that("not implemented error", {
    expect_error(read_spc_Shimadzu())
  })
}
