


##Code 3


################### Code designed for model validation #######################
## We selected the @@M6.2 Jishishan earthquake in 18 Dec. 2023@@ as a case study to compare the differences in building damage, material losses, and casualties.


#### Inputs
######################################################################
##1. basic information
lngg <- 35.7   ##Latitude epicentre
latt <- 102.79   ##Longitude epicentre
mngg <- 6.2    ##Earthquake magnitude
mod <- read_sf("Gansu.shp")  ##Geographical boundaries of Gansu Province
2.24 -> a    ##Coefficient of intensity-distance attenuation function
1.2685 -> b   ##Coefficient of intensity-distance attenuation function
0.91526 -> c   ##Coefficient of intensity-distance attenuation function
8.6547 -> d   ##Coefficient of intensity-distance attenuation function
0.0092 -> e   ##Coefficient of intensity-distance attenuation function
##Please refer to Table S10 in the Supplementary materials

##2. Raster data of gridded stocks and population
rast("building_MS2020.tif") -> ms  ##Total building stocks in 2020
rast("Steel2020B.tif") -> steel ##Total steel stocks in 2020
rast("Copper2020B.tif") -> copper  ##Total copper stocks in 2020
rast("Cement2020B.tif") -> cement  ##Total cement stocks in 2020
rast("pop_SE.tif") -> popse  ##Total population count
##Please refer to this open-source dataset https://doi.org/10.1038/s41597-023-02830-8

##3. Raster data of stocks ratio and population distribution
###stocks ratio: dr_"material"_"structure"_"floor"_"seismic design";
###population distribution: pr_"structure"_"floor"_"seismic design";
rast("dr_Steel_bc_a_H.tif") -> dr_Steel_bc_a_H
rast("dr_Steel_bc_a_L.tif") -> dr_Steel_bc_a_L
rast("dr_Steel_bc_a_M.tif") -> dr_Steel_bc_a_M
rast("dr_Steel_bc_a_P.tif") -> dr_Steel_bc_a_P
rast("dr_Steel_bc_b_P.tif") -> dr_Steel_bc_b_P
rast("dr_Steel_bc_b_L.tif") -> dr_Steel_bc_b_L
rast("dr_Steel_bc_b_M.tif") -> dr_Steel_bc_b_M
rast("dr_Steel_bc_b_P.tif") -> dr_Steel_bc_b_P
rast("dr_Steel_bw_H.tif") -> dr_Steel_bw_H
rast("dr_Steel_bw_L.tif") -> dr_Steel_bw_L
rast("dr_Steel_bw_M.tif") -> dr_Steel_bw_M
rast("dr_Steel_bw_P.tif") -> dr_Steel_bw_P
rast("dr_Steel_rc_a_H.tif") -> dr_Steel_rc_a_H
rast("dr_Steel_rc_a_M.tif") -> dr_Steel_rc_a_M
rast("dr_Steel_rc_a_L.tif") -> dr_Steel_rc_a_L
rast("dr_Steel_rc_a_P.tif") -> dr_Steel_rc_a_P
rast("dr_Steel_rc_b_H.tif") -> dr_Steel_rc_b_H
rast("dr_Steel_rc_b_M.tif") -> dr_Steel_rc_b_M
rast("dr_Steel_rc_b_L.tif") -> dr_Steel_rc_b_L
rast("dr_Steel_rc_b_P.tif") -> dr_Steel_rc_b_P
rast("dr_Steel_rc_c_H.tif") -> dr_Steel_rc_c_H
rast("dr_Steel_rc_c_M.tif") -> dr_Steel_rc_c_M
rast("dr_Steel_rc_c_L.tif") -> dr_Steel_rc_c_L
rast("dr_Steel_rc_c_P.tif") -> dr_Steel_rc_c_P
rast("dr_Copper_bc_a_H.tif") -> dr_Copper_bc_a_H
rast("dr_Copper_bc_a_L.tif") -> dr_Copper_bc_a_L
rast("dr_Copper_bc_a_M.tif") -> dr_Copper_bc_a_M
rast("dr_Copper_bc_a_P.tif") -> dr_Copper_bc_a_P
rast("dr_Copper_bc_b_P.tif") -> dr_Copper_bc_b_P
rast("dr_Copper_bc_b_L.tif") -> dr_Copper_bc_b_L
rast("dr_Copper_bc_b_M.tif") -> dr_Copper_bc_b_M
rast("dr_Copper_bc_b_P.tif") -> dr_Copper_bc_b_P
rast("dr_Copper_bw_H.tif") -> dr_Copper_bw_H
rast("dr_Copper_bw_L.tif") -> dr_Copper_bw_L
rast("dr_Copper_bw_M.tif") -> dr_Copper_bw_M
rast("dr_Copper_bw_P.tif") -> dr_Copper_bw_P
rast("dr_Copper_rc_a_H.tif") -> dr_Copper_rc_a_H
rast("dr_Copper_rc_a_M.tif") -> dr_Copper_rc_a_M
rast("dr_Copper_rc_a_L.tif") -> dr_Copper_rc_a_L
rast("dr_Copper_rc_a_P.tif") -> dr_Copper_rc_a_P
rast("dr_Copper_rc_b_H.tif") -> dr_Copper_rc_b_H
rast("dr_Copper_rc_b_M.tif") -> dr_Copper_rc_b_M
rast("dr_Copper_rc_b_L.tif") -> dr_Copper_rc_b_L
rast("dr_Copper_rc_b_P.tif") -> dr_Copper_rc_b_P
rast("dr_Copper_rc_c_H.tif") -> dr_Copper_rc_c_H
rast("dr_Copper_rc_c_M.tif") -> dr_Copper_rc_c_M
rast("dr_Copper_rc_c_L.tif") -> dr_Copper_rc_c_L
rast("dr_Copper_rc_c_P.tif") -> dr_Copper_rc_c_P
rast("dr_Cement_bc_a_H.tif") -> dr_Cement_bc_a_H
rast("dr_Cement_bc_a_L.tif") -> dr_Cement_bc_a_L
rast("dr_Cement_bc_a_M.tif") -> dr_Cement_bc_a_M
rast("dr_Cement_bc_a_P.tif") -> dr_Cement_bc_a_P
rast("dr_Cement_bc_b_P.tif") -> dr_Cement_bc_b_P
rast("dr_Cement_bc_b_L.tif") -> dr_Cement_bc_b_L
rast("dr_Cement_bc_b_M.tif") -> dr_Cement_bc_b_M
rast("dr_Cement_bc_b_P.tif") -> dr_Cement_bc_b_P
rast("dr_Cement_bw_H.tif") -> dr_Cement_bw_H
rast("dr_Cement_bw_L.tif") -> dr_Cement_bw_L
rast("dr_Cement_bw_M.tif") -> dr_Cement_bw_M
rast("dr_Cement_bw_P.tif") -> dr_Cement_bw_P
rast("dr_Cement_rc_a_H.tif") -> dr_Cement_rc_a_H
rast("dr_Cement_rc_a_M.tif") -> dr_Cement_rc_a_M
rast("dr_Cement_rc_a_L.tif") -> dr_Cement_rc_a_L
rast("dr_Cement_rc_a_P.tif") -> dr_Cement_rc_a_P
rast("dr_Cement_rc_b_H.tif") -> dr_Cement_rc_b_H
rast("dr_Cement_rc_b_M.tif") -> dr_Cement_rc_b_M
rast("dr_Cement_rc_b_L.tif") -> dr_Cement_rc_b_L
rast("dr_Cement_rc_b_P.tif") -> dr_Cement_rc_b_P
rast("dr_Cement_rc_c_H.tif") -> dr_Cement_rc_c_H
rast("dr_Cement_rc_c_M.tif") -> dr_Cement_rc_c_M
rast("dr_Cement_rc_c_L.tif") -> dr_Cement_rc_c_L
rast("dr_Cement_rc_c_P.tif") -> dr_Cement_rc_c_P
rast("pr_bc_a_H.tif") -> pr_bc_a_H
rast("pr_bc_a_L.tif") -> pr_bc_a_L
rast("pr_bc_a_M.tif") -> pr_bc_a_M
rast("pr_bc_a_P.tif") -> pr_bc_a_P
rast("pr_bc_b_P.tif") -> pr_bc_b_P
rast("pr_bc_b_L.tif") -> pr_bc_b_L
rast("pr_bc_b_M.tif") -> pr_bc_b_M
rast("pr_bc_b_P.tif") -> pr_bc_b_P
rast("pr_bw_H.tif") -> pr_bw_H
rast("pr_bw_L.tif") -> pr_bw_L
rast("pr_bw_M.tif") -> pr_bw_M
rast("pr_bw_P.tif") -> pr_bw_P
rast("pr_rc_a_H.tif") -> pr_rc_a_H
rast("pr_rc_a_M.tif") -> pr_rc_a_M
rast("pr_rc_a_L.tif") -> pr_rc_a_L
rast("pr_rc_a_P.tif") -> pr_rc_a_P
rast("pr_rc_b_H.tif") -> pr_rc_b_H
rast("pr_rc_b_M.tif") -> pr_rc_b_M
rast("pr_rc_b_L.tif") -> pr_rc_b_L
rast("pr_rc_b_P.tif") -> pr_rc_b_P
rast("pr_rc_c_H.tif") -> pr_rc_c_H
rast("pr_rc_c_M.tif") -> pr_rc_c_M
rast("pr_rc_c_L.tif") -> pr_rc_c_L
rast("pr_rc_c_P.tif") -> pr_rc_c_P
##ALL raster data are available on request from J.S. (sunjian143687@163.com; jians@cqu.edu.cn).
######################################################################

####Outputs
##1. cement_results: Simulated damage stocks of cement
##2. copper_results: Simulated damage stocks of copper
##3. steel_results: Simulated damage stocks of steel
##4. pop_results: Simulated injury and death population

#### packages
{
  require(tidyverse)
  require(terra)
  require(sf)
  require(raster)
}


#####function
ms %>% 
  crop(mod) %>% 
  mask(mod) -> df0
df0[df0==0] <- NA

df0 %>% 
  raster() %>% 
  rasterToPoints(spatial = T) %>% 
  st_as_sf() -> df3
df3 %>% 
  st_coordinates() %>% 
  as_tibble() %>% 
  rename(lon=X, lat = Y) -> jwd
df3 %>% 
  mutate(lon=jwd$lon,
         lat=jwd$lat
  ) %>% 
  unite("link", lon, lat) %>% 
  dplyr::select(-1) -> df4
mod %>% st_crs() -> crss

tibble(lngg, latt, mngg) %>% 
  set_names("lat", "lon", "MM") %>% 
  st_as_sf(coords = c("lon", "lat"), crs=4326) %>% 
  st_transform(crss) -> ptt

df4 %>% 
  mutate(dist=st_distance(df4, ptt)) %>% 
  mutate(dist=units::set_units(dist, "km")) %>% 
  mutate(dist=as.numeric(dist)) %>% 
  mutate(ac=2^(a+b*mngg-c*log(dist+d))*e) %>% 
  mutate(ac=(ac/9.81)/0.0254) %>% 
  st_drop_geometry() %>% 
  as_tibble() -> df6

steel %>% 
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "steel") -> steel1

copper %>% 
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "copper") -> copper1

cement %>% 
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "cement") -> cement1

popse %>% 
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>%
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "pop") -> pop1

dr_Steel_bc_a_H %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Steel_bc_a_H") -> Steel_bc_a_H



dr_Steel_bc_a_L %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Steel_bc_a_L") -> Steel_bc_a_L


dr_Steel_bc_a_M %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Steel_bc_a_M") -> Steel_bc_a_M




dr_Steel_bc_a_P %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Steel_bc_a_P") -> Steel_bc_a_P



dr_Steel_bc_b_P %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Steel_bc_b_H") -> Steel_bc_b_H


dr_Steel_bc_b_L %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Steel_bc_b_L") -> Steel_bc_b_L


dr_Steel_bc_b_M %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Steel_bc_b_M") -> Steel_bc_b_M


dr_Steel_bc_b_P %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Steel_bc_b_P") -> Steel_bc_b_P


dr_Steel_bw_H %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Steel_bw_H") -> Steel_bw_H

dr_Steel_bw_L %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Steel_bw_L") -> Steel_bw_L


dr_Steel_bw_M %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Steel_bw_M") -> Steel_bw_M


dr_Steel_bw_P %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Steel_bw_P") -> Steel_bw_P


dr_Steel_rc_a_H %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Steel_rc_a_H") -> Steel_rc_a_H


dr_Steel_rc_a_L %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Steel_rc_a_L") -> Steel_rc_a_L


dr_Steel_rc_a_M %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Steel_rc_a_M") -> Steel_rc_a_M


dr_Steel_rc_a_P %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Steel_rc_a_P") -> Steel_rc_a_P


dr_Steel_rc_b_H %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Steel_rc_b_H") -> Steel_rc_b_H


dr_Steel_rc_b_L %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Steel_rc_b_L") -> Steel_rc_b_L


dr_Steel_rc_b_M %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Steel_rc_b_M") -> Steel_rc_b_M


dr_Steel_rc_b_P %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Steel_rc_b_P") -> Steel_rc_b_P


dr_Steel_rc_c_H %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Steel_rc_c_H") -> Steel_rc_c_H


dr_Steel_rc_c_L %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Steel_rc_c_L") -> Steel_rc_c_L


dr_Steel_rc_c_M %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Steel_rc_c_M") -> Steel_rc_c_M


dr_Steel_rc_c_P %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Steel_rc_c_P") -> Steel_rc_c_P



dr_Copper_bc_a_H %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Copper_bc_a_H") -> Copper_bc_a_H

dr_Copper_bc_a_L %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Copper_bc_a_L") -> Copper_bc_a_L

dr_Copper_bc_a_M %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Copper_bc_a_M") -> Copper_bc_a_M


dr_Copper_bc_a_P %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Copper_bc_a_P") -> Copper_bc_a_P


dr_Copper_bc_b_H %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Copper_bc_b_H") -> Copper_bc_b_H


dr_Copper_bc_b_L %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Copper_bc_b_L") -> Copper_bc_b_L


dr_Copper_bc_b_M %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Copper_bc_b_M") -> Copper_bc_b_M


dr_Copper_bc_b_P %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Copper_bc_b_P") -> Copper_bc_b_P


dr_Copper_bw_H %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Copper_bw_H") -> Copper_bw_H


dr_Copper_bw_L %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Copper_bw_L") -> Copper_bw_L


