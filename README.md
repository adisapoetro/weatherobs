# weatherobs
Package for downloading ground observation of weather data from Indonesia (BMKG) and accross the world. You can access the list of the stations here:  
https://aviation.bmkg.go.id/web/station.php.  
The data that are downloaded in bulk since the begining of the ground observation recording untill the last recording. 


![tet2](stastiun.png)

## Install packages 
``` r
install.packages(devtools)  
library(devtools)  
install_github("adisapoetro/weatherobs")  
```
## Install / load required packages 
``` r
install.packages(data.table)  
install.packages(stringi)  
install.packages(dplyr)  
install.packages(lubridate)  
```
## Load the library
``` r
library(weatherobs)  
  
library(data.table)  
library(stringi)  
library(dplyr)  
library(lubridate)  
```
## Example : Downloading the data from station 96109 and 96295
```
96109_96295 <- download.bmkg(stasiun=c("96109","96295"), attempts=5)  
```  
You can access the list of the stations here:  
https://aviation.bmkg.go.id/web/station.php

