# weatherobs
Package for downloading ground observation of weather data across Indonesia

## Install packages 
``` r
install.packages(devtools)  
library(devtools)  
install_github("adisapoetro/weatherobs")  
```
## Install / load required packages 
install.packages(data.table)  
install.packages(stringi)  
install.packages(dplyr)  
install.packages(lubridate)  

## Load the library
library(weatherobs)  
  
library(data.table)  
library(stringi)  
library(dplyr)  
library(lubridate)  

## Downloading the data from station 96109 and 96295
96109_96295 <- download.bmkg(stasiun=c("96109","96295"), attempts=5)  
  
You can access the list of the stations here:  
https://aviation.bmkg.go.id/web/station.php