dr_Copper_bw_M %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Copper_bw_M") -> Copper_bw_M


dr_Copper_bw_P %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Copper_bw_P") -> Copper_bw_P


dr_Copper_rc_a_H %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Copper_rc_a_H") -> Copper_rc_a_H


dr_Copper_rc_a_L %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Copper_rc_a_L") -> Copper_rc_a_L


dr_Copper_rc_a_M %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Copper_rc_a_M") -> Copper_rc_a_M


dr_Copper_rc_a_P %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Copper_rc_a_P") -> Copper_rc_a_P


dr_Copper_rc_b_H %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Copper_rc_b_H") -> Copper_rc_b_H


dr_Copper_rc_b_L %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Copper_rc_b_L") -> Copper_rc_b_L


dr_Copper_rc_b_M %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Copper_rc_b_M") -> Copper_rc_b_M


dr_Copper_rc_b_P %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Copper_rc_b_P") -> Copper_rc_b_P


dr_Copper_rc_c_H %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Copper_rc_c_H") -> Copper_rc_c_H


dr_Copper_rc_c_L %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Copper_rc_c_L") -> Copper_rc_c_L


dr_Copper_rc_c_M %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Copper_rc_c_M") -> Copper_rc_c_M


dr_Copper_rc_c_P %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Copper_rc_c_P") -> Copper_rc_c_P



dr_Cement_bc_a_H %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Cement_bc_a_H") -> Cement_bc_a_H

dr_Cement_bc_a_L %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Cement_bc_a_L") -> Cement_bc_a_L

dr_Cement_bc_a_M %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Cement_bc_a_M") -> Cement_bc_a_M


dr_Cement_bc_a_P %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Cement_bc_a_P") -> Cement_bc_a_P


dr_Cement_bc_b_H %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Cement_bc_b_H") -> Cement_bc_b_H


dr_Cement_bc_b_L %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Cement_bc_b_L") -> Cement_bc_b_L


dr_Cement_bc_b_M %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Cement_bc_b_M") -> Cement_bc_b_M


dr_Cement_bc_b_P %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Cement_bc_b_P") -> Cement_bc_b_P


dr_Cement_bw_H %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Cement_bw_H") -> Cement_bw_H


dr_Cement_bw_L %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Cement_bw_L") -> Cement_bw_L


dr_Cement_bw_M %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Cement_bw_M") -> Cement_bw_M


dr_Cement_bw_P %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Cement_bw_P") -> Cement_bw_P


dr_Cement_rc_a_H %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Cement_rc_a_H") -> Cement_rc_a_H


dr_Cement_rc_a_L %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Cement_rc_a_L") -> Cement_rc_a_L


dr_Cement_rc_a_M %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Cement_rc_a_M") -> Cement_rc_a_M


dr_Cement_rc_a_P %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Cement_rc_a_P") -> Cement_rc_a_P


dr_Cement_rc_b_H %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Cement_rc_b_H") -> Cement_rc_b_H


dr_Cement_rc_b_L %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Cement_rc_b_L") -> Cement_rc_b_L


dr_Cement_rc_b_M %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Cement_rc_b_M") -> Cement_rc_b_M


dr_Cement_rc_b_P %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Cement_rc_b_P") -> Cement_rc_b_P


dr_Cement_rc_c_H %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Cement_rc_c_H") -> Cement_rc_c_H


dr_Cement_rc_c_L %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Cement_rc_c_L") -> Cement_rc_c_L


dr_Cement_rc_c_M %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Cement_rc_c_M") -> Cement_rc_c_M


dr_Cement_rc_c_P %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "Cement_rc_c_P") -> Cement_rc_c_P




pr_bc_a_H %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "pop_bc_a_H") -> pop_bc_a_H

pr_bc_a_L %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "pop_bc_a_L") -> pop_bc_a_L

pr_bc_a_M %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "pop_bc_a_M") -> pop_bc_a_M


pr_bc_a_P %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "pop_bc_a_P") -> pop_bc_a_P


pr_bc_b_H %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "pop_bc_b_H") -> pop_bc_b_H


pr_bc_b_L %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "pop_bc_b_L") -> pop_bc_b_L


pr_bc_b_M %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "pop_bc_b_M") -> pop_bc_b_M


pr_bc_b_P %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "pop_bc_b_P") -> pop_bc_b_P


pr_bw_H %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "pop_bw_H") -> pop_bw_H


pr_bw_L %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "pop_bw_L") -> pop_bw_L


pr_bw_M %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "pop_bw_M") -> pop_bw_M


pr_bw_P %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "pop_bw_P") -> pop_bw_P


pr_rc_a_H %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "pop_rc_a_H") -> pop_rc_a_H


pr_rc_a_L %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "pop_rc_a_L") -> pop_rc_a_L

pr_rc_a_M %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "pop_rc_a_M") -> pop_rc_a_M


pr_rc_a_P %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "pop_rc_a_P") -> pop_rc_a_P


pr_rc_b_H %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "pop_rc_b_H") -> pop_rc_b_H


pr_rc_b_L %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "pop_rc_b_L") -> pop_rc_b_L


pr_rc_b_M %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "pop_rc_b_M") -> pop_rc_b_M


pr_rc_b_P %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "pop_rc_b_P") -> pop_rc_b_P


pr_rc_c_H %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "pop_rc_c_H") -> pop_rc_c_H


pr_rc_c_L %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "pop_rc_c_L") -> pop_rc_c_L


pr_rc_c_M %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "pop_rc_c_M") -> pop_rc_c_M


pr_rc_c_P %>%
  crop(mod) %>% 
  mask(mod) %>% 
  crop(df0) %>% 
  mask(df0) %>% 
  raster() %>% 
  rasterToPoints() %>% 
  as_tibble() %>% 
  rename(lon=x, lat = y) %>% 
  unite("link", lon, lat) %>% 
  set_names("link", "pop_rc_c_P") -> pop_rc_c_P



steel1 %>% 
  left_join(df6) %>% 
  left_join(copper1) %>% 
  left_join(cement1) %>% 
  left_join(pop1) %>% 
  left_join(Steel_bc_a_H) %>% 
  left_join(Steel_bc_a_L) %>% 
  left_join(Steel_bc_a_M) %>% 
  left_join(Steel_bc_a_P) %>% 
  left_join(Steel_bc_b_H) %>% 
  left_join(Steel_bc_b_L) %>% 
  left_join(Steel_bc_b_M) %>% 
  left_join(Steel_bc_b_P) %>% 
  left_join(Steel_bw_H) %>% 
  left_join(Steel_bw_L) %>% 
  left_join(Steel_bw_M) %>% 
  left_join(Steel_bw_P) %>% 
  left_join(Steel_rc_a_H) %>% 
  left_join(Steel_rc_a_L) %>% 
  left_join(Steel_rc_a_M) %>% 
  left_join(Steel_rc_a_P) %>% 
  left_join(Steel_rc_b_H) %>% 
  left_join(Steel_rc_b_L) %>% 
  left_join(Steel_rc_b_M) %>% 
  left_join(Steel_rc_b_P) %>% 
  left_join(Steel_rc_c_H) %>% 
  left_join(Steel_rc_c_L) %>% 
  left_join(Steel_rc_c_M) %>% 
  left_join(Steel_rc_c_P) %>% 
  left_join(Copper_bc_a_H) %>% 
  left_join(Copper_bc_a_L) %>% 
  left_join(Copper_bc_a_M) %>% 
  left_join(Copper_bc_a_P) %>% 
  left_join(Copper_bc_b_H) %>% 
  left_join(Copper_bc_b_L) %>% 
  left_join(Copper_bc_b_M) %>% 
  left_join(Copper_bc_b_P) %>% 
  left_join(Copper_bw_H) %>% 
  left_join(Copper_bw_L) %>% 
  left_join(Copper_bw_M) %>% 
  left_join(Copper_bw_P) %>% 
  left_join(Copper_rc_a_H) %>% 
  left_join(Copper_rc_a_L) %>% 
  left_join(Copper_rc_a_M) %>% 
  left_join(Copper_rc_a_P) %>% 
  left_join(Copper_rc_b_H) %>% 
  left_join(Copper_rc_b_L) %>% 
  left_join(Copper_rc_b_M) %>% 
  left_join(Copper_rc_b_P) %>% 
  left_join(Copper_rc_c_H) %>% 
  left_join(Copper_rc_c_L) %>% 
  left_join(Copper_rc_c_M) %>% 
  left_join(Copper_rc_c_P) %>% 
  left_join(Cement_bc_a_H) %>% 
  left_join(Cement_bc_a_L) %>% 
  left_join(Cement_bc_a_M) %>% 
  left_join(Cement_bc_a_P) %>% 
  left_join(Cement_bc_b_H) %>% 
  left_join(Cement_bc_b_L) %>% 
  left_join(Cement_bc_b_M) %>% 
  left_join(Cement_bc_b_P) %>% 
  left_join(Cement_bw_H) %>% 
  left_join(Cement_bw_L) %>% 
  left_join(Cement_bw_M) %>% 
  left_join(Cement_bw_P) %>% 
  left_join(Cement_rc_a_H) %>% 
  left_join(Cement_rc_a_L) %>% 
  left_join(Cement_rc_a_M) %>% 
  left_join(Cement_rc_a_P) %>% 
  left_join(Cement_rc_b_H) %>% 
  left_join(Cement_rc_b_L) %>% 
  left_join(Cement_rc_b_M) %>% 
  left_join(Cement_rc_b_P) %>% 
  left_join(Cement_rc_c_H) %>% 
  left_join(Cement_rc_c_L) %>% 
  left_join(Cement_rc_c_M) %>% 
  left_join(Cement_rc_c_P) %>% 
  left_join(pop_bc_a_H) %>% 
  left_join(pop_bc_a_L) %>% 
  left_join(pop_bc_a_M) %>% 
  left_join(pop_bc_a_P) %>% 
  left_join(pop_bc_b_H) %>% 
  left_join(pop_bc_b_L) %>% 
  left_join(pop_bc_b_M) %>% 
  left_join(pop_bc_b_P) %>% 
  left_join(pop_bw_H) %>% 
  left_join(pop_bw_L) %>% 
  left_join(pop_bw_M) %>% 
  left_join(pop_bw_P) %>% 
  left_join(pop_rc_a_H) %>% 
  left_join(pop_rc_a_L) %>% 
  left_join(pop_rc_a_M) %>% 
  left_join(pop_rc_a_P) %>% 
  left_join(pop_rc_b_H) %>% 
  left_join(pop_rc_b_L) %>% 
  left_join(pop_rc_b_M) %>% 
  left_join(pop_rc_b_P) %>% 
  left_join(pop_rc_c_H) %>% 
  left_join(pop_rc_c_L) %>% 
  left_join(pop_rc_c_M) %>% 
  left_join(pop_rc_c_P) %>% 
  mutate(pop=if_else(is.na(pop),0,pop))-> sj


