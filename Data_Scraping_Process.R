# packages loaded

library(RSelenium)
library(wdman)
library(netstat)
library(binman)
library(tidyverse)
library(rvest)
library(data.table)

# starting the session

remote_driver <- rsDriver(browser = "chrome",
                          chromever= "115.0.5790.102",
                          verbose = F,
                          port = free_port())

# create a client object

remDr <- remote_driver$client

# DATA SCRAPIN TIME

#open browser

remDr$open()

#navigate to website

remDr$navigate("https://afdc.energy.gov/vehicle-registration")

# finding elements

reg_2022 <- remDr$findElement(using = "id", "vehicle_registration")

# convert to data table

reg_2022_html <- reg_2022$getPageSource()
page <- read_html(reg_2022_html %>% unlist())
df <- html_table(page) %>% .[[1]]
reg_2022_data_unclean <- list()
reg_2022_data_unclean <- rbindlist(list(reg_2022_data_unclean, df))

# fix column names...right now they are all 2022 "Light-Duty Vehicle Registration Counts by State and Fuel Type"

reg_2022_data <- setnames(reg_2022_data_unclean, c("State", "Electric (EV)","Plug-In Hybrid Electric (PHEV)", "Hybrid Electric (HEV)", "Biodiesel", "Ethanol/Flex (E85)","Compressed Natural Gas (CNG)", "Propane", "Hydrogen", "Methanol", "Gasoline", "Diesel", "Unknown Fuel"))
reg_2022_data <- reg_2022_data[-c(1)]

# now the data for the 2022 table is clean! 
# repeat process for years 2016-2021

# 2016

remDr$navigate("https://afdc.energy.gov/vehicle-registration?year=2016")

reg_2016 <- remDr$findElement(using = "id", "vehicle_registration")
reg_2016_html <- reg_2016$getPageSource()
page_2016 <- read_html(reg_2016_html %>% unlist())
df_2016 <- html_table(page_2016) %>% .[[1]]
reg_2016_data_unclean <- list()
reg_2016_data_unclean <- rbindlist(list(reg_2016_data_unclean, df_2016))
reg_2016_data <- setnames(reg_2016_data_unclean, c("State", "Electric (EV)","Plug-In Hybrid Electric (PHEV)", "Hybrid Electric (HEV)", "Biodiesel", "Ethanol/Flex (E85)","Compressed Natural Gas (CNG)", "Propane", "Hydrogen", "Methanol", "Gasoline", "Diesel", "Unknown Fuel"))
reg_2016_data <- reg_2016_data[-c(1)]

# 2017

remDr$navigate("https://afdc.energy.gov/vehicle-registration?year=2017")

reg_2017 <- remDr$findElement(using = "id", "vehicle_registration")
reg_2017_html <- reg_2017$getPageSource()
page_2017 <- read_html(reg_2017_html %>% unlist())
df_2017 <- html_table(page_2017) %>% .[[1]]
reg_2017_data_unclean <- list()
reg_2017_data_unclean <- rbindlist(list(reg_2017_data_unclean, df_2017))
reg_2017_data <- setnames(reg_2017_data_unclean, c("State", "Electric (EV)","Plug-In Hybrid Electric (PHEV)", "Hybrid Electric (HEV)", "Biodiesel", "Ethanol/Flex (E85)","Compressed Natural Gas (CNG)", "Propane", "Hydrogen", "Methanol", "Gasoline", "Diesel", "Unknown Fuel"))
reg_2017_data <- reg_2017_data[-c(1)]

# 2018

remDr$navigate("https://afdc.energy.gov/vehicle-registration?year=2018")

reg_2018 <- remDr$findElement(using = "id", "vehicle_registration")
reg_2018_html <- reg_2018$getPageSource()
page_2018 <- read_html(reg_2018_html %>% unlist())
df_2018 <- html_table(page_2018) %>% .[[1]]
reg_2018_data_unclean <- list()
reg_2018_data_unclean <- rbindlist(list(reg_2018_data_unclean, df_2018))
reg_2018_data <- setnames(reg_2018_data_unclean, c("State", "Electric (EV)","Plug-In Hybrid Electric (PHEV)", "Hybrid Electric (HEV)", "Biodiesel", "Ethanol/Flex (E85)","Compressed Natural Gas (CNG)", "Propane", "Hydrogen", "Methanol", "Gasoline", "Diesel", "Unknown Fuel"))
reg_2018_data <- reg_2018_data[-c(1)]

# 2019

remDr$navigate("https://afdc.energy.gov/vehicle-registration?year=2019")

reg_2019 <- remDr$findElement(using = "id", "vehicle_registration")
reg_2019_html <- reg_2019$getPageSource()
page_2019 <- read_html(reg_2019_html %>% unlist())
df_2019 <- html_table(page_2019) %>% .[[1]]
reg_2019_data_unclean <- list()
reg_2019_data_unclean <- rbindlist(list(reg_2019_data_unclean, df_2019))
reg_2019_data <- setnames(reg_2019_data_unclean, c("State", "Electric (EV)","Plug-In Hybrid Electric (PHEV)", "Hybrid Electric (HEV)", "Biodiesel", "Ethanol/Flex (E85)","Compressed Natural Gas (CNG)", "Propane", "Hydrogen", "Methanol", "Gasoline", "Diesel", "Unknown Fuel"))
reg_2019_data <- reg_2019_data[-c(1)]

# 2020

remDr$navigate("https://afdc.energy.gov/vehicle-registration?year=2020")

reg_2020 <- remDr$findElement(using = "id", "vehicle_registration")
reg_2020_html <- reg_2020$getPageSource()
page_2020 <- read_html(reg_2020_html %>% unlist())
df_2020 <- html_table(page_2020) %>% .[[1]]
reg_2020_data_unclean <- list()
reg_2020_data_unclean <- rbindlist(list(reg_2020_data_unclean, df_2020))
reg_2020_data <- setnames(reg_2020_data_unclean, c("State", "Electric (EV)","Plug-In Hybrid Electric (PHEV)", "Hybrid Electric (HEV)", "Biodiesel", "Ethanol/Flex (E85)","Compressed Natural Gas (CNG)", "Propane", "Hydrogen", "Methanol", "Gasoline", "Diesel", "Unknown Fuel"))
reg_2020_data <- reg_2020_data[-c(1)]

# 2021

remDr$navigate("https://afdc.energy.gov/vehicle-registration?year=2021")

reg_2021 <- remDr$findElement(using = "id", "vehicle_registration")
reg_2021_html <- reg_2021$getPageSource()
page_2021 <- read_html(reg_2021_html %>% unlist())
df_2021 <- html_table(page_2021) %>% .[[1]]
reg_2021_data_unclean <- list()
reg_2021_data_unclean <- rbindlist(list(reg_2021_data_unclean, df_2021))
reg_2021_data <- setnames(reg_2021_data_unclean, c("State", "Electric (EV)","Plug-In Hybrid Electric (PHEV)", "Hybrid Electric (HEV)", "Biodiesel", "Ethanol/Flex (E85)","Compressed Natural Gas (CNG)", "Propane", "Hydrogen", "Methanol", "Gasoline", "Diesel", "Unknown Fuel"))
reg_2021_data <- reg_2021_data[-c(1)]

# now all of the data has been scraped from each table and formatted in a usable way.

