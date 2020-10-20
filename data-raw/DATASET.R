## code to prepare `DATASET` dataset goes here
library(tidyverse)
library(data.table)


big_mac_data1 <- readr::read_csv("data-raw/big-mac-full-index.csv") %>%
  janitor::clean_names()

IMF_data <- read_csv("data-raw/imf_data.csv") %>%
  filter(
    Indicator == "NGDPDPC", # this is the indicator code for GDP pc in $
    Country %in% unique(big_mac_data1$iso_a3),
    Year %in% 2000:2020
  )

big_mac_data2 <- big_mac_data1 %>%
  mutate(year = lubridate::year(date)) %>%
  inner_join(IMF_data, by=c("year"="Year", "iso_a3"="Country"))  %>%
  rename("imf_gdp_dollar" = Value) %>%
  select(-Indicator, -year)

big_mac_data_mods <- big_mac_data2 %>%
  group_by(date) %>%
  do(mod = lm(dollar_price ~ imf_gdp_dollar, data=.))

big_mac_data3 <- big_mac_data2 %>%
  select(date, dollar_price, imf_gdp_dollar) %>%
  group_by(date) %>%
  nest() %>%
  full_join(big_mac_data_mods) %>%
  group_by(date) %>%
  do(augment(.$mod[[1]], newdata = .$data[[1]])) %>%
  inner_join(big_mac_data2, by=c("date"="date", "imf_gdp_dollar"="imf_gdp_dollar")) %>%
  rename("imf_adj_price" = .fitted, "dollar_price" = dollar_price.x) %>%
  select(-dollar_price.y)

base_currencies = c('USD', 'EUR', 'GBP', 'JPY', 'CNY')
big_mac_data_adj <- data.table(big_mac_data3)
for(currency in base_currencies) {
  big_mac_data_adj[
    ,                           # we don't want a subset, so our first argument is blank
    (currency) :=               # we'll add a new column named for the base set
      (                       # we divide the dollar price by the adjusted price to get
        dollar_price / imf_adj_price  # the deviation from our expectation by
      ) /
      # the same figure from the *base currency*'s row
      (
        .SD[currency_code == currency]$dollar_price /
          .SD[currency_code == currency]$imf_adj_price
      ) -
      1,                      # one means parity (neither over- nor under-valued), so we subtract
    # one to get an over/under-valuation value
    by=date                     # and of course, we'll group these rows by date
    ]
}

big_mac_data <- big_mac_data3 %>%
  cbind(big_mac_data_adj[,c("USD", "GBP", "JPY", "CNY")]) %>%
  rename("imf_USD_adjusted"=USD, "imf_GBP_adjusted"=GBP, "imf_JPY_adjusted"=JPY,
         "imf_CNY_adjusted"=CNY) %>%
  select(-.resid)

usethis::use_data(big_mac_data, overwrite = TRUE)
