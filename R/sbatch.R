#' Sbatch object constructor
#'
#' @details 
#' See slurm details om arguments. Use \code{sbatch -help} for details. 
#' The parameters implemented can be seen below.
#'
#'
#' @param code Code to run in SBATCH. Every row in batch script is a char element.
#' @param add_status Add code to print out status for run.
#' @param J_ See details.
#' @param t_ See details.
#' @param A_ See details.
#' @param n_ See details.
#' @param mem__ See details.
#' @param mail_type__ See details.
#' @param mail_user__ See details.
#' @param output__ See details.
#' 
#' @return 
#' \code{sbatch} object
#' 
#' @export
sbatch <- function(code = "", 
                   add_status = TRUE,
                   J_ = NULL, 
                   t_ = 1, 
                   A_ = NULL, 
                   n_ = NULL, 
                   mem__ = NULL,
                   mail_type__ = NULL, 
                   mail_user__ = NULL, 
                   output__ = "slurm-%j"){
  
  # Create Object
  sb_obj <- list(code = code, 
                 add_status = add_status,
                 J_ = J_,
                 t_ = t_,
                 A_ = A_,
                 n_ = n_,
                 mem__ = mem__,
                 mail_type__ = mail_type__,
                 mail_user__ = mail_user__, 
                 output__ = output__)
  
  class(sb_obj) <- c("sbatch", "list")
  
  # Assertions
  assert_sbatch(sb_obj)
  
  sb_obj
}

  