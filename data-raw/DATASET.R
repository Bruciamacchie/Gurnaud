## code to prepare `DATASET` dataset goes here

librarian::shelf(terra,sf,stars,tidyverse)

# ---------- DATA MNH
mnh <- rast("/Users/maxm1/pCloudSync/Packages/Gurnaud1/data/mnh.tif")
ug <- st_read('/Users/maxm1/pCloudSync/Packages/Gurnaud1/data/ZoneTestMnh.gpkg', quiet=T)

usethis::use_data(mnh)
usethis::use_data(ug)
