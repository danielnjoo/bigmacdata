#' Economist Big Mac Index Dataset
#'
#' This is a package that makes available the Big Mac Index from the Economist
#' which offers a "true" picture of a currency's value in relation to base
#' currencies such as the USD, JPY, CNY, etc; there is also an "adjusted" Big
#' Mac Index which adjusts the index for differences in GDP per capita between
#' countries.
#'
#' While the dataset covers observations of Big Mac prices in 55 unique countries
#' from 2000 to 2020, original adjusted prices from the Economist are only available
#' for most countries starting in 2011 due to lack of IMF GDP data in the original
#' dataset. Here, IMF data from 2000-2020 is added in and adjusted prices are recalculated.
#'
#' More information on the methodology of this can be found at
#' \url{https://www.economist.com/news/2020/07/15/the-big-mac-index}
#'
#'
#' \tabular{ll}{
#' \strong{Variable}\tab \strong{Description}                                                     \cr
#' date             \tab Date                                                                     \cr
#' iso_a3           \tab Three-character ISO 3166-1 country code                                  \cr
#' currency_code    \tab Three-character ISO 4217 currency code                                   \cr
#' name             \tab Country name                                                             \cr
#' local_price      \tab Price of a Big Mac in the local currency                                 \cr
#' dollar_ex        \tab Local currency units per dollar                                          \cr
#' gdp_dollar       \tab GDP per person, in dollars                                               \cr
#' imf_gdp_dollar   \tab GDP per person (IMF), in dollars                                         \cr
#' adj_price        \tab GDP-adjusted price of a Big Mac, in dollars                              \cr
#' imf_adj_price    \tab GDP-adjusted price of a Big Mac (IMF), in dollars                        \cr
#' usd_raw          \tab Implied premium/discount of local currency to USD                        \cr
#' eur_raw          \tab Implied premium/discount of local currency to EUR                        \cr
#' gbp_raw          \tab Implied premium/discount of local currency to GBP                        \cr
#' jpy_raw          \tab Implied premium/discount of local currency to JPY                        \cr
#' cny_raw          \tab Implied premium/discount of local currency to CNY                        \cr
#' usd_adjusted     \tab Economist GDP-adjusted premium/discount to USD                           \cr
#' eur_adjusted     \tab Economist GDP-adjusted premium/discount to EUR                           \cr
#' gbp_adjusted     \tab Economist GDP-adjusted premium/discount to GBP                           \cr
#' jpy_adjusted     \tab Economist GDP-adjusted premium/discount to JPY                           \cr
#' cny_adjusted     \tab Economist GDP-adjusted premium/discount to CNY                           \cr
#' imf_usd_adjusted \tab IMF GDP-adjusted premium/discount to USD                                 \cr
#' imf_gbp_adjusted \tab IMF GDP-adjusted premium/discount to GBP                                 \cr
#' imf_jpy_adjusted \tab IMF GDP-adjusted premium/discount to JPY                                 \cr
#' imf_cny_adjusted \tab IMF GDP-adjusted premium/discount to CNY
#' }
#'
#'
#' @seealso \url{https://www.economist.com/news/2020/07/15/the-big-mac-index}
#' @seealso \url{https://github.com/TheEconomist/big-mac-data}
#'
"bigmacdata"