sj %>% 
  mutate(Steel_bc_a_H=steel*Steel_bc_a_H) %>% 
  mutate(Steel_bc_a_L=steel*Steel_bc_a_L) %>% 
  mutate(Steel_bc_a_M=steel*Steel_bc_a_M) %>% 
  mutate(Steel_bc_a_P=steel*Steel_bc_a_P) %>% 
  mutate(Steel_bc_b_H=steel*Steel_bc_b_H) %>% 
  mutate(Steel_bc_b_L=steel*Steel_bc_b_L) %>% 
  mutate(Steel_bc_b_M=steel*Steel_bc_b_M) %>% 
  mutate(Steel_bc_b_P=steel*Steel_bc_b_P) %>% 
  mutate(Steel_bw_H=steel*Steel_bw_H) %>% 
  mutate(Steel_bw_L=steel*Steel_bw_L) %>% 
  mutate(Steel_bw_M=steel*Steel_bw_M) %>% 
  mutate(Steel_bw_P=steel*Steel_bw_P) %>% 
  mutate(Steel_rc_a_H=steel*Steel_rc_a_H) %>% 
  mutate(Steel_rc_a_L=steel*Steel_rc_a_L) %>% 
  mutate(Steel_rc_a_M=steel*Steel_rc_a_M) %>% 
  mutate(Steel_rc_a_P=steel*Steel_rc_a_P) %>% 
  mutate(Steel_rc_b_H=steel*Steel_rc_b_H) %>% 
  mutate(Steel_rc_b_L=steel*Steel_rc_b_L) %>% 
  mutate(Steel_rc_b_M=steel*Steel_rc_b_M) %>% 
  mutate(Steel_rc_b_P=steel*Steel_rc_b_P) %>% 
  mutate(Steel_rc_c_H=steel*Steel_rc_c_H) %>% 
  mutate(Steel_rc_c_L=steel*Steel_rc_c_L) %>% 
  mutate(Steel_rc_c_M=steel*Steel_rc_c_M) %>% 
  mutate(Steel_rc_c_P=steel*Steel_rc_c_P) %>% 
  mutate(Cement_bc_a_H=cement*Cement_bc_a_H) %>% 
  mutate(Cement_bc_a_L=cement*Cement_bc_a_L) %>% 
  mutate(Cement_bc_a_M=cement*Cement_bc_a_M) %>% 
  mutate(Cement_bc_a_P=cement*Cement_bc_a_P) %>% 
  mutate(Cement_bc_b_H=cement*Cement_bc_b_H) %>% 
  mutate(Cement_bc_b_L=cement*Cement_bc_b_L) %>% 
  mutate(Cement_bc_b_M=cement*Cement_bc_b_M) %>% 
  mutate(Cement_bc_b_P=cement*Cement_bc_b_P) %>% 
  mutate(Cement_bw_H=cement*Cement_bw_H) %>% 
  mutate(Cement_bw_L=cement*Cement_bw_L) %>% 
  mutate(Cement_bw_M=cement*Cement_bw_M) %>% 
  mutate(Cement_bw_P=cement*Cement_bw_P) %>% 
  mutate(Cement_rc_a_H=cement*Cement_rc_a_H) %>% 
  mutate(Cement_rc_a_L=cement*Cement_rc_a_L) %>% 
  mutate(Cement_rc_a_M=cement*Cement_rc_a_M) %>% 
  mutate(Cement_rc_a_P=cement*Cement_rc_a_P) %>% 
  mutate(Cement_rc_b_H=cement*Cement_rc_b_H) %>% 
  mutate(Cement_rc_b_L=cement*Cement_rc_b_L) %>% 
  mutate(Cement_rc_b_M=cement*Cement_rc_b_M) %>% 
  mutate(Cement_rc_b_P=cement*Cement_rc_b_P) %>% 
  mutate(Cement_rc_c_H=cement*Cement_rc_c_H) %>% 
  mutate(Cement_rc_c_L=cement*Cement_rc_c_L) %>% 
  mutate(Cement_rc_c_M=cement*Cement_rc_c_M) %>% 
  mutate(Cement_rc_c_P=cement*Cement_rc_c_P) %>% 
  mutate(Copper_bc_a_H=copper*Copper_bc_a_H) %>% 
  mutate(Copper_bc_a_L=copper*Copper_bc_a_L) %>% 
  mutate(Copper_bc_a_M=copper*Copper_bc_a_M) %>% 
  mutate(Copper_bc_a_P=copper*Copper_bc_a_P) %>% 
  mutate(Copper_bc_b_H=copper*Copper_bc_b_H) %>% 
  mutate(Copper_bc_b_L=copper*Copper_bc_b_L) %>% 
  mutate(Copper_bc_b_M=copper*Copper_bc_b_M) %>% 
  mutate(Copper_bc_b_P=copper*Copper_bc_b_P) %>% 
  mutate(Copper_bw_H=copper*Copper_bw_H) %>% 
  mutate(Copper_bw_L=copper*Copper_bw_L) %>% 
  mutate(Copper_bw_M=copper*Copper_bw_M) %>% 
  mutate(Copper_bw_P=copper*Copper_bw_P) %>% 
  mutate(Copper_rc_a_H=copper*Copper_rc_a_H) %>% 
  mutate(Copper_rc_a_L=copper*Copper_rc_a_L) %>% 
  mutate(Copper_rc_a_M=copper*Copper_rc_a_M) %>% 
  mutate(Copper_rc_a_P=copper*Copper_rc_a_P) %>% 
  mutate(Copper_rc_b_H=copper*Copper_rc_b_H) %>% 
  mutate(Copper_rc_b_L=copper*Copper_rc_b_L) %>% 
  mutate(Copper_rc_b_M=copper*Copper_rc_b_M) %>% 
  mutate(Copper_rc_b_P=copper*Copper_rc_b_P) %>% 
  mutate(Copper_rc_c_H=copper*Copper_rc_c_H) %>% 
  mutate(Copper_rc_c_L=copper*Copper_rc_c_L) %>% 
  mutate(Copper_rc_c_M=copper*Copper_rc_c_M) %>% 
  mutate(Copper_rc_c_P=copper*Copper_rc_c_P) %>% 
  mutate(pop_bc_a_H=pop*pop_bc_a_H) %>% 
  mutate(pop_bc_a_L=pop*pop_bc_a_L) %>% 
  mutate(pop_bc_a_M=pop*pop_bc_a_M) %>% 
  mutate(pop_bc_a_P=pop*pop_bc_a_P) %>% 
  mutate(pop_bc_b_H=pop*pop_bc_b_H) %>% 
  mutate(pop_bc_b_L=pop*pop_bc_b_L) %>% 
  mutate(pop_bc_b_M=pop*pop_bc_b_M) %>% 
  mutate(pop_bc_b_P=pop*pop_bc_b_P) %>% 
  mutate(pop_bw_H=pop*pop_bw_H) %>% 
  mutate(pop_bw_L=pop*pop_bw_L) %>% 
  mutate(pop_bw_M=pop*pop_bw_M) %>% 
  mutate(pop_bw_P=pop*pop_bw_P) %>% 
  mutate(pop_rc_a_H=pop*pop_rc_a_H) %>% 
  mutate(pop_rc_a_L=pop*pop_rc_a_L) %>% 
  mutate(pop_rc_a_M=pop*pop_rc_a_M) %>% 
  mutate(pop_rc_a_P=pop*pop_rc_a_P) %>% 
  mutate(pop_rc_b_H=pop*pop_rc_b_H) %>% 
  mutate(pop_rc_b_L=pop*pop_rc_b_L) %>% 
  mutate(pop_rc_b_M=pop*pop_rc_b_M) %>% 
  mutate(pop_rc_b_P=pop*pop_rc_b_P) %>% 
  mutate(pop_rc_c_H=pop*pop_rc_c_H) %>% 
  mutate(pop_rc_c_L=pop*pop_rc_c_L) %>% 
  mutate(pop_rc_c_M=pop*pop_rc_c_M) %>% 
  mutate(pop_rc_c_P=pop*pop_rc_c_P) -> df2

df2$ac/17.0495 -> pwy

x1_bc_a_H <- (log(pwy/0.45))/0.925
x2_bc_a_H <- (log(pwy/0.89))/0.98
x3_bc_a_H <- (log(pwy/2.235))/1.035
x4_bc_a_H <- (log(pwy/5.205))/1.03

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bc_a_H_Copper_sli=per_sli*Copper_bc_a_H) %>% 
  mutate(bc_a_H_Copper_mod=per_mod*Copper_bc_a_H) %>% 
  mutate(bc_a_H_Copper_ext=per_ext*Copper_bc_a_H) %>% 
  mutate(bc_a_H_Copper_com=per_com*Copper_bc_a_H) -> df2

df2$ac/17.0495 -> pwy

x1_bc_a_H <- (log(pwy/0.41))/1
x2_bc_a_H <- (log(pwy/0.81))/1.05
x3_bc_a_H <- (log(pwy/2.03))/1.09
x4_bc_a_H <- (log(pwy/4.73))/1.08

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bc_a_M_Copper_sli=per_sli*Copper_bc_a_M) %>% 
  mutate(bc_a_M_Copper_mod=per_mod*Copper_bc_a_M) %>% 
  mutate(bc_a_M_Copper_ext=per_ext*Copper_bc_a_M) %>% 
  mutate(bc_a_M_Copper_com=per_com*Copper_bc_a_M) -> df2

df2$ac/17.0495 -> pwy

x1_bc_a_H <- (log(pwy/0.37))/1.075
x2_bc_a_H <- (log(pwy/0.73))/1.12
x3_bc_a_H <- (log(pwy/1.825))/1.145
x4_bc_a_H <- (log(pwy/4.255))/1.13

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bc_a_L_Copper_sli=per_sli*Copper_bc_a_L) %>% 
  mutate(bc_a_L_Copper_mod=per_mod*Copper_bc_a_L) %>% 
  mutate(bc_a_L_Copper_ext=per_ext*Copper_bc_a_L) %>% 
  mutate(bc_a_L_Copper_com=per_com*Copper_bc_a_L)-> df2

df2$ac/17.0495 -> pwy

x1_bc_a_H <- (log(pwy/0.32))/1.15
x2_bc_a_H <- (log(pwy/0.65))/1.19
x3_bc_a_H <- (log(pwy/1.62))/1.2
x4_bc_a_H <- (log(pwy/3.78))/1.18

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bc_a_P_Copper_sli=per_sli*Copper_bc_a_P) %>% 
  mutate(bc_a_P_Copper_mod=per_mod*Copper_bc_a_P) %>% 
  mutate(bc_a_P_Copper_ext=per_ext*Copper_bc_a_P) %>% 
  mutate(bc_a_P_Copper_com=per_com*Copper_bc_a_P)-> df2

df2$ac/10.9666 -> pwy

x1_bc_a_H <- (log(pwy/0.7))/0.865
x2_bc_a_H <- (log(pwy/1.385))/0.895
x3_bc_a_H <- (log(pwy/3.465))/0.855
x4_bc_a_H <- (log(pwy/8.09))/0.925

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bc_b_H_Copper_sli=per_sli*Copper_bc_b_H) %>% 
  mutate(bc_b_H_Copper_mod=per_mod*Copper_bc_b_H) %>% 
  mutate(bc_b_H_Copper_ext=per_ext*Copper_bc_b_H) %>% 
  mutate(bc_b_H_Copper_com=per_com*Copper_bc_b_H)-> df2

df2$ac/10.9666 -> pwy

x1_bc_a_H <- (log(pwy/0.63))/0.91
x2_bc_a_H <- (log(pwy/1.26))/0.92
x3_bc_a_H <- (log(pwy/3.15))/0.87
x4_bc_a_H <- (log(pwy/7.35))/0.91

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bc_b_M_Copper_sli=per_sli*Copper_bc_b_M) %>% 
  mutate(bc_b_M_Copper_mod=per_mod*Copper_bc_b_M) %>% 
  mutate(bc_b_M_Copper_ext=per_ext*Copper_bc_b_M) %>% 
  mutate(bc_b_M_Copper_com=per_com*Copper_bc_b_M)-> df2

df2$ac/10.9666 -> pwy

x1_bc_a_H <- (log(pwy/0.56))/0.955
x2_bc_a_H <- (log(pwy/1.135))/0.945
x3_bc_a_H <- (log(pwy/2.835))/0.885
x4_bc_a_H <- (log(pwy/6.615))/0.895

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bc_b_L_Copper_sli=per_sli*Copper_bc_b_L) %>% 
  mutate(bc_b_L_Copper_mod=per_mod*Copper_bc_b_L) %>% 
  mutate(bc_b_L_Copper_ext=per_ext*Copper_bc_b_L) %>% 
  mutate(bc_b_L_Copper_com=per_com*Copper_bc_b_L)-> df2

df2$ac/10.9666 -> pwy

x1_bc_a_H <- (log(pwy/0.5))/1
x2_bc_a_H <- (log(pwy/1.01))/0.97
x3_bc_a_H <- (log(pwy/2.52))/0.9
x4_bc_a_H <- (log(pwy/5.88))/0.88

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bc_b_P_Copper_sli=per_sli*Copper_bc_b_P) %>% 
  mutate(bc_b_P_Copper_mod=per_mod*Copper_bc_b_P) %>% 
  mutate(bc_b_P_Copper_ext=per_ext*Copper_bc_b_P) %>% 
  mutate(bc_b_P_Copper_com=per_com*Copper_bc_b_P)-> df2

df2$ac/11.4593 -> pwy

x1_bc_a_H <- (log(pwy/0.55))/0.8
x2_bc_a_H <- (log(pwy/1.51))/0.81
x3_bc_a_H <- (log(pwy/5.04))/0.85
x4_bc_a_H <- (log(pwy/12.6))/0.97

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bw_H_Copper_sli=per_sli*Copper_bw_H) %>% 
  mutate(bw_H_Copper_mod=per_mod*Copper_bw_H) %>% 
  mutate(bw_H_Copper_ext=per_ext*Copper_bw_H) %>% 
  mutate(bw_H_Copper_com=per_com*Copper_bw_H)-> df2

df2$ac/11.4593 -> pwy

x1_bc_a_H <- (log(pwy/0.5))/0.84
x2_bc_a_H <- (log(pwy/1.25))/0.86
x3_bc_a_H <- (log(pwy/3.86))/0.89
x4_bc_a_H <- (log(pwy/9.45))/1.04

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bw_M_Copper_sli=per_sli*Copper_bw_M) %>% 
  mutate(bw_M_Copper_mod=per_mod*Copper_bw_M) %>% 
  mutate(bw_M_Copper_ext=per_ext*Copper_bw_M) %>% 
  mutate(bw_M_Copper_com=per_com*Copper_bw_M)-> df2

df2$ac/11.4593 -> pwy

x1_bc_a_H <- (log(pwy/0.45))/0.93
x2_bc_a_H <- (log(pwy/1.25))/0.97
x3_bc_a_H <- (log(pwy/3.86))/1.03
x4_bc_a_H <- (log(pwy/9.45))/0.99

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bw_L_Copper_sli=per_sli*Copper_bw_L) %>% 
  mutate(bw_L_Copper_mod=per_mod*Copper_bw_L) %>% 
  mutate(bw_L_Copper_ext=per_ext*Copper_bw_L) %>% 
  mutate(bw_L_Copper_com=per_com*Copper_bw_L)-> df2

df2$ac/11.4593 -> pwy

x1_bc_a_H <- (log(pwy/0.4))/1.01
x2_bc_a_H <- (log(pwy/1))/1.05
x3_bc_a_H <- (log(pwy/3.09))/1.07
x4_bc_a_H <- (log(pwy/7.56))/1.05

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bw_P_Copper_sli=per_sli*Copper_bw_P) %>% 
  mutate(bw_P_Copper_mod=per_mod*Copper_bw_P) %>% 
  mutate(bw_P_Copper_ext=per_ext*Copper_bw_P) %>% 
  mutate(bw_P_Copper_com=per_com*Copper_bw_P)-> df2

df2$ac/13.7941 -> pwy

x1_bc_a_H <- (log(pwy/0.6))/1.04
x2_bc_a_H <- (log(pwy/1.19))/1.03
x3_bc_a_H <- (log(pwy/2.97))/1.04
x4_bc_a_H <- (log(pwy/6.93))/0.905

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_a_H_Copper_sli=per_sli*Copper_rc_a_H) %>% 
  mutate(rc_a_H_Copper_mod=per_mod*Copper_rc_a_H) %>% 
  mutate(rc_a_H_Copper_ext=per_ext*Copper_rc_a_H) %>% 
  mutate(rc_a_H_Copper_com=per_com*Copper_rc_a_H)-> df2

df2$ac/13.7941 -> pwy

x1_bc_a_H <- (log(pwy/0.54))/1.09
x2_bc_a_H <- (log(pwy/1.08))/1.07
x3_bc_a_H <- (log(pwy/2.7))/1.08
x4_bc_a_H <- (log(pwy/6.3))/0.91

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_a_M_Copper_sli=per_sli*Copper_rc_a_M) %>% 
  mutate(rc_a_M_Copper_mod=per_mod*Copper_rc_a_M) %>% 
  mutate(rc_a_M_Copper_ext=per_ext*Copper_rc_a_M) %>% 
  mutate(rc_a_M_Copper_com=per_com*Copper_rc_a_M)-> df2

df2$ac/13.7941 -> pwy

x1_bc_a_H <- (log(pwy/0.58))/1.14
x2_bc_a_H <- (log(pwy/0.97))/1.11
x3_bc_a_H <- (log(pwy/2.43))/1.12
x4_bc_a_H <- (log(pwy/5.67))/0.915

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_a_L_Copper_sli=per_sli*Copper_rc_a_L) %>% 
  mutate(rc_a_L_Copper_mod=per_mod*Copper_rc_a_L) %>% 
  mutate(rc_a_L_Copper_ext=per_ext*Copper_rc_a_L) %>% 
  mutate(rc_a_L_Copper_com=per_com*Copper_rc_a_L)-> df2

