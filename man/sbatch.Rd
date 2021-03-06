% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sbatch.R
\name{sbatch}
\alias{sbatch}
\title{Sbatch object constructor}
\usage{
sbatch(code = "", add_status = TRUE, A_ = NULL, C_ = NULL, J_ = NULL,
  t_ = 1, n_ = NULL, N_ = NULL, exclusive__ = FALSE, mem__ = NULL,
  mail_type__ = NULL, mail_user__ = NULL, output__ = "slurm-\%j.out")
}
\arguments{
\item{code}{Code to run in SBATCH. Every row in batch script is a char element.}

\item{add_status}{Add code to print out verbose status for run.}

\item{A_}{See details.}

\item{C_}{See details.}

\item{J_}{See details.}

\item{t_}{See details.}

\item{n_}{See details.}

\item{N_}{See details.}

\item{exclusive__}{See details.}

\item{mem__}{See details. Memory allocation in MB.}

\item{mail_type__}{See details.}

\item{mail_user__}{See details.}

\item{output__}{See details.}
}
\value{
\code{sbatch} object
}
\description{
Sbatch object constructor
}
\details{
See slurm details om arguments. Use \code{sbatch -help} for details. 
The parameters implemented can be seen below.
}
