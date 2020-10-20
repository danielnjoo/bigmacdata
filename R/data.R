#' This is a package that makes available the Big Mac Index from the Economist
#' which offers a "true" picture of a currency's value in relation to base
#' currencies such as the USD, JPY, CNY, etc; there is also an "adjusted" Big
#' Mac Index which adjusts the index for differences in GDP per capita between
#' countries. More information on the methodology of this can be found at
#' https://www.economist.com/news/2020/07/15/the-big-mac-index
#'
#' While the dataset covers observations of Big Mac prices in 55 unique countries
#' from 2000 to 2020, adjusted prices are only available for most countries
#' starting in 2011 due to lack of IMF GDP data in the original dataset. Here,
#' IMF data from 2000-2020 is added in and adjusted prices are recalculated.
"big_mac_data"
