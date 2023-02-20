#load the csv file/ check how many missing values do we have
library(tidyverse)
cases <- read_csv("covid-02-04-23-cs-2020.csv")
cases<- cases %>% mutate_if(is.character, factor)
# check for NA values
is.na(cases) %>% sum()
#extract colNames in a separate csv file
colNames <- colnames(cases) %>% as_tibble
write_csv(colNames,"colNames_original.csv")
#load filtered colNames
colNames_filtered <- read_csv("colnames_filtered.csv")
colnames(colNames_filtered)
cases_filtered <- cases %>% select(colNames_filtered$value)
# check for NA values
is.na(cases_filtered) %>% sum() 
cases_filtered %>% summarise_all(~sum(is.na(.))) %>%  select(where(~any(. > 0)))
canceledColNames <- c("female_female_households","male_male_households","pop_5_years_over")
cases_filtered <- cases_filtered %>% select(-canceledColNames)
is.na(cases_filtered) %>% sum() 
cases_filtered <- unique(cases_filtered)
cases_filtered
# work again on the correlation graphs so that you can minimize the csv features to work with


