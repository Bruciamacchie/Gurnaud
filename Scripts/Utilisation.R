librarian::shelf(terra, sf, tidyverse)

usethis::use_git()
usethis::create_github_token()
usethis::edit_r_environ()
usethis::use_github()



mns <- rast("/Users/maxm1/pCloudSync/EnCours/Ecole/DonneesBrutes/Rasters/MNS.tif")
mnt <- rast("/Users/maxm1/pCloudSync/EnCours/Ecole/DonneesBrutes/Rasters/MNT.tif")


plot(mnh)
