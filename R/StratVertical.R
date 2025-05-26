#' Stratification verticale
#'
#' @description Calcul de l'indicateur stratification verticale à partir d'un MNH
#'
#' @param Lat = latitude.
#' @param Lon = longitude.
#'
#' @import tidyverse
#' @import terra
#' @import sf
#' @import stars
#'
#' @author Bruciamacchie Max
#'
#' @examples
#' \donttest{
#' librarian::shelf(terra,sf,stars,tidyverse)
#'
#' }
#
#' @export

StratVertical <- function(r, shp, pas=25) {
  names(r) <- "mnh"

  shp <- shp |>
    st_transform(2154) |>
    dplyr::select(NumUG)

  r1 <- r |>
    crop(shp) |>
    project("EPSG:2154") |>
    mask(shp)

  # ---------- hauteur
  t1 <- st_as_stars(r1) |>
    st_as_sf(as_points=T) |>
    st_intersection(shp) |>
    st_drop_geometry() |>
    group_by(NumUG) |>
    summarise(Haut = mean(mnh))

  # ---------- stratification
  map <- focal(r1, w=pas, fun=sd, na.rm=TRUE)

  t2 <- map |>
    st_as_stars() |>
    st_as_sf(as_points=T) |>
    st_intersection(shp) |>
    st_drop_geometry() |>
    group_by(NumUG) |>
    summarise(Moy = mean(focal_sd),
              SD = sd(focal_sd))

  # ---------- return
  t3 <- t1 |>
    left_join(t2, by = join_by(NumUG))

  out <- list(map, t3)
  names(out) <- c("map", "tab")
  return(out)
}
