#' Modèle numérique de hauteur
#'
#' @description création d'un MNH par différence entre un MNS et un MNT
#'
#' @param mns = MNS
#' @param mnt = MNT
#' @param resol = résolution (en m)
#'
#' @import tidyverse
#' @import terra
#'
#' @author Bruciamacchie Max
#'
#' @export
#'

MnhCreate <- function(mns, mnt, resol=1) {
  if(res(mns[1]) < 1) {
    coefs <- resol/res(mns)
    mns <- mns |>
      aggregate(fact=coefs)
  }

  mnt <- mnt |>
    resample(mns)

  mnh = mns - mnt
  mnh[mnh < 0] <- 0

  return(mnh)
}


