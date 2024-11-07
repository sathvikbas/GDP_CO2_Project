clear all
capture log close
cd "/Users/dylanstricklett/Documents/Econ 350/Empirical Project"
log using "/Users/dylanstricklett/Documents/Econ 350/Empirical Project/Emperical_results_StricklettDylan.txt", replace text
import delimited "/Users/dylanstricklett/Documents/Econ 350/Empirical Project/owid-co2-data.csv"


gen real_cum_co2 = cumulative_co2*1000000000
gen scaled_gdp = gdp/1000000000
gen gdp_per_capita = gdp/population
egen country_group = group(country)
bysort country (year): gen gdp_growth = (gdp - gdp[_n-1])/(gdp[_n-1] * (year - year[_n-1]))

xtset country_group year
xtreg cumulative_co2 population gdp methane nitrous_oxide flaring_co2 coal_co2 consumption_co2 gas_co2 trade_co2 primary_energy_consumption i.year
xtreg total_ghg population gdp methane nitrous_oxide co2 primary_energy_consumption i.year


log close
