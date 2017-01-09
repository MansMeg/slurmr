#' Assert a sbtach object
#' 
#' @param x a object to assert is a \code{sbatch} object.
#' 
assert_sbatch <- function(x){
  checkmate::assert_class(x, "sbatch")

  checkmate::assert_character(x$code)
  checkmate::assert_flag(x$add_status)
  if(x$path != "") checkmate::assert_path_for_output(x$path)

  checkmate::assert_string(x$J_, null.ok = TRUE)
  checkmate::assert_number(x$t_)
  checkmate::assert_string(x$A_, null.ok = TRUE)
  checkmate::assert_number(x$n_, null.ok = TRUE)
  checkmate::assert_number(x$mem__, null.ok = TRUE)
  checkmate::assert_string(x$mail_user__, pattern = "(.)+@[a-z]+.[a-z]+", null.ok = TRUE)
  if(!is.null(x$mail_type__)) checkmate::assert_choice(x$mail_type__, c("ALL", "END", "BEGIN", "FAIL"))
  checkmate::assert_string(x$output__)
}