df2$ac/13.7941 -> pwy

x1_bc_a_H <- (log(pwy/0.43))/1.19
x2_bc_a_H <- (log(pwy/0.86))/1.15
x3_bc_a_H <- (log(pwy/2.16))/1.16
x4_bc_a_H <- (log(pwy/5.04))/0.92

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_a_P_Copper_sli=per_sli*Copper_rc_a_P) %>% 
  mutate(rc_a_P_Copper_mod=per_mod*Copper_rc_a_P) %>% 
  mutate(rc_a_P_Copper_ext=per_ext*Copper_rc_a_P) %>% 
  mutate(rc_a_P_Copper_com=per_com*Copper_rc_a_P)-> df2

df2$ac/10.6048 -> pwy

x1_bc_a_H <- (log(pwy/0.98))/0.825
x2_bc_a_H <- (log(pwy/1.98))/0.815
x3_bc_a_H <- (log(pwy/4.5))/0.79
x4_bc_a_H <- (log(pwy/11.55))/0.98

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_b_H_Copper_sli=per_sli*Copper_rc_b_H) %>% 
  mutate(rc_b_H_Copper_mod=per_mod*Copper_rc_b_H) %>% 
  mutate(rc_b_H_Copper_ext=per_ext*Copper_rc_b_H) %>% 
  mutate(rc_b_H_Copper_com=per_com*Copper_rc_b_H)-> df2

df2$ac/10.6048 -> pwy

x1_bc_a_H <- (log(pwy/0.9))/0.85
x2_bc_a_H <- (log(pwy/1.8))/0.83
x3_bc_a_H <- (log(pwy/4.2))/0.79
x4_bc_a_H <- (log(pwy/10.5))/0.98

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_b_M_Copper_sli=per_sli*Copper_rc_b_M) %>% 
  mutate(rc_b_M_Copper_mod=per_mod*Copper_rc_b_M) %>% 
  mutate(rc_b_M_Copper_ext=per_ext*Copper_rc_b_M) %>% 
  mutate(rc_b_M_Copper_com=per_com*Copper_rc_b_M)-> df2

df2$ac/10.6048 -> pwy

x1_bc_a_H <- (log(pwy/0.81))/0.875
x2_bc_a_H <- (log(pwy/1.62))/0.845
x3_bc_a_H <- (log(pwy/3.9))/0.79
x4_bc_a_H <- (log(pwy/9.45))/0.98

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_b_L_Copper_sli=per_sli*Copper_rc_b_L) %>% 
  mutate(rc_b_L_Copper_mod=per_mod*Copper_rc_b_L) %>% 
  mutate(rc_b_L_Copper_ext=per_ext*Copper_rc_b_L) %>% 
  mutate(rc_b_L_Copper_com=per_com*Copper_rc_b_L)-> df2

df2$ac/10.6048 -> pwy

x1_bc_a_H <- (log(pwy/0.72))/0.9
x2_bc_a_H <- (log(pwy/1.44))/0.86
x3_bc_a_H <- (log(pwy/3.6))/0.9
x4_bc_a_H <- (log(pwy/8.4))/0.96

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_b_P_Copper_sli=per_sli*Copper_rc_b_P) %>% 
  mutate(rc_b_P_Copper_mod=per_mod*Copper_rc_b_P) %>% 
  mutate(rc_b_P_Copper_ext=per_ext*Copper_rc_b_P) %>% 
  mutate(rc_b_P_Copper_com=per_com*Copper_rc_b_P)-> df2

df2$ac/4.8851 -> pwy

x1_bc_a_H <- (log(pwy/1.43))/0.7
x2_bc_a_H <- (log(pwy/2.85))/0.73
x3_bc_a_H <- (log(pwy/7.13))/0.9
x4_bc_a_H <- (log(pwy/16.63))/0.965

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_c_H_Copper_sli=per_sli*Copper_rc_c_H) %>% 
  mutate(rc_c_H_Copper_mod=per_mod*Copper_rc_c_H) %>% 
  mutate(rc_c_H_Copper_ext=per_ext*Copper_rc_c_H) %>% 
  mutate(rc_c_H_Copper_com=per_com*Copper_rc_c_H)-> df2

df2$ac/4.8851 -> pwy

x1_bc_a_H <- (log(pwy/1.3))/0.71
x2_bc_a_H <- (log(pwy/2.59))/0.74
x3_bc_a_H <- (log(pwy/6.48))/0.9
x4_bc_a_H <- (log(pwy/15.12))/0.96

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_c_M_Copper_sli=per_sli*Copper_rc_c_M) %>% 
  mutate(rc_c_M_Copper_mod=per_mod*Copper_rc_c_M) %>% 
  mutate(rc_c_M_Copper_ext=per_ext*Copper_rc_c_M) %>% 
  mutate(rc_c_M_Copper_com=per_com*Copper_rc_c_M)-> df2

df2$ac/4.8851 -> pwy

x1_bc_a_H <- (log(pwy/1.17))/0.72
x2_bc_a_H <- (log(pwy/2.33))/0.75
x3_bc_a_H <- (log(pwy/5.83))/0.9
x4_bc_a_H <- (log(pwy/13.61))/0.955

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_c_L_Copper_sli=per_sli*Copper_rc_c_L) %>% 
  mutate(rc_c_L_Copper_mod=per_mod*Copper_rc_c_L) %>% 
  mutate(rc_c_L_Copper_ext=per_ext*Copper_rc_c_L) %>% 
  mutate(rc_c_L_Copper_com=per_com*Copper_rc_c_L)-> df2

df2$ac/4.8851 -> pwy

x1_bc_a_H <- (log(pwy/1.04))/0.73
x2_bc_a_H <- (log(pwy/2.07))/0.76
x3_bc_a_H <- (log(pwy/5.18))/0.9
x4_bc_a_H <- (log(pwy/12.1))/0.95

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_c_P_Copper_sli=per_sli*Copper_rc_c_P) %>% 
  mutate(rc_c_P_Copper_mod=per_mod*Copper_rc_c_P) %>% 
  mutate(rc_c_P_Copper_ext=per_ext*Copper_rc_c_P) %>% 
  mutate(rc_c_P_Copper_com=per_com*Copper_rc_c_P)-> df2

df2 %>% 
  mutate(Copper_slight = bc_a_H_Copper_sli+
           bc_a_L_Copper_sli+
           bc_a_M_Copper_sli+
           bc_a_P_Copper_sli+
           bc_b_H_Copper_sli+
           bc_b_L_Copper_sli+
           bc_b_M_Copper_sli+
           bc_b_P_Copper_sli+
           bw_H_Copper_sli+
           bw_L_Copper_sli+
           bw_M_Copper_sli+
           bw_P_Copper_sli+
           rc_a_H_Copper_sli+
           rc_a_L_Copper_sli+
           rc_a_M_Copper_sli+
           rc_a_P_Copper_sli+
           rc_b_H_Copper_sli+
           rc_b_L_Copper_sli+
           rc_b_M_Copper_sli+
           rc_b_P_Copper_sli+
           rc_c_H_Copper_sli+
           rc_c_L_Copper_sli+
           rc_c_M_Copper_sli+
           rc_c_P_Copper_sli
  ) %>% 
  mutate(Copper_moderate = bc_a_H_Copper_mod+
           bc_a_L_Copper_mod+
           bc_a_M_Copper_mod+
           bc_a_P_Copper_mod+
           bc_b_H_Copper_mod+
           bc_b_L_Copper_mod+
           bc_b_M_Copper_mod+
           bc_b_P_Copper_mod+
           bw_H_Copper_mod+
           bw_L_Copper_mod+
           bw_M_Copper_mod+
           bw_P_Copper_mod+
           rc_a_H_Copper_mod+
           rc_a_L_Copper_mod+
           rc_a_M_Copper_mod+
           rc_a_P_Copper_mod+
           rc_b_H_Copper_mod+
           rc_b_L_Copper_mod+
           rc_b_M_Copper_mod+
           rc_b_P_Copper_mod+
           rc_c_H_Copper_mod+
           rc_c_L_Copper_mod+
           rc_c_M_Copper_mod+
           rc_c_P_Copper_mod) %>% 
  mutate(Copper_extensive = bc_a_H_Copper_ext+
           bc_a_L_Copper_ext+
           bc_a_M_Copper_ext+
           bc_a_P_Copper_ext+
           bc_b_H_Copper_ext+
           bc_b_L_Copper_ext+
           bc_b_M_Copper_ext+
           bc_b_P_Copper_ext+
           bw_H_Copper_ext+
           bw_L_Copper_ext+
           bw_M_Copper_ext+
           bw_P_Copper_ext+
           rc_a_H_Copper_ext+
           rc_a_L_Copper_ext+
           rc_a_M_Copper_ext+
           rc_a_P_Copper_ext+
           rc_b_H_Copper_ext+
           rc_b_L_Copper_ext+
           rc_b_M_Copper_ext+
           rc_b_P_Copper_ext+
           rc_c_H_Copper_ext+
           rc_c_L_Copper_ext+
           rc_c_M_Copper_ext+
           rc_c_P_Copper_ext
  ) %>% 
  mutate(Copper_complete = bc_a_H_Copper_com+
           bc_a_L_Copper_com+
           bc_a_M_Copper_com+
           bc_a_P_Copper_com+
           bc_b_H_Copper_com+
           bc_b_L_Copper_com+
           bc_b_M_Copper_com+
           bc_b_P_Copper_com+
           bw_H_Copper_com+
           bw_L_Copper_com+
           bw_M_Copper_com+
           bw_P_Copper_com+
           rc_a_H_Copper_com+
           rc_a_L_Copper_com+
           rc_a_M_Copper_com+
           rc_a_P_Copper_com+
           rc_b_H_Copper_com+
           rc_b_L_Copper_com+
           rc_b_M_Copper_com+
           rc_b_P_Copper_com+
           rc_c_H_Copper_com+
           rc_c_L_Copper_com+
           rc_c_M_Copper_com+
           rc_c_P_Copper_com
  )->df2

df2$ac/17.0495 -> pwy

x1_bc_a_H <- (log(pwy/0.45))/0.925
x2_bc_a_H <- (log(pwy/0.89))/0.98
x3_bc_a_H <- (log(pwy/2.235))/1.035
x4_bc_a_H <- (log(pwy/5.205))/1.03

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bc_a_H_Steel_sli=per_sli*Steel_bc_a_H) %>% 
  mutate(bc_a_H_Steel_mod=per_mod*Steel_bc_a_H) %>% 
  mutate(bc_a_H_Steel_ext=per_ext*Steel_bc_a_H) %>% 
  mutate(bc_a_H_Steel_com=per_com*Steel_bc_a_H) -> df2

df2$ac/17.0495 -> pwy

x1_bc_a_H <- (log(pwy/0.41))/1
x2_bc_a_H <- (log(pwy/0.81))/1.05
x3_bc_a_H <- (log(pwy/2.03))/1.09
x4_bc_a_H <- (log(pwy/4.73))/1.08

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bc_a_M_Steel_sli=per_sli*Steel_bc_a_M) %>% 
  mutate(bc_a_M_Steel_mod=per_mod*Steel_bc_a_M) %>% 
  mutate(bc_a_M_Steel_ext=per_ext*Steel_bc_a_M) %>% 
  mutate(bc_a_M_Steel_com=per_com*Steel_bc_a_M) -> df2

df2$ac/17.0495 -> pwy

x1_bc_a_H <- (log(pwy/0.37))/1.075
x2_bc_a_H <- (log(pwy/0.73))/1.12
x3_bc_a_H <- (log(pwy/1.825))/1.145
x4_bc_a_H <- (log(pwy/4.255))/1.13

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bc_a_L_Steel_sli=per_sli*Steel_bc_a_L) %>% 
  mutate(bc_a_L_Steel_mod=per_mod*Steel_bc_a_L) %>% 
  mutate(bc_a_L_Steel_ext=per_ext*Steel_bc_a_L) %>% 
  mutate(bc_a_L_Steel_com=per_com*Steel_bc_a_L)-> df2

df2$ac/17.0495 -> pwy

x1_bc_a_H <- (log(pwy/0.32))/1.15
x2_bc_a_H <- (log(pwy/0.65))/1.19
x3_bc_a_H <- (log(pwy/1.62))/1.2
x4_bc_a_H <- (log(pwy/3.78))/1.18

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bc_a_P_Steel_sli=per_sli*Steel_bc_a_P) %>% 
  mutate(bc_a_P_Steel_mod=per_mod*Steel_bc_a_P) %>% 
  mutate(bc_a_P_Steel_ext=per_ext*Steel_bc_a_P) %>% 
  mutate(bc_a_P_Steel_com=per_com*Steel_bc_a_P)-> df2

df2$ac/10.9666 -> pwy

x1_bc_a_H <- (log(pwy/0.7))/0.865
x2_bc_a_H <- (log(pwy/1.385))/0.895
x3_bc_a_H <- (log(pwy/3.465))/0.855
x4_bc_a_H <- (log(pwy/8.085))/0.925

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bc_b_H_Steel_sli=per_sli*Steel_bc_b_H) %>% 
  mutate(bc_b_H_Steel_mod=per_mod*Steel_bc_b_H) %>% 
  mutate(bc_b_H_Steel_ext=per_ext*Steel_bc_b_H) %>% 
  mutate(bc_b_H_Steel_com=per_com*Steel_bc_b_H)-> df2

df2$ac/10.9666 -> pwy

x1_bc_a_H <- (log(pwy/0.63))/0.91
x2_bc_a_H <- (log(pwy/1.26))/0.92
x3_bc_a_H <- (log(pwy/3.15))/0.87
x4_bc_a_H <- (log(pwy/7.35))/0.91

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bc_b_M_Steel_sli=per_sli*Steel_bc_b_M) %>% 
  mutate(bc_b_M_Steel_mod=per_mod*Steel_bc_b_M) %>% 
  mutate(bc_b_M_Steel_ext=per_ext*Steel_bc_b_M) %>% 
  mutate(bc_b_M_Steel_com=per_com*Steel_bc_b_M)-> df2

df2$ac/10.9666 -> pwy

