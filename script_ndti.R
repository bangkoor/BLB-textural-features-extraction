# Install and load required package if not already installed
# install.packages("raster")

library(raster)

# File paths for the input rasters
raster_path1 <- "12_r_b8.tif"
raster_path2 <- "12_g_b6.tif"

# Define output raster file path
output_path <- "NDTI/12_r_g_b8.tif"

# Load the single-band rasters
raster1 <- raster(raster_path1)
raster2 <- raster(raster_path2)

# Check if the dimensions of the rasters are compatible
if (!compareRaster(raster1, raster2)) {
  stop("The dimensions of the rasters are not compatible.")
}

# Calculate Normalized Difference Index (NDI)
ndi <- (raster1 - raster2) / (raster1 + raster2)

# Export the NDI result to a new raster file
writeRaster(ndi, output_path, format = "GTiff", overwrite = TRUE)
