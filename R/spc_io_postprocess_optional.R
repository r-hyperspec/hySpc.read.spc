#' Helper Function to Harmonize Treatment of File Import Results
#'
#' This function provides two ways of post-processing imported spectra:
#'
#' - optionally remove empty spectra (some spectrograph software will produce
#'   empty spectra when measurements are cancelled)
#' - optionally keep the filenames in column `spc$filename`
#'
#' The desired overall behavior can be set by options via [hy.setOptions()]. All
#' file import filters should call `.spc_io_postprocess_optional()` to ensure the same
#' behavior.
#'
#' @param spc hyperSpec object for file import post-processing
#' @param filename filename(s) to become extra data column of `spc`
#' @param ... (ignored)
#' @param file.remove.emptyspc should empty (all `NA` or all `0`) spectra be
#'        removed?
#' @param file.keep.name should file names be kept and put into `spc$filename`?
#' @param tolerance intensities in +/- `tolerance` are considered `0` for
#'        `file.remove.emptyspc = TRUE`
#'
#' @return hyperSpec object
#'
#' @keywords internal
#'
#' @concept io
#' @concept manipulation
#'
#' @export
#'
.spc_io_postprocess_optional <- function(spc, filename, ...,
                             file.remove.emptyspc = hy.getOption("file.remove.emptyspc"),
                             file.keep.name = hy.getOption("file.keep.name"),
                             tolerance = hy.getOption("tolerance")) {
  tolerance <- .checkpos(tolerance, "tolerance")

  if (file.remove.emptyspc) {
    ## number of NAs in each spectrum
    nas <- rowSums(is.na(spc))

    ## number of zero-values in each spectrum
    zeros <- rowSums(abs(spc) < tolerance, na.rm = TRUE)

    spc <- spc[nas + zeros < nwl(spc)]
  }

  if (file.keep.name & nrow(spc) > 0L) {
    if (is.null(spc@data$filename)) {
      if (is(filename, "connection")) {
        filename <- summary(filename)$description
      }

      spc@data$filename <- filename
      spc@label$filename <- "filename"
    } else {
      warning("$filename already exists. => Skipping file.keep.name")
    }
  }

  spc
}

## check particular options that should exist and be finite and strictly positive
.checkpos <- function(opt, name) {
  if (length(opt) != 1L || !is.finite(opt) || opt < .Machine$double.eps) {
    warning(name, " must be a strictly positive finite number => set to .Machine$double.eps (", .Machine$double.eps, ").")
    opt <- .Machine$double.eps
  }

  opt
}