x1_bc_a_H <- (log(pwy/0.56))/0.955
x2_bc_a_H <- (log(pwy/1.135))/0.945
x3_bc_a_H <- (log(pwy/2.835))/0.885
x4_bc_a_H <- (log(pwy/6.615))/0.895

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bc_b_L_Steel_sli=per_sli*Steel_bc_b_L) %>% 
  mutate(bc_b_L_Steel_mod=per_mod*Steel_bc_b_L) %>% 
  mutate(bc_b_L_Steel_ext=per_ext*Steel_bc_b_L) %>% 
  mutate(bc_b_L_Steel_com=per_com*Steel_bc_b_L)-> df2

df2$ac/10.9666 -> pwy

x1_bc_a_H <- (log(pwy/0.5))/1
x2_bc_a_H <- (log(pwy/1.01))/0.97
x3_bc_a_H <- (log(pwy/2.52))/0.9
x4_bc_a_H <- (log(pwy/5.88))/0.88

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bc_b_P_Steel_sli=per_sli*Steel_bc_b_P) %>% 
  mutate(bc_b_P_Steel_mod=per_mod*Steel_bc_b_P) %>% 
  mutate(bc_b_P_Steel_ext=per_ext*Steel_bc_b_P) %>% 
  mutate(bc_b_P_Steel_com=per_com*Steel_bc_b_P)-> df2

df2$ac/11.4593 -> pwy

x1_bc_a_H <- (log(pwy/0.55))/0.8
x2_bc_a_H <- (log(pwy/1.51))/0.81
x3_bc_a_H <- (log(pwy/5.04))/0.85
x4_bc_a_H <- (log(pwy/12.6))/0.97

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bw_H_Steel_sli=per_sli*Steel_bw_H) %>% 
  mutate(bw_H_Steel_mod=per_mod*Steel_bw_H) %>% 
  mutate(bw_H_Steel_ext=per_ext*Steel_bw_H) %>% 
  mutate(bw_H_Steel_com=per_com*Steel_bw_H)-> df2

df2$ac/11.4593 -> pwy

x1_bc_a_H <- (log(pwy/0.5))/0.84
x2_bc_a_H <- (log(pwy/1.25))/0.86
x3_bc_a_H <- (log(pwy/3.86))/0.89
x4_bc_a_H <- (log(pwy/9.45))/1.04

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bw_M_Steel_sli=per_sli*Steel_bw_M) %>% 
  mutate(bw_M_Steel_mod=per_mod*Steel_bw_M) %>% 
  mutate(bw_M_Steel_ext=per_ext*Steel_bw_M) %>% 
  mutate(bw_M_Steel_com=per_com*Steel_bw_M)-> df2

df2$ac/11.4593 -> pwy

x1_bc_a_H <- (log(pwy/0.45))/0.93
x2_bc_a_H <- (log(pwy/1.25))/0.97
x3_bc_a_H <- (log(pwy/3.86))/1.03
x4_bc_a_H <- (log(pwy/9.45))/0.99

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bw_L_Steel_sli=per_sli*Steel_bw_L) %>% 
  mutate(bw_L_Steel_mod=per_mod*Steel_bw_L) %>% 
  mutate(bw_L_Steel_ext=per_ext*Steel_bw_L) %>% 
  mutate(bw_L_Steel_com=per_com*Steel_bw_L)-> df2

df2$ac/11.4593 -> pwy

x1_bc_a_H <- (log(pwy/0.4))/1.01
x2_bc_a_H <- (log(pwy/1))/1.05
x3_bc_a_H <- (log(pwy/3.09))/1.07
x4_bc_a_H <- (log(pwy/7.56))/1.05

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bw_P_Steel_sli=per_sli*Steel_bw_P) %>% 
  mutate(bw_P_Steel_mod=per_mod*Steel_bw_P) %>% 
  mutate(bw_P_Steel_ext=per_ext*Steel_bw_P) %>% 
  mutate(bw_P_Steel_com=per_com*Steel_bw_P)-> df2

df2$ac/13.7941 -> pwy

x1_bc_a_H <- (log(pwy/0.6))/1.04
x2_bc_a_H <- (log(pwy/1.19))/1.03
x3_bc_a_H <- (log(pwy/2.97))/1.04
x4_bc_a_H <- (log(pwy/6.93))/0.905

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_a_H_Steel_sli=per_sli*Steel_rc_a_H) %>% 
  mutate(rc_a_H_Steel_mod=per_mod*Steel_rc_a_H) %>% 
  mutate(rc_a_H_Steel_ext=per_ext*Steel_rc_a_H) %>% 
  mutate(rc_a_H_Steel_com=per_com*Steel_rc_a_H)-> df2

df2$ac/13.7941 -> pwy

x1_bc_a_H <- (log(pwy/0.54))/1.09
x2_bc_a_H <- (log(pwy/1.08))/1.07
x3_bc_a_H <- (log(pwy/2.7))/1.08
x4_bc_a_H <- (log(pwy/6.3))/0.91

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_a_M_Steel_sli=per_sli*Steel_rc_a_M) %>% 
  mutate(rc_a_M_Steel_mod=per_mod*Steel_rc_a_M) %>% 
  mutate(rc_a_M_Steel_ext=per_ext*Steel_rc_a_M) %>% 
  mutate(rc_a_M_Steel_com=per_com*Steel_rc_a_M)-> df2

df2$ac/13.7941 -> pwy

x1_bc_a_H <- (log(pwy/0.58))/1.14
x2_bc_a_H <- (log(pwy/0.97))/1.11
x3_bc_a_H <- (log(pwy/2.43))/1.12
x4_bc_a_H <- (log(pwy/5.67))/0.915

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_a_L_Steel_sli=per_sli*Steel_rc_a_L) %>% 
  mutate(rc_a_L_Steel_mod=per_mod*Steel_rc_a_L) %>% 
  mutate(rc_a_L_Steel_ext=per_ext*Steel_rc_a_L) %>% 
  mutate(rc_a_L_Steel_com=per_com*Steel_rc_a_L)-> df2

df2$ac/13.7941 -> pwy

x1_bc_a_H <- (log(pwy/0.43))/1.19
x2_bc_a_H <- (log(pwy/0.86))/1.15
x3_bc_a_H <- (log(pwy/2.16))/1.16
x4_bc_a_H <- (log(pwy/5.04))/0.92

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_a_P_Steel_sli=per_sli*Steel_rc_a_P) %>% 
  mutate(rc_a_P_Steel_mod=per_mod*Steel_rc_a_P) %>% 
  mutate(rc_a_P_Steel_ext=per_ext*Steel_rc_a_P) %>% 
  mutate(rc_a_P_Steel_com=per_com*Steel_rc_a_P)-> df2

df2$ac/10.6048 -> pwy

x1_bc_a_H <- (log(pwy/0.98))/0.825
x2_bc_a_H <- (log(pwy/1.98))/0.815
x3_bc_a_H <- (log(pwy/4.5))/0.79
x4_bc_a_H <- (log(pwy/11.55))/0.98

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_b_H_Steel_sli=per_sli*Steel_rc_b_H) %>% 
  mutate(rc_b_H_Steel_mod=per_mod*Steel_rc_b_H) %>% 
  mutate(rc_b_H_Steel_ext=per_ext*Steel_rc_b_H) %>% 
  mutate(rc_b_H_Steel_com=per_com*Steel_rc_b_H)-> df2

df2$ac/10.6048 -> pwy

x1_bc_a_H <- (log(pwy/0.9))/0.85
x2_bc_a_H <- (log(pwy/1.8))/0.83
x3_bc_a_H <- (log(pwy/4.2))/0.79
x4_bc_a_H <- (log(pwy/10.5))/0.98

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_b_M_Steel_sli=per_sli*Steel_rc_b_M) %>% 
  mutate(rc_b_M_Steel_mod=per_mod*Steel_rc_b_M) %>% 
  mutate(rc_b_M_Steel_ext=per_ext*Steel_rc_b_M) %>% 
  mutate(rc_b_M_Steel_com=per_com*Steel_rc_b_M)-> df2

df2$ac/10.6048 -> pwy

x1_bc_a_H <- (log(pwy/0.81))/0.875
x2_bc_a_H <- (log(pwy/1.62))/0.845
x3_bc_a_H <- (log(pwy/3.9))/0.79
x4_bc_a_H <- (log(pwy/9.45))/0.98

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_b_L_Steel_sli=per_sli*Steel_rc_b_L) %>% 
  mutate(rc_b_L_Steel_mod=per_mod*Steel_rc_b_L) %>% 
  mutate(rc_b_L_Steel_ext=per_ext*Steel_rc_b_L) %>% 
  mutate(rc_b_L_Steel_com=per_com*Steel_rc_b_L)-> df2

df2$ac/10.6048 -> pwy

x1_bc_a_H <- (log(pwy/0.72))/0.9
x2_bc_a_H <- (log(pwy/1.44))/0.86
x3_bc_a_H <- (log(pwy/3.6))/0.9
x4_bc_a_H <- (log(pwy/8.4))/0.96

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_b_P_Steel_sli=per_sli*Steel_rc_b_P) %>% 
  mutate(rc_b_P_Steel_mod=per_mod*Steel_rc_b_P) %>% 
  mutate(rc_b_P_Steel_ext=per_ext*Steel_rc_b_P) %>% 
  mutate(rc_b_P_Steel_com=per_com*Steel_rc_b_P)-> df2

df2$ac/4.8851 -> pwy

x1_bc_a_H <- (log(pwy/1.43))/0.7
x2_bc_a_H <- (log(pwy/2.85))/0.73
x3_bc_a_H <- (log(pwy/7.13))/0.9
x4_bc_a_H <- (log(pwy/16.63))/0.965

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_c_H_Steel_sli=per_sli*Steel_rc_c_H) %>% 
  mutate(rc_c_H_Steel_mod=per_mod*Steel_rc_c_H) %>% 
  mutate(rc_c_H_Steel_ext=per_ext*Steel_rc_c_H) %>% 
  mutate(rc_c_H_Steel_com=per_com*Steel_rc_c_H)-> df2

df2$ac/4.8851 -> pwy

x1_bc_a_H <- (log(pwy/1.3))/0.71
x2_bc_a_H <- (log(pwy/2.59))/0.74
x3_bc_a_H <- (log(pwy/6.48))/0.9
x4_bc_a_H <- (log(pwy/15.12))/0.96

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_c_M_Steel_sli=per_sli*Steel_rc_c_M) %>% 
  mutate(rc_c_M_Steel_mod=per_mod*Steel_rc_c_M) %>% 
  mutate(rc_c_M_Steel_ext=per_ext*Steel_rc_c_M) %>% 
  mutate(rc_c_M_Steel_com=per_com*Steel_rc_c_M)-> df2

df2$ac/4.8851 -> pwy

x1_bc_a_H <- (log(pwy/1.17))/0.72
x2_bc_a_H <- (log(pwy/2.33))/0.75
x3_bc_a_H <- (log(pwy/5.83))/0.9
x4_bc_a_H <- (log(pwy/13.61))/0.955

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_c_L_Steel_sli=per_sli*Steel_rc_c_L) %>% 
  mutate(rc_c_L_Steel_mod=per_mod*Steel_rc_c_L) %>% 
  mutate(rc_c_L_Steel_ext=per_ext*Steel_rc_c_L) %>% 
  mutate(rc_c_L_Steel_com=per_com*Steel_rc_c_L)-> df2

df2$ac/4.8851 -> pwy

x1_bc_a_H <- (log(pwy/1.04))/0.73
x2_bc_a_H <- (log(pwy/2.07))/0.76
x3_bc_a_H <- (log(pwy/5.18))/0.9
x4_bc_a_H <- (log(pwy/12.1))/0.95

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_c_P_Steel_sli=per_sli*Steel_rc_c_P) %>% 
  mutate(rc_c_P_Steel_mod=per_mod*Steel_rc_c_P) %>% 
  mutate(rc_c_P_Steel_ext=per_ext*Steel_rc_c_P) %>% 
  mutate(rc_c_P_Steel_com=per_com*Steel_rc_c_P)-> df2

df2 %>% 
  mutate(Steel_slight = bc_a_H_Steel_sli+
           bc_a_L_Steel_sli+
           bc_a_M_Steel_sli+
           bc_a_P_Steel_sli+
           bc_b_H_Steel_sli+
           bc_b_L_Steel_sli+
           bc_b_M_Steel_sli+
           bc_b_P_Steel_sli+
           bw_H_Steel_sli+
           bw_L_Steel_sli+
           bw_M_Steel_sli+
           bw_P_Steel_sli+
           rc_a_H_Steel_sli+
           rc_a_L_Steel_sli+
           rc_a_M_Steel_sli+
           rc_a_P_Steel_sli+
           rc_b_H_Steel_sli+
           rc_b_L_Steel_sli+
           rc_b_M_Steel_sli+
           rc_b_P_Steel_sli+
           rc_c_H_Steel_sli+
           rc_c_L_Steel_sli+
           rc_c_M_Steel_sli+
           rc_c_P_Steel_sli
  ) %>% 
  mutate(Steel_moderate = bc_a_H_Steel_mod+
           bc_a_L_Steel_mod+
           bc_a_M_Steel_mod+
           bc_a_P_Steel_mod+
           bc_b_H_Steel_mod+
           bc_b_L_Steel_mod+
           bc_b_M_Steel_mod+
           bc_b_P_Steel_mod+
           bw_H_Steel_mod+
           bw_L_Steel_mod+
           bw_M_Steel_mod+
           bw_P_Steel_mod+
           rc_a_H_Steel_mod+
           rc_a_L_Steel_mod+
           rc_a_M_Steel_mod+
           rc_a_P_Steel_mod+
           rc_b_H_Steel_mod+
           rc_b_L_Steel_mod+
           rc_b_M_Steel_mod+
           rc_b_P_Steel_mod+
           rc_c_H_Steel_mod+
           rc_c_L_Steel_mod+
           rc_c_M_Steel_mod+
           rc_c_P_Steel_mod) %>% 
  mutate(Steel_extensive = bc_a_H_Steel_ext+
           bc_a_L_Steel_ext+
           bc_a_M_Steel_ext+
           bc_a_P_Steel_ext+
           bc_b_H_Steel_ext+
           bc_b_L_Steel_ext+
           bc_b_M_Steel_ext+
           bc_b_P_Steel_ext+
           bw_H_Steel_ext+
           bw_L_Steel_ext+
           bw_M_Steel_ext+
           bw_P_Steel_ext+
           rc_a_H_Steel_ext+
           rc_a_L_Steel_ext+
           rc_a_M_Steel_ext+
           rc_a_P_Steel_ext+
           rc_b_H_Steel_ext+
           rc_b_L_Steel_ext+
           rc_b_M_Steel_ext+
           rc_b_P_Steel_ext+
           rc_c_H_Steel_ext+
           rc_c_L_Steel_ext+
           rc_c_M_Steel_ext+
           rc_c_P_Steel_ext
  ) %>% 
  mutate(Steel_complete = bc_a_H_Steel_com+
           bc_a_L_Steel_com+
           bc_a_M_Steel_com+
           bc_a_P_Steel_com+
           bc_b_H_Steel_com+
           bc_b_L_Steel_com+
           bc_b_M_Steel_com+
           bc_b_P_Steel_com+
           bw_H_Steel_com+
           bw_L_Steel_com+
           bw_M_Steel_com+
           bw_P_Steel_com+
           rc_a_H_Steel_com+
           rc_a_L_Steel_com+
           rc_a_M_Steel_com+
           rc_a_P_Steel_com+
           rc_b_H_Steel_com+
           rc_b_L_Steel_com+
           rc_b_M_Steel_com+
           rc_b_P_Steel_com+
           rc_c_H_Steel_com+
           rc_c_L_Steel_com+
           rc_c_M_Steel_com+
           rc_c_P_Steel_com
  )->df2

