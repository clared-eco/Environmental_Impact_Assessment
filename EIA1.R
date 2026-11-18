#setting everything up, working directory, loading packages
setwd("/Users/clareduganne/Desktop/Environmental_Impact_Assessment")

library(readxl)
library(readr)
library(dplyr)
library(stringr)

#reading files I want to compare in 
#comparing species sighted 2km radius of Lochranza and Scottish protected species list
protected <- read_xlsx("protected.xlsx")
arranspecies <- read_csv("arranspecies.csv")

#checking column names match
names(protected)
names(arranspecies)

#renaming protected species
protected <- protected |>rename('Species Name' = ...2)

#joining by just species that are protected and sighted on Arran
arranprotected <- inner_join(protected, arranspecies, by = "Species Name")

#renaming common names column
arranprotected <- arranprotected |>rename('Common Name' = ...3)
arranprotected <- arranprotected |>rename('Legislation Giving Protection' = ...4)
arranprotected <- arranprotected |>rename('Schedule or Annex Listing' = ...5)

#writing arranprotected as a .csv
write_csv(arranprotected, "arranprotected.csv")
