#' Modèle numérique de hauteur
#'
#' @description création d'un MNH par différence entre un MNS et un MNT
#'
#' @param r1 = MNS
#' @param r2 = MNT
#' @param resol = résolution (en m)
#'
#' @import tidyverse
#' @import terra
#'
#' @author Bruciamacchie Max
#'
#' @examples
#' \donttest{
#' librarian::shelf(terra,sf,tidyverse)
#'
#' }
#
#' @export
#'

MnhCreate <- function(r1, r2, resol=1) {
  coefs <- resol/res(r1)

  r1 <- r1 |>
    aggregate(fact=coefs)

  r2 <- r2 |>
    resample(r1)

  mnh = r1 - r2
  mnh[mnh < 0] <- 0

  return(mnh)
}