df2$ac/17.0495 -> pwy

x1_bc_a_H <- (log(pwy/0.45))/0.925
x2_bc_a_H <- (log(pwy/0.89))/0.98
x3_bc_a_H <- (log(pwy/2.235))/1.035
x4_bc_a_H <- (log(pwy/5.205))/1.03

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bc_a_H_Cement_sli=per_sli*Cement_bc_a_H) %>% 
  mutate(bc_a_H_Cement_mod=per_mod*Cement_bc_a_H) %>% 
  mutate(bc_a_H_Cement_ext=per_ext*Cement_bc_a_H) %>% 
  mutate(bc_a_H_Cement_com=per_com*Cement_bc_a_H) -> df2

df2$ac/17.0495 -> pwy

x1_bc_a_H <- (log(pwy/0.41))/1
x2_bc_a_H <- (log(pwy/0.81))/1.05
x3_bc_a_H <- (log(pwy/2.03))/1.09
x4_bc_a_H <- (log(pwy/4.73))/1.08

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bc_a_M_Cement_sli=per_sli*Cement_bc_a_M) %>% 
  mutate(bc_a_M_Cement_mod=per_mod*Cement_bc_a_M) %>% 
  mutate(bc_a_M_Cement_ext=per_ext*Cement_bc_a_M) %>% 
  mutate(bc_a_M_Cement_com=per_com*Cement_bc_a_M) -> df2

df2$ac/17.0495 -> pwy

x1_bc_a_H <- (log(pwy/0.37))/1.075
x2_bc_a_H <- (log(pwy/0.73))/1.12
x3_bc_a_H <- (log(pwy/1.825))/1.145
x4_bc_a_H <- (log(pwy/4.255))/1.13

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bc_a_L_Cement_sli=per_sli*Cement_bc_a_L) %>% 
  mutate(bc_a_L_Cement_mod=per_mod*Cement_bc_a_L) %>% 
  mutate(bc_a_L_Cement_ext=per_ext*Cement_bc_a_L) %>% 
  mutate(bc_a_L_Cement_com=per_com*Cement_bc_a_L)-> df2

df2$ac/17.0495 -> pwy

x1_bc_a_H <- (log(pwy/0.32))/1.15
x2_bc_a_H <- (log(pwy/0.65))/1.19
x3_bc_a_H <- (log(pwy/1.62))/1.2
x4_bc_a_H <- (log(pwy/3.78))/1.18

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bc_a_P_Cement_sli=per_sli*Cement_bc_a_P) %>% 
  mutate(bc_a_P_Cement_mod=per_mod*Cement_bc_a_P) %>% 
  mutate(bc_a_P_Cement_ext=per_ext*Cement_bc_a_P) %>% 
  mutate(bc_a_P_Cement_com=per_com*Cement_bc_a_P)-> df2

df2$ac/10.9666 -> pwy

x1_bc_a_H <- (log(pwy/0.7))/0.865
x2_bc_a_H <- (log(pwy/1.385))/0.895
x3_bc_a_H <- (log(pwy/3.465))/0.855
x4_bc_a_H <- (log(pwy/8.085))/0.925

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bc_b_H_Cement_sli=per_sli*Cement_bc_b_H) %>% 
  mutate(bc_b_H_Cement_mod=per_mod*Cement_bc_b_H) %>% 
  mutate(bc_b_H_Cement_ext=per_ext*Cement_bc_b_H) %>% 
  mutate(bc_b_H_Cement_com=per_com*Cement_bc_b_H)-> df2

df2$ac/10.9666 -> pwy

x1_bc_a_H <- (log(pwy/0.63))/0.91
x2_bc_a_H <- (log(pwy/1.26))/0.92
x3_bc_a_H <- (log(pwy/3.15))/0.87
x4_bc_a_H <- (log(pwy/7.35))/0.91

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bc_b_M_Cement_sli=per_sli*Cement_bc_b_M) %>% 
  mutate(bc_b_M_Cement_mod=per_mod*Cement_bc_b_M) %>% 
  mutate(bc_b_M_Cement_ext=per_ext*Cement_bc_b_M) %>% 
  mutate(bc_b_M_Cement_com=per_com*Cement_bc_b_M)-> df2

df2$ac/10.9666 -> pwy

x1_bc_a_H <- (log(pwy/0.56))/0.955
x2_bc_a_H <- (log(pwy/1.135))/0.945
x3_bc_a_H <- (log(pwy/2.835))/0.885
x4_bc_a_H <- (log(pwy/6.615))/0.895

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bc_b_L_Cement_sli=per_sli*Cement_bc_b_L) %>% 
  mutate(bc_b_L_Cement_mod=per_mod*Cement_bc_b_L) %>% 
  mutate(bc_b_L_Cement_ext=per_ext*Cement_bc_b_L) %>% 
  mutate(bc_b_L_Cement_com=per_com*Cement_bc_b_L)-> df2

df2$ac/10.9666 -> pwy

x1_bc_a_H <- (log(pwy/0.5))/1
x2_bc_a_H <- (log(pwy/1.01))/0.97
x3_bc_a_H <- (log(pwy/2.52))/0.9
x4_bc_a_H <- (log(pwy/5.88))/0.88

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bc_b_P_Cement_sli=per_sli*Cement_bc_b_P) %>% 
  mutate(bc_b_P_Cement_mod=per_mod*Cement_bc_b_P) %>% 
  mutate(bc_b_P_Cement_ext=per_ext*Cement_bc_b_P) %>% 
  mutate(bc_b_P_Cement_com=per_com*Cement_bc_b_P)-> df2

df2$ac/11.4593 -> pwy

x1_bc_a_H <- (log(pwy/0.55))/0.8
x2_bc_a_H <- (log(pwy/1.51))/0.81
x3_bc_a_H <- (log(pwy/5.04))/0.85
x4_bc_a_H <- (log(pwy/12.6))/0.97

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bw_H_Cement_sli=per_sli*Cement_bw_H) %>% 
  mutate(bw_H_Cement_mod=per_mod*Cement_bw_H) %>% 
  mutate(bw_H_Cement_ext=per_ext*Cement_bw_H) %>% 
  mutate(bw_H_Cement_com=per_com*Cement_bw_H)-> df2

df2$ac/11.4593 -> pwy

x1_bc_a_H <- (log(pwy/0.5))/0.84
x2_bc_a_H <- (log(pwy/1.25))/0.86
x3_bc_a_H <- (log(pwy/3.86))/0.89
x4_bc_a_H <- (log(pwy/9.45))/1.04

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bw_M_Cement_sli=per_sli*Cement_bw_M) %>% 
  mutate(bw_M_Cement_mod=per_mod*Cement_bw_M) %>% 
  mutate(bw_M_Cement_ext=per_ext*Cement_bw_M) %>% 
  mutate(bw_M_Cement_com=per_com*Cement_bw_M)-> df2

df2$ac/11.4593 -> pwy

x1_bc_a_H <- (log(pwy/0.45))/0.93
x2_bc_a_H <- (log(pwy/1.25))/0.97
x3_bc_a_H <- (log(pwy/3.86))/1.03
x4_bc_a_H <- (log(pwy/9.45))/0.99

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bw_L_Cement_sli=per_sli*Cement_bw_L) %>% 
  mutate(bw_L_Cement_mod=per_mod*Cement_bw_L) %>% 
  mutate(bw_L_Cement_ext=per_ext*Cement_bw_L) %>% 
  mutate(bw_L_Cement_com=per_com*Cement_bw_L)-> df2

df2$ac/11.4593 -> pwy

x1_bc_a_H <- (log(pwy/0.4))/1.01
x2_bc_a_H <- (log(pwy/1))/1.05
x3_bc_a_H <- (log(pwy/3.09))/1.07
x4_bc_a_H <- (log(pwy/7.56))/1.05

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bw_P_Cement_sli=per_sli*Cement_bw_P) %>% 
  mutate(bw_P_Cement_mod=per_mod*Cement_bw_P) %>% 
  mutate(bw_P_Cement_ext=per_ext*Cement_bw_P) %>% 
  mutate(bw_P_Cement_com=per_com*Cement_bw_P)-> df2

df2$ac/13.7941 -> pwy

x1_bc_a_H <- (log(pwy/0.6))/1.04
x2_bc_a_H <- (log(pwy/1.19))/1.03
x3_bc_a_H <- (log(pwy/2.97))/1.04
x4_bc_a_H <- (log(pwy/6.93))/0.905

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_a_H_Cement_sli=per_sli*Cement_rc_a_H) %>% 
  mutate(rc_a_H_Cement_mod=per_mod*Cement_rc_a_H) %>% 
  mutate(rc_a_H_Cement_ext=per_ext*Cement_rc_a_H) %>% 
  mutate(rc_a_H_Cement_com=per_com*Cement_rc_a_H)-> df2

df2$ac/13.7941 -> pwy

x1_bc_a_H <- (log(pwy/0.54))/1.09
x2_bc_a_H <- (log(pwy/1.08))/1.07
x3_bc_a_H <- (log(pwy/2.7))/1.08
x4_bc_a_H <- (log(pwy/6.3))/0.91

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_a_M_Cement_sli=per_sli*Cement_rc_a_M) %>% 
  mutate(rc_a_M_Cement_mod=per_mod*Cement_rc_a_M) %>% 
  mutate(rc_a_M_Cement_ext=per_ext*Cement_rc_a_M) %>% 
  mutate(rc_a_M_Cement_com=per_com*Cement_rc_a_M)-> df2

df2$ac/13.7941 -> pwy

x1_bc_a_H <- (log(pwy/0.58))/1.14
x2_bc_a_H <- (log(pwy/0.97))/1.11
x3_bc_a_H <- (log(pwy/2.43))/1.12
x4_bc_a_H <- (log(pwy/5.67))/0.915

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_a_L_Cement_sli=per_sli*Cement_rc_a_L) %>% 
  mutate(rc_a_L_Cement_mod=per_mod*Cement_rc_a_L) %>% 
  mutate(rc_a_L_Cement_ext=per_ext*Cement_rc_a_L) %>% 
  mutate(rc_a_L_Cement_com=per_com*Cement_rc_a_L)-> df2

df2$ac/13.7941 -> pwy

x1_bc_a_H <- (log(pwy/0.43))/1.19
x2_bc_a_H <- (log(pwy/0.86))/1.15
x3_bc_a_H <- (log(pwy/2.16))/1.16
x4_bc_a_H <- (log(pwy/5.04))/0.92

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_a_P_Cement_sli=per_sli*Cement_rc_a_P) %>% 
  mutate(rc_a_P_Cement_mod=per_mod*Cement_rc_a_P) %>% 
  mutate(rc_a_P_Cement_ext=per_ext*Cement_rc_a_P) %>% 
  mutate(rc_a_P_Cement_com=per_com*Cement_rc_a_P)-> df2

df2$ac/10.6048 -> pwy

x1_bc_a_H <- (log(pwy/0.98))/0.825
x2_bc_a_H <- (log(pwy/1.98))/0.815
x3_bc_a_H <- (log(pwy/4.5))/0.79
x4_bc_a_H <- (log(pwy/11.55))/0.98

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_b_H_Cement_sli=per_sli*Cement_rc_b_H) %>% 
  mutate(rc_b_H_Cement_mod=per_mod*Cement_rc_b_H) %>% 
  mutate(rc_b_H_Cement_ext=per_ext*Cement_rc_b_H) %>% 
  mutate(rc_b_H_Cement_com=per_com*Cement_rc_b_H)-> df2

df2$ac/10.6048 -> pwy

x1_bc_a_H <- (log(pwy/0.9))/0.85
x2_bc_a_H <- (log(pwy/1.8))/0.83
x3_bc_a_H <- (log(pwy/4.5))/0.79
x4_bc_a_H <- (log(pwy/10.5))/0.98

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_b_M_Cement_sli=per_sli*Cement_rc_b_M) %>% 
  mutate(rc_b_M_Cement_mod=per_mod*Cement_rc_b_M) %>% 
  mutate(rc_b_M_Cement_ext=per_ext*Cement_rc_b_M) %>% 
  mutate(rc_b_M_Cement_com=per_com*Cement_rc_b_M)-> df2

df2$ac/10.6048 -> pwy

x1_bc_a_H <- (log(pwy/0.81))/0.875
x2_bc_a_H <- (log(pwy/1.62))/0.845
x3_bc_a_H <- (log(pwy/3.9))/0.79
x4_bc_a_H <- (log(pwy/9.45))/0.98

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_b_L_Cement_sli=per_sli*Cement_rc_b_L) %>% 
  mutate(rc_b_L_Cement_mod=per_mod*Cement_rc_b_L) %>% 
  mutate(rc_b_L_Cement_ext=per_ext*Cement_rc_b_L) %>% 
  mutate(rc_b_L_Cement_com=per_com*Cement_rc_b_L)-> df2

df2$ac/10.6048 -> pwy

x1_bc_a_H <- (log(pwy/0.72))/0.9
x2_bc_a_H <- (log(pwy/1.44))/0.86
x3_bc_a_H <- (log(pwy/3.6))/0.9
x4_bc_a_H <- (log(pwy/8.4))/0.96

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_b_P_Cement_sli=per_sli*Cement_rc_b_P) %>% 
  mutate(rc_b_P_Cement_mod=per_mod*Cement_rc_b_P) %>% 
  mutate(rc_b_P_Cement_ext=per_ext*Cement_rc_b_P) %>% 
  mutate(rc_b_P_Cement_com=per_com*Cement_rc_b_P)-> df2

