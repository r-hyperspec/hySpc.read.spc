#' Import functions for Kaiser Optical Systems `.spc` files
#'
#' `read_spc_Kaiser` imports sets of `.spc` files written by Kaiser Optical Systems' Hologram
#' software.  It may also serve as an example how to write wrapper functions for [read_spc()] to
#' conveniently import specialized sets of `.spc` files.
#'
#' @title read Kaiser `.spc` files
#' @export
#'
#' @concept io
#'
#' @rdname read-spc-Kaiser
#' @param files If `glob = TRUE`, `filename` can contain wildcards.
#'   Thus all files matching the name pattern in `filename` can be
#'   specified.
#' @param glob If `TRUE` the filename is interpreted as a wildcard
#'   containing file name pattern and expanded to all matching file names.
#' @param keys.log2data,... All further arguments are handed over directly to [read_spc()].
#' @return hyperSpec
#' @examples
#' ## for examples, please see `vignette ("fileio", package = "hyperSpec")`.
read_spc_Kaiser <- function(files, ..., glob = TRUE) {
  if (glob) {
    files <- Sys.glob(files)
  }

  if (length(files) == 0) {
    warning("No files found.")
    return(new("hyperSpec"))
  }

  f <- files[1]

  spc <- read_spc(f, no.object = TRUE, ...)

  data <- spc$data[rep(1L, length(files)), , drop = FALSE]

  spc$spc <- spc$spc[rep(1L, length(files)), , drop = FALSE]

  for (f in seq_along(files)) {
    tmp <- read_spc(files[f], no.object = TRUE, ...)

    data[f, ] <- tmp$data
    spc$spc[f, ] <- tmp$spc
  }

  data$filename <- files

  spc <- new("hyperSpec",
    wavelength = spc$wavelength, spc = spc$spc, data = data,
    labels = tmp$label
  )
  ## consistent file import behaviour across import functions
  ## filenames already set
  .spc_io_postprocess_optional(spc, file.keep.name = FALSE)
}

#' `read_spc_KaiserMap` is a wrapper for `read_spc_Kaiser` with predefined `log2data`
#' to fetch the stage position for each file.
#' @rdname read-spc-Kaiser
#' @export
#'
#' @concept io
#'
read_spc_KaiserMap <- function(files, keys.log2data = NULL, ...) {
  keys.log2data <- c("Stage_X_Position", "Stage_Y_Position", "Stage_Z_Position", keys.log2data)

  spc <- read_spc_Kaiser(files, keys.log2data = keys.log2data, ...)

  spc@data <- spc@data[, !colnames(spc@data) %in% c("z", "z.end"), drop = FALSE]

  colnames(spc@data) <- gsub("Stage_(.)_Position", "\\L\\1", colnames(spc@data), perl = TRUE)
  for (cln in c("x", "y", "z")) {
    spc@data[[cln]] <- as.numeric(spc@data[[cln]])
  }

  spc@label$x <- expression(`/`(x, micro * m))
  spc@label$y <- expression(`/`(y, micro * m))
  spc@label$z <- expression(`/`(z, micro * m))
  spc@label$z.end <- NULL

  spc
}

#' `read_spc_KaiserLowHigh` is a wrapper for `read_spc_Kaiser` for raw data that is saved
#' in separate files for low and high wavenumber range.  The wavelength axis holds the pixel
#' numbers, which repeat for low and high wavenumber ranges.
#'
#' @rdname read-spc-Kaiser
#' @param type what kind of measurement was done? If `"map"`, `read_spc_KaiserMap` is used
#' instead of `read_spc_Kaiser`.
#' @export
#'
#' @concept io
#'
read_spc_KaiserLowHigh <- function(files = stop("file names needed"),
                                   type = c("single", "map"),
                                   ..., glob = TRUE) {
  if (glob) {
    files <- Sys.glob(files)
  }

  files <- matrix(files, nrow = 2)

  type <- match.arg(type)
  switch(type,
    single = cbind(
      read_spc_Kaiser(files[1, ], ..., glob = FALSE),
      read_spc_Kaiser(files[2, ], ..., glob = FALSE)
    ),
    map = cbind(
      read_spc_KaiserMap(files[1, ], ..., glob = FALSE),
      read_spc_KaiserMap(files[2, ], ..., glob = FALSE)
    )
  )
}
