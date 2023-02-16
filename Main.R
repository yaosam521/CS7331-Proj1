#load the csv file/ check how many missing values do we have
library(tidyverse)
cases <- read_csv("covid-02-04-23-cs-2020.csv")
cases<- cases %>% mutate_if(is.character, factor)
is.na(cases) %>% sum()
#extract colNames in a separate csv file
colNames <- colnames(cases) %>% as_tibble
write_csv(colNames,"colNames_original.csv")
#load filtered colNames
colNames_filtered <- read_csv("colnames_filtered.csv")
colnames(colNames_filtered)
cases_filtered <- cases %>% select(colNames_filtered$value)
is.na(cases_filtered) %>% sum() 
cases_filtered %>% summarise_all(~sum(is.na(.))) %>%  select(if_any(~any(. > 0)))

