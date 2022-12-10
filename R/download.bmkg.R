#download.bmkg
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

download.bmkg <- function (stasiun, attempts=5, # sometimes download fail, attempts will retry
                                dest=getwd()) {

  for (sts in stasiun) {
    #print(paste0("https://bulk.meteostat.net/v2/hourly/", sts, ".csv.gz"))
    some_function_that_may_fail <- function() {
      download.file(url= paste0("https://bulk.meteostat.net/v2/hourly/", sts, ".csv.gz"),
                    destfile= paste0(dest, "/",sts, ".csv.gz"),
                    method="curl")}
    r <- NULL
    attempt <- 1
    while( is.null(r) && attempt <= attempts) {
      attempt <- attempt + 1
      try(r <- some_function_that_may_fail())
    }
  }

  read.csv.gz <- function(file)  {
    dat <- fread(file)
    dat$fname <- file
    dat$fname <- stri_sub(dat$fname,-12,-8)
    return(dat)
  } # read data


  pth <- dest
  list <-lapply(list.files(path =pth,
                           pattern = ".csv.gz", full.names = TRUE),read.csv.gz)



  df <- rbindlist (list,  fill=TRUE)

  df <- df %>%
    dplyr::select(V1, V2, V3, V4, V5,V8, V9, V11, fname) %>%
    dplyr::rename(date = V1, time =V2, temperature_c =V3, dew_temperature_c =V4, rh_percent= V5,
                  pressure_mbar = V11, id = fname, wind_speed_kmh = V9, wind_direction_degree=V8) %>%
    mutate(date_time = paste(date, time, sep = " ")) %>%
    mutate(date_time = paste(date_time, ":00", sep="")) %>%
    mutate(date_time = ymd_hm(date_time)) %>%
    dplyr::select(-date, -time) %>%
    relocate(date_time) %>%
    ungroup()


  return(df)



}
