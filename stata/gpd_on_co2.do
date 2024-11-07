clear all
capture log close
cd "/Users/sathvikbaskaran/Documents/University/Fall_2022/Econometrics/GDP_CO2_Project/stata/"
log using "/Users/sathvikbaskaran/Documents/University/Fall_2022/Econometrics/GDP_CO2_Project/stata/Emperical_results.txt", replace text
import delimited "/Users/sathvikbaskaran/Documents/University/Fall_2022/Econometrics/GDP_CO2_Project/data/owid-co2-data.csv"

drop if gdp==.
drop if methane==. | nitrous_oxide==. | primary_energy_consumption==. | total_ghg==. | cumulative_co2==.


summarize cumulative_co2 gdp nitrous_oxide population total_ghg methane primary_energy_consumption if country == "China"

regress cumulative_co2 gdp population primary_energy_consumption if country=="China"
regress total_ghg gdp population primary_energy_consumption if country=="China"
regress methane gdp population primary_energy_consumption if country=="China"
regress nitrous_oxide gdp population primary_energy_consumption if country=="China"


summarize cumulative_co2 gdp nitrous_oxide population total_ghg methane primary_energy_consumption if country == "Pakistan"

regress cumulative_co2 gdp population primary_energy_consumption if country=="Pakistan"
regress total_ghg gdp population primary_energy_consumption if country=="Pakistan"
regress methane gdp population primary_energy_consumption if country=="Pakistan"
regress nitrous_oxide gdp population primary_energy_consumption if country=="Pakistan"

summarize cumulative_co2 gdp nitrous_oxide population total_ghg methane primary_energy_consumption if country == "India"

regress cumulative_co2 gdp population primary_energy_consumption if country=="India"
regress total_ghg gdp population primary_energy_consumption if country=="India"
regress methane gdp population primary_energy_consumption if country=="India"
regress nitrous_oxide gdp population primary_energy_consumption if country=="India"


summarize cumulative_co2 gdp nitrous_oxide population total_ghg methane primary_energy_consumption if country=="United States"

regress cumulative_co2 gdp population primary_energy_consumption if country=="United States"
regress total_ghg gdp population primary_energy_consumption if country=="United States"
regress methane gdp population primary_energy_consumption if country=="United States"
regress nitrous_oxide gdp population primary_energy_consumption if country=="United States"


log close
