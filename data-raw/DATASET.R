## code to prepare `DATASET` dataset goes here

librarian::shelf(terra,sf,stars,tidyverse, raster)

# ---------- DATA MNH
mnh <- rast("/Users/maxm1/pCloudSync/Packages/Gurnaud1/data/mnh.tif")
ug <- st_read('/Users/maxm1/pCloudSync/Packages/Gurnaud1/data/ZoneTestMnh.gpkg', quiet=T)

mnh <- readAll(raster(mnh))
usethis::use_data(mnh, overwrite = TRUE)
usethis::use_data(ug, overwrite = TRUE)
