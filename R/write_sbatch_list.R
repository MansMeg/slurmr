#' Write a list of sbatch files to folder
#' 
#' @details 
#' Function that write out sbatch files together with a \code{run_all.sh} 
#' bash script that start all batch scripts.
#'
#' @param sbatch_list A \code{list} with \code{sbatch} objects.
#' @param path Where to write slurm files.
#' @param overwrite Should files be overwritten?
#'
#' @export
write_sbatch_list <- function(sbatch_list, path="", overwrite = FALSE){
  checkmate::assert(all(unlist(lapply(lapply(sbatch_list, class), FUN=function(x) x[[1]])) == "sbatch"))
  if(path != "") checkmate::assert_path_for_output(path, overwrite = overwrite)
  
  file_names <- character(length(sbatch_list))
  for(i in seq_along(sbatch_list)){
    if(is.null(sbatch_list[[i]]$J_)) {
      file_name <- paste0(path, "job_", i, ".sh")
    } else {
      file_name <- paste0(path, sbatch_list[[i]]$J_, "_job_", i, ".sh")
    }
    writeLines(utils::capture.output(sbatch_list[[i]]), con = file_name)
    file_names[i] <- file_name
  }

  writeLines(c("# Run all sbatch files", paste("sbatch", file_names)), 
             con = paste0(path, "run_all.sh"))

}
  