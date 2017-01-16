#' @export
print.sbatch <- function(x, ...){
  
  cat("#!/bin/bash \n")
  cat("# \n")
  if(!is.null(x$J_)) cat(paste0("#SBATCH -J \"", x$J_, "\" \n"))
  cat(paste0("#SBATCH -t ", num_to_time(x$t_), " \n"))
  if(!is.null(x$A_)) cat(paste0("#SBATCH -A ", x$A_, " \n"))
  if(!is.null(x$n_)) cat(paste0("#SBATCH -n ", x$n_, " \n"))
  if(!is.null(x$n_)) cat(paste0("#SBATCH -N ", x$N_, " \n"))
  if(x$exclusive__) cat("#SBATCH --exclusive")
  
  if(!is.null(x$mem__)) cat(paste0("#SBATCH --mem=", x$mem__, " \n"))
  if(!is.null(x$mail_user__)) cat(paste0("#SBATCH --mail-user=", x$mail_user__, " \n"))  
  if(!is.null(x$mail_type__)) cat(paste0("#SBATCH --mail-type=", x$mail_type__, " \n"))  
  cat(paste0("#SBATCH --output=\"", x$output__, "\" \n"))
  
  if(x$add_status){
    cat("\n")
    cat("# Status sbatch script run \n")
    cat("echo \"username: $USER\" \n")
    cat("date \n")
    cat("projinfo \n")
    cat("git log -n 1 \n")
    cat("\n")
  }
  
  for(i in seq_along(x$code)){
    cat(x$code[i])
    cat("\n")
  }

}


#' Convert hours in numerical format to slurm time format
#' 
#' @param x Hours as numeric.
#'
#' @return 
#' Hours in slurm format
num_to_time <- function(x){
  checkmate::assert_number(x)
  HH <- floor(x)
  MM <- floor((x - HH) * 60)
  SS <- floor((x - HH - MM/60) * 3600)
  
  HHchar <- stringr::str_pad(HH, width = 2, pad = "0")
  MMchar <- stringr::str_pad(MM, width = 2, pad = "0")
  SSchar <- stringr::str_pad(SS, width = 2, pad = "0")
  
  paste(HHchar, MMchar, SSchar, sep =":")
}