df2$ac/4.8851 -> pwy

x1_bc_a_H <- (log(pwy/1.43))/0.7
x2_bc_a_H <- (log(pwy/2.85))/0.73
x3_bc_a_H <- (log(pwy/7.13))/0.9
x4_bc_a_H <- (log(pwy/16.63))/0.965

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_c_H_Cement_sli=per_sli*Cement_rc_c_H) %>% 
  mutate(rc_c_H_Cement_mod=per_mod*Cement_rc_c_H) %>% 
  mutate(rc_c_H_Cement_ext=per_ext*Cement_rc_c_H) %>% 
  mutate(rc_c_H_Cement_com=per_com*Cement_rc_c_H)-> df2

df2$ac/4.8851 -> pwy

x1_bc_a_H <- (log(pwy/1.3))/0.71
x2_bc_a_H <- (log(pwy/2.59))/0.74
x3_bc_a_H <- (log(pwy/6.48))/0.9
x4_bc_a_H <- (log(pwy/15.12))/0.96

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_c_M_Cement_sli=per_sli*Cement_rc_c_M) %>% 
  mutate(rc_c_M_Cement_mod=per_mod*Cement_rc_c_M) %>% 
  mutate(rc_c_M_Cement_ext=per_ext*Cement_rc_c_M) %>% 
  mutate(rc_c_M_Cement_com=per_com*Cement_rc_c_M)-> df2

df2$ac/4.8851 -> pwy

x1_bc_a_H <- (log(pwy/1.17))/0.72
x2_bc_a_H <- (log(pwy/2.33))/0.75
x3_bc_a_H <- (log(pwy/5.83))/0.9
x4_bc_a_H <- (log(pwy/13.61))/0.955

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_c_L_Cement_sli=per_sli*Cement_rc_c_L) %>% 
  mutate(rc_c_L_Cement_mod=per_mod*Cement_rc_c_L) %>% 
  mutate(rc_c_L_Cement_ext=per_ext*Cement_rc_c_L) %>% 
  mutate(rc_c_L_Cement_com=per_com*Cement_rc_c_L)-> df2

df2$ac/4.8851 -> pwy

x1_bc_a_H <- (log(pwy/1.04))/0.73
x2_bc_a_H <- (log(pwy/2.07))/0.76
x3_bc_a_H <- (log(pwy/5.18))/0.9
x4_bc_a_H <- (log(pwy/12.1))/0.95

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_c_P_Cement_sli=per_sli*Cement_rc_c_P) %>% 
  mutate(rc_c_P_Cement_mod=per_mod*Cement_rc_c_P) %>% 
  mutate(rc_c_P_Cement_ext=per_ext*Cement_rc_c_P) %>% 
  mutate(rc_c_P_Cement_com=per_com*Cement_rc_c_P)-> df2

df2 %>% 
  mutate(Cement_slight = bc_a_H_Cement_sli+
           bc_a_L_Cement_sli+
           bc_a_M_Cement_sli+
           bc_a_P_Cement_sli+
           bc_b_H_Cement_sli+
           bc_b_L_Cement_sli+
           bc_b_M_Cement_sli+
           bc_b_P_Cement_sli+
           bw_H_Cement_sli+
           bw_L_Cement_sli+
           bw_M_Cement_sli+
           bw_P_Cement_sli+
           rc_a_H_Cement_sli+
           rc_a_L_Cement_sli+
           rc_a_M_Cement_sli+
           rc_a_P_Cement_sli+
           rc_b_H_Cement_sli+
           rc_b_L_Cement_sli+
           rc_b_M_Cement_sli+
           rc_b_P_Cement_sli+
           rc_c_H_Cement_sli+
           rc_c_L_Cement_sli+
           rc_c_M_Cement_sli+
           rc_c_P_Cement_sli
  ) %>% 
  mutate(Cement_moderate = bc_a_H_Cement_mod+
           bc_a_L_Cement_mod+
           bc_a_M_Cement_mod+
           bc_a_P_Cement_mod+
           bc_b_H_Cement_mod+
           bc_b_L_Cement_mod+
           bc_b_M_Cement_mod+
           bc_b_P_Cement_mod+
           bw_H_Cement_mod+
           bw_L_Cement_mod+
           bw_M_Cement_mod+
           bw_P_Cement_mod+
           rc_a_H_Cement_mod+
           rc_a_L_Cement_mod+
           rc_a_M_Cement_mod+
           rc_a_P_Cement_mod+
           rc_b_H_Cement_mod+
           rc_b_L_Cement_mod+
           rc_b_M_Cement_mod+
           rc_b_P_Cement_mod+
           rc_c_H_Cement_mod+
           rc_c_L_Cement_mod+
           rc_c_M_Cement_mod+
           rc_c_P_Cement_mod) %>% 
  mutate(Cement_extensive = bc_a_H_Cement_ext+
           bc_a_L_Cement_ext+
           bc_a_M_Cement_ext+
           bc_a_P_Cement_ext+
           bc_b_H_Cement_ext+
           bc_b_L_Cement_ext+
           bc_b_M_Cement_ext+
           bc_b_P_Cement_ext+
           bw_H_Cement_ext+
           bw_L_Cement_ext+
           bw_M_Cement_ext+
           bw_P_Cement_ext+
           rc_a_H_Cement_ext+
           rc_a_L_Cement_ext+
           rc_a_M_Cement_ext+
           rc_a_P_Cement_ext+
           rc_b_H_Cement_ext+
           rc_b_L_Cement_ext+
           rc_b_M_Cement_ext+
           rc_b_P_Cement_ext+
           rc_c_H_Cement_ext+
           rc_c_L_Cement_ext+
           rc_c_M_Cement_ext+
           rc_c_P_Cement_ext
  ) %>% 
  mutate(Cement_complete = bc_a_H_Cement_com+
           bc_a_L_Cement_com+
           bc_a_M_Cement_com+
           bc_a_P_Cement_com+
           bc_b_H_Cement_com+
           bc_b_L_Cement_com+
           bc_b_M_Cement_com+
           bc_b_P_Cement_com+
           bw_H_Cement_com+
           bw_L_Cement_com+
           bw_M_Cement_com+
           bw_P_Cement_com+
           rc_a_H_Cement_com+
           rc_a_L_Cement_com+
           rc_a_M_Cement_com+
           rc_a_P_Cement_com+
           rc_b_H_Cement_com+
           rc_b_L_Cement_com+
           rc_b_M_Cement_com+
           rc_b_P_Cement_com+
           rc_c_H_Cement_com+
           rc_c_L_Cement_com+
           rc_c_M_Cement_com+
           rc_c_P_Cement_com
  )->df2

df2$ac/17.0495 -> pwy

x1_bc_a_H <- (log(pwy/0.45))/0.925
x2_bc_a_H <- (log(pwy/0.89))/0.98
x3_bc_a_H <- (log(pwy/2.235))/1.035
x4_bc_a_H <- (log(pwy/5.205))/1.03

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bc_a_H_pop_sli=per_sli*pop_bc_a_H) %>% 
  mutate(bc_a_H_pop_mod=per_mod*pop_bc_a_H) %>% 
  mutate(bc_a_H_pop_ext=per_ext*pop_bc_a_H) %>% 
  mutate(bc_a_H_pop_com=per_com*pop_bc_a_H) -> df2

df2$ac/17.0495 -> pwy

x1_bc_a_H <- (log(pwy/0.41))/1
x2_bc_a_H <- (log(pwy/0.81))/1.05
x3_bc_a_H <- (log(pwy/2.03))/1.09
x4_bc_a_H <- (log(pwy/4.73))/1.08

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bc_a_M_pop_sli=per_sli*pop_bc_a_M) %>% 
  mutate(bc_a_M_pop_mod=per_mod*pop_bc_a_M) %>% 
  mutate(bc_a_M_pop_ext=per_ext*pop_bc_a_M) %>% 
  mutate(bc_a_M_pop_com=per_com*pop_bc_a_M) -> df2

df2$ac/17.0495 -> pwy

x1_bc_a_H <- (log(pwy/0.37))/1.075
x2_bc_a_H <- (log(pwy/0.73))/1.12
x3_bc_a_H <- (log(pwy/1.825))/1.145
x4_bc_a_H <- (log(pwy/4.255))/1.13

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bc_a_L_pop_sli=per_sli*pop_bc_a_L) %>% 
  mutate(bc_a_L_pop_mod=per_mod*pop_bc_a_L) %>% 
  mutate(bc_a_L_pop_ext=per_ext*pop_bc_a_L) %>% 
  mutate(bc_a_L_pop_com=per_com*pop_bc_a_L)-> df2

df2$ac/17.0495 -> pwy

x1_bc_a_H <- (log(pwy/0.32))/1.15
x2_bc_a_H <- (log(pwy/0.65))/1.19
x3_bc_a_H <- (log(pwy/1.62))/1.2
x4_bc_a_H <- (log(pwy/3.78))/1.18

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bc_a_P_pop_sli=per_sli*pop_bc_a_P) %>% 
  mutate(bc_a_P_pop_mod=per_mod*pop_bc_a_P) %>% 
  mutate(bc_a_P_pop_ext=per_ext*pop_bc_a_P) %>% 
  mutate(bc_a_P_pop_com=per_com*pop_bc_a_P)-> df2

df2$ac/10.9666 -> pwy

x1_bc_a_H <- (log(pwy/0.7))/0.865
x2_bc_a_H <- (log(pwy/1.385))/0.895
x3_bc_a_H <- (log(pwy/3.465))/0.855
x4_bc_a_H <- (log(pwy/8.085))/0.925

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bc_b_H_pop_sli=per_sli*pop_bc_b_H) %>% 
  mutate(bc_b_H_pop_mod=per_mod*pop_bc_b_H) %>% 
  mutate(bc_b_H_pop_ext=per_ext*pop_bc_b_H) %>% 
  mutate(bc_b_H_pop_com=per_com*pop_bc_b_H)-> df2

df2$ac/10.9666 -> pwy

x1_bc_a_H <- (log(pwy/0.63))/0.91
x2_bc_a_H <- (log(pwy/1.26))/0.92
x3_bc_a_H <- (log(pwy/3.15))/0.87
x4_bc_a_H <- (log(pwy/7.35))/0.91

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bc_b_M_pop_sli=per_sli*pop_bc_b_M) %>% 
  mutate(bc_b_M_pop_mod=per_mod*pop_bc_b_M) %>% 
  mutate(bc_b_M_pop_ext=per_ext*pop_bc_b_M) %>% 
  mutate(bc_b_M_pop_com=per_com*pop_bc_b_M)-> df2

df2$ac/10.9666 -> pwy

x1_bc_a_H <- (log(pwy/0.56))/0.955
x2_bc_a_H <- (log(pwy/1.135))/0.945
x3_bc_a_H <- (log(pwy/2.835))/0.885
x4_bc_a_H <- (log(pwy/6.615))/0.895

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bc_b_L_pop_sli=per_sli*pop_bc_b_L) %>% 
  mutate(bc_b_L_pop_mod=per_mod*pop_bc_b_L) %>% 
  mutate(bc_b_L_pop_ext=per_ext*pop_bc_b_L) %>% 
  mutate(bc_b_L_pop_com=per_com*pop_bc_b_L)-> df2

df2$ac/10.9666 -> pwy

x1_bc_a_H <- (log(pwy/0.5))/1
x2_bc_a_H <- (log(pwy/1.01))/0.97
x3_bc_a_H <- (log(pwy/2.52))/0.9
x4_bc_a_H <- (log(pwy/5.88))/0.88

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bc_b_P_pop_sli=per_sli*pop_bc_b_P) %>% 
  mutate(bc_b_P_pop_mod=per_mod*pop_bc_b_P) %>% 
  mutate(bc_b_P_pop_ext=per_ext*pop_bc_b_P) %>% 
  mutate(bc_b_P_pop_com=per_com*pop_bc_b_P)-> df2

df2$ac/11.4593 -> pwy

x1_bc_a_H <- (log(pwy/0.55))/0.8
x2_bc_a_H <- (log(pwy/1.51))/0.81
x3_bc_a_H <- (log(pwy/5.04))/0.85
x4_bc_a_H <- (log(pwy/12.6))/0.97

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bw_H_pop_sli=per_sli*pop_bw_H) %>% 
  mutate(bw_H_pop_mod=per_mod*pop_bw_H) %>% 
  mutate(bw_H_pop_ext=per_ext*pop_bw_H) %>% 
  mutate(bw_H_pop_com=per_com*pop_bw_H)-> df2

df2$ac/11.4593 -> pwy

x1_bc_a_H <- (log(pwy/0.5))/0.84
x2_bc_a_H <- (log(pwy/1.25))/0.86
x3_bc_a_H <- (log(pwy/3.86))/0.89
x4_bc_a_H <- (log(pwy/9.45))/1.04

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bw_M_pop_sli=per_sli*pop_bw_M) %>% 
  mutate(bw_M_pop_mod=per_mod*pop_bw_M) %>% 
  mutate(bw_M_pop_ext=per_ext*pop_bw_M) %>% 
  mutate(bw_M_pop_com=per_com*pop_bw_M)-> df2

df2$ac/11.4593 -> pwy

x1_bc_a_H <- (log(pwy/0.45))/0.93
x2_bc_a_H <- (log(pwy/1.25))/0.97
x3_bc_a_H <- (log(pwy/3.86))/1.03
x4_bc_a_H <- (log(pwy/9.45))/0.99

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bw_L_pop_sli=per_sli*pop_bw_L) %>% 
  mutate(bw_L_pop_mod=per_mod*pop_bw_L) %>% 
  mutate(bw_L_pop_ext=per_ext*pop_bw_L) %>% 
  mutate(bw_L_pop_com=per_com*pop_bw_L)-> df2

df2$ac/11.4593 -> pwy

x1_bc_a_H <- (log(pwy/0.4))/1.01
x2_bc_a_H <- (log(pwy/1))/1.05
x3_bc_a_H <- (log(pwy/3.09))/1.07
x4_bc_a_H <- (log(pwy/7.56))/1.05

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(bw_P_pop_sli=per_sli*pop_bw_P) %>% 
  mutate(bw_P_pop_mod=per_mod*pop_bw_P) %>% 
  mutate(bw_P_pop_ext=per_ext*pop_bw_P) %>% 
  mutate(bw_P_pop_com=per_com*pop_bw_P)-> df2

