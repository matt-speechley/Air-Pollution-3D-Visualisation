#import relevant libraries
library(raster)
library(rgdal)
library(ggplot2)
library(sf)

# import tif
rastered_tif <- raster("12.tif")

#check crs type of tif (map projection)
#crs(rastered_tif)

#re-project tif to crs=4326 (standard latitude and longitude)
reprojected <- projectRaster(rastered_tif, crs=4326)

#uncomment to confirm successful reprojection
#crs(reprojected)

#create matrix from raster
data_matrix <- rasterToPoints(reprojected)

#preview data (order is longitude, latitude, value)
#head(data_matrix)
#tail(data_matrix)

#write CSV file
write.csv(data_matrix, '12repo.csv', row.names=FALSE)

