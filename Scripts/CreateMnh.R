library(raster)

mns <- raster("/Users/maxbruciamacchie/pCloudSync/EnCours/Ecole/DonneesBrutes/Rasters/MNS.tif") %>%
  aggregate(fact=5)

mnt <- raster("/Users/maxbruciamacchie/pCloudSync/EnCours/Ecole/DonneesBrutes/Rasters/MNT.tif") %>%
  resample(mns)

mnh = mns - mnt
mnh[mnh < 0] <- 0

cad <- st_read("/Users/maxbruciamacchie/pCloudSync/EnCours/Ecole/DonneesBrutes/Vecteurs/Parcelles.gpkg") %>%
  filter(commune == "54578" & section == "AN" & numero == "11")

mnh <- mnh %>%
  crop(cad) %>%
  mask(cad)

plot(mnh)
