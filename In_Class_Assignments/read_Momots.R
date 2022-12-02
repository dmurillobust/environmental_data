And we will filter momots from Honduras


HN_Momots <- momotus %>% 
  dplyr::select(species, countryCode, individualCount, decimalLongitude, decimalLatitude, eventDate, datasetKey) %>% 
  filter(countryCode == "HN", !decimalLongitude == 0) %>% 
  group_by(species, decimalLongitude, decimalLatitude , eventDate, datasetKey) %>% 
  summarise(Abundance = sum(individualCount ))

# Save HN_Momots

write.csv2(HN_Momots, here("data", "HnMomots.csv"))