df2$ac/13.7941 -> pwy

x1_bc_a_H <- (log(pwy/0.6))/1.04
x2_bc_a_H <- (log(pwy/1.19))/1.03
x3_bc_a_H <- (log(pwy/2.97))/1.04
x4_bc_a_H <- (log(pwy/6.93))/0.905

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_a_H_pop_sli=per_sli*pop_rc_a_H) %>% 
  mutate(rc_a_H_pop_mod=per_mod*pop_rc_a_H) %>% 
  mutate(rc_a_H_pop_ext=per_ext*pop_rc_a_H) %>% 
  mutate(rc_a_H_pop_com=per_com*pop_rc_a_H)-> df2

df2$ac/13.7941 -> pwy

x1_bc_a_H <- (log(pwy/0.54))/1.09
x2_bc_a_H <- (log(pwy/1.08))/1.07
x3_bc_a_H <- (log(pwy/2.7))/1.08
x4_bc_a_H <- (log(pwy/6.3))/0.91

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_a_M_pop_sli=per_sli*pop_rc_a_M) %>% 
  mutate(rc_a_M_pop_mod=per_mod*pop_rc_a_M) %>% 
  mutate(rc_a_M_pop_ext=per_ext*pop_rc_a_M) %>% 
  mutate(rc_a_M_pop_com=per_com*pop_rc_a_M)-> df2

df2$ac/13.7941 -> pwy

x1_bc_a_H <- (log(pwy/0.58))/1.14
x2_bc_a_H <- (log(pwy/0.97))/1.11
x3_bc_a_H <- (log(pwy/2.43))/1.12
x4_bc_a_H <- (log(pwy/5.67))/0.915

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_a_L_pop_sli=per_sli*pop_rc_a_L) %>% 
  mutate(rc_a_L_pop_mod=per_mod*pop_rc_a_L) %>% 
  mutate(rc_a_L_pop_ext=per_ext*pop_rc_a_L) %>% 
  mutate(rc_a_L_pop_com=per_com*pop_rc_a_L)-> df2

df2$ac/13.7941 -> pwy

x1_bc_a_H <- (log(pwy/0.43))/1.19
x2_bc_a_H <- (log(pwy/0.86))/1.15
x3_bc_a_H <- (log(pwy/2.16))/1.16
x4_bc_a_H <- (log(pwy/5.04))/0.92

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_a_P_pop_sli=per_sli*pop_rc_a_P) %>% 
  mutate(rc_a_P_pop_mod=per_mod*pop_rc_a_P) %>% 
  mutate(rc_a_P_pop_ext=per_ext*pop_rc_a_P) %>% 
  mutate(rc_a_P_pop_com=per_com*pop_rc_a_P)-> df2

df2$ac/10.6048 -> pwy

x1_bc_a_H <- (log(pwy/0.98))/0.825
x2_bc_a_H <- (log(pwy/1.98))/0.815
x3_bc_a_H <- (log(pwy/4.5))/0.79
x4_bc_a_H <- (log(pwy/11.55))/0.98

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_b_H_pop_sli=per_sli*pop_rc_b_H) %>% 
  mutate(rc_b_H_pop_mod=per_mod*pop_rc_b_H) %>% 
  mutate(rc_b_H_pop_ext=per_ext*pop_rc_b_H) %>% 
  mutate(rc_b_H_pop_com=per_com*pop_rc_b_H)-> df2

df2$ac/10.6048 -> pwy

x1_bc_a_H <- (log(pwy/0.9))/0.85
x2_bc_a_H <- (log(pwy/1.8))/0.83
x3_bc_a_H <- (log(pwy/4.2))/0.79
x4_bc_a_H <- (log(pwy/10.5))/0.98

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_b_M_pop_sli=per_sli*pop_rc_b_M) %>% 
  mutate(rc_b_M_pop_mod=per_mod*pop_rc_b_M) %>% 
  mutate(rc_b_M_pop_ext=per_ext*pop_rc_b_M) %>% 
  mutate(rc_b_M_pop_com=per_com*pop_rc_b_M)-> df2

df2$ac/10.6048 -> pwy

x1_bc_a_H <- (log(pwy/0.81))/0.875
x2_bc_a_H <- (log(pwy/1.62))/0.845
x3_bc_a_H <- (log(pwy/3.9))/0.79
x4_bc_a_H <- (log(pwy/9.45))/0.98

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_b_L_pop_sli=per_sli*pop_rc_b_L) %>% 
  mutate(rc_b_L_pop_mod=per_mod*pop_rc_b_L) %>% 
  mutate(rc_b_L_pop_ext=per_ext*pop_rc_b_L) %>% 
  mutate(rc_b_L_pop_com=per_com*pop_rc_b_L)-> df2

df2$ac/10.6048 -> pwy

x1_bc_a_H <- (log(pwy/0.72))/0.9
x2_bc_a_H <- (log(pwy/1.44))/0.86
x3_bc_a_H <- (log(pwy/3.6))/0.9
x4_bc_a_H <- (log(pwy/8.4))/0.96

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_b_P_pop_sli=per_sli*pop_rc_b_P) %>% 
  mutate(rc_b_P_pop_mod=per_mod*pop_rc_b_P) %>% 
  mutate(rc_b_P_pop_ext=per_ext*pop_rc_b_P) %>% 
  mutate(rc_b_P_pop_com=per_com*pop_rc_b_P)-> df2

df2$ac/4.8851 -> pwy

x1_bc_a_H <- (log(pwy/1.43))/0.7
x2_bc_a_H <- (log(pwy/2.85))/0.73
x3_bc_a_H <- (log(pwy/7.13))/0.9
x4_bc_a_H <- (log(pwy/16.63))/0.965

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_c_H_pop_sli=per_sli*pop_rc_c_H) %>% 
  mutate(rc_c_H_pop_mod=per_mod*pop_rc_c_H) %>% 
  mutate(rc_c_H_pop_ext=per_ext*pop_rc_c_H) %>% 
  mutate(rc_c_H_pop_com=per_com*pop_rc_c_H)-> df2

df2$ac/4.8851 -> pwy

x1_bc_a_H <- (log(pwy/1.3))/0.71
x2_bc_a_H <- (log(pwy/2.59))/0.74
x3_bc_a_H <- (log(pwy/6.48))/0.9
x4_bc_a_H <- (log(pwy/15.12))/0.96

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_c_M_pop_sli=per_sli*pop_rc_c_M) %>% 
  mutate(rc_c_M_pop_mod=per_mod*pop_rc_c_M) %>% 
  mutate(rc_c_M_pop_ext=per_ext*pop_rc_c_M) %>% 
  mutate(rc_c_M_pop_com=per_com*pop_rc_c_M)-> df2

df2$ac/4.8851 -> pwy

x1_bc_a_H <- (log(pwy/1.17))/0.72
x2_bc_a_H <- (log(pwy/2.33))/0.75
x3_bc_a_H <- (log(pwy/5.83))/0.9
x4_bc_a_H <- (log(pwy/13.61))/0.955

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_c_L_pop_sli=per_sli*pop_rc_c_L) %>% 
  mutate(rc_c_L_pop_mod=per_mod*pop_rc_c_L) %>% 
  mutate(rc_c_L_pop_ext=per_ext*pop_rc_c_L) %>% 
  mutate(rc_c_L_pop_com=per_com*pop_rc_c_L)-> df2

df2$ac/4.8851 -> pwy

x1_bc_a_H <- (log(pwy/1.04))/0.73
x2_bc_a_H <- (log(pwy/2.07))/0.76
x3_bc_a_H <- (log(pwy/5.18))/0.9
x4_bc_a_H <- (log(pwy/12.1))/0.95

y1_bc_a_H <- pnorm(x1_bc_a_H, mean=0,sd=1)
y2_bc_a_H <- pnorm(x2_bc_a_H, mean=0,sd=1)
y3_bc_a_H <- pnorm(x3_bc_a_H, mean=0,sd=1)
y4_bc_a_H <- pnorm(x4_bc_a_H, mean=0,sd=1)

df2 %>% 
  mutate(per_sli=y1_bc_a_H-y2_bc_a_H, per_mod=y2_bc_a_H-y3_bc_a_H, per_ext=y3_bc_a_H-y4_bc_a_H, per_com=y4_bc_a_H) %>% 
  mutate(rc_c_P_pop_sli=per_sli*pop_rc_c_P) %>% 
  mutate(rc_c_P_pop_mod=per_mod*pop_rc_c_P) %>% 
  mutate(rc_c_P_pop_ext=per_ext*pop_rc_c_P) %>% 
  mutate(rc_c_P_pop_com=per_com*pop_rc_c_P)-> df2

df2 %>% 
  mutate(pop_slight = bc_a_H_pop_sli+
           bc_a_L_pop_sli+
           bc_a_M_pop_sli+
           bc_a_P_pop_sli+
           bc_b_H_pop_sli+
           bc_b_L_pop_sli+
           bc_b_M_pop_sli+
           bc_b_P_pop_sli+
           bw_H_pop_sli+
           bw_L_pop_sli+
           bw_M_pop_sli+
           bw_P_pop_sli+
           rc_a_H_pop_sli+
           rc_a_L_pop_sli+
           rc_a_M_pop_sli+
           rc_a_P_pop_sli+
           rc_b_H_pop_sli+
           rc_b_L_pop_sli+
           rc_b_M_pop_sli+
           rc_b_P_pop_sli+
           rc_c_H_pop_sli+
           rc_c_L_pop_sli+
           rc_c_M_pop_sli+
           rc_c_P_pop_sli
  ) %>% 
  mutate(pop_moderate = bc_a_H_pop_mod+
           bc_a_L_pop_mod+
           bc_a_M_pop_mod+
           bc_a_P_pop_mod+
           bc_b_H_pop_mod+
           bc_b_L_pop_mod+
           bc_b_M_pop_mod+
           bc_b_P_pop_mod+
           bw_H_pop_mod+
           bw_L_pop_mod+
           bw_M_pop_mod+
           bw_P_pop_mod+
           rc_a_H_pop_mod+
           rc_a_L_pop_mod+
           rc_a_M_pop_mod+
           rc_a_P_pop_mod+
           rc_b_H_pop_mod+
           rc_b_L_pop_mod+
           rc_b_M_pop_mod+
           rc_b_P_pop_mod+
           rc_c_H_pop_mod+
           rc_c_L_pop_mod+
           rc_c_M_pop_mod+
           rc_c_P_pop_mod) %>% 
  mutate(pop_extensive = bc_a_H_pop_ext+
           bc_a_L_pop_ext+
           bc_a_M_pop_ext+
           bc_a_P_pop_ext+
           bc_b_H_pop_ext+
           bc_b_L_pop_ext+
           bc_b_M_pop_ext+
           bc_b_P_pop_ext+
           bw_H_pop_ext+
           bw_L_pop_ext+
           bw_M_pop_ext+
           bw_P_pop_ext+
           rc_a_H_pop_ext+
           rc_a_L_pop_ext+
           rc_a_M_pop_ext+
           rc_a_P_pop_ext+
           rc_b_H_pop_ext+
           rc_b_L_pop_ext+
           rc_b_M_pop_ext+
           rc_b_P_pop_ext+
           rc_c_H_pop_ext+
           rc_c_L_pop_ext+
           rc_c_M_pop_ext+
           rc_c_P_pop_ext
  ) %>% 
  mutate(pop_complete = bc_a_H_pop_com+
           bc_a_L_pop_com+
           bc_a_M_pop_com+
           bc_a_P_pop_com+
           bc_b_H_pop_com+
           bc_b_L_pop_com+
           bc_b_M_pop_com+
           bc_b_P_pop_com+
           bw_H_pop_com+
           bw_L_pop_com+
           bw_M_pop_com+
           bw_P_pop_com+
           rc_a_H_pop_com+
           rc_a_L_pop_com+
           rc_a_M_pop_com+
           rc_a_P_pop_com+
           rc_b_H_pop_com+
           rc_b_L_pop_com+
           rc_b_M_pop_com+
           rc_b_P_pop_com+
           rc_c_H_pop_com+
           rc_c_L_pop_com+
           rc_c_M_pop_com+
           rc_c_P_pop_com
  ) %>% 
  dplyr::select(link, pop, 
                Steel_slight, Steel_moderate, Steel_extensive, Steel_complete,
                Copper_slight, Copper_moderate, Copper_extensive, Copper_complete,
                Cement_slight, Cement_moderate, Cement_extensive, Cement_complete,
                pop_slight, pop_moderate, pop_extensive, pop_complete) %>% 
  mutate(Steel_slight=Steel_slight*0.2,
         Steel_moderate=Steel_moderate*0.4,
         Steel_extensive=Steel_extensive*0.7,
         Steel_complete=Steel_complete*1,
         
         Copper_slight=Copper_slight*0.2,
         Copper_moderate=Copper_moderate*0.4,
         Copper_extensive=Copper_extensive*0.7,
         Copper_complete=Copper_complete*1,
         
         Cement_slight=Cement_slight*0.2,
         Cement_moderate=Cement_moderate*0.4,
         Cement_extensive=Cement_extensive*0.7,
         Cement_complete=Cement_complete*1
         
  ) -> sj3

sj3 %>% 
  dplyr::select(-1) %>% 
  colSums() %>% 
  as.data.frame() %>% 
  slice(c(10:13)) %>% 
  as_tibble() %>% 
  colSums() -> cement_results

sj3 %>% 
  dplyr::select(-1) %>% 
  colSums() %>% 
  as.data.frame() %>% 
  slice(c(6:9)) %>% 
  as_tibble() %>% 
  colSums() -> copper_results

sj3 %>% 
  dplyr::select(-1) %>% 
  colSums() %>% 
  as.data.frame() %>% 
  slice(c(2:5)) %>% 
  as_tibble() %>% 
  colSums() -> steel_results

c(0.00001, 0.0001, 0.001, 0.01) %>% 
  as_tibble() -> die
c(0.00005, 0.001, 0.005, 0.05) %>% 
  as_tibble() -> injure

data.frame(pop_result0, die, injure) %>% 
  as_tibble() %>% 
  set_names("pop", "die", "injure") %>% 
  mutate(die2=pop*die,
         injure2=injure*pop
  ) %>% 
  dplyr::select(die2, injure2) %>% 
  colSums() -> pop_results

