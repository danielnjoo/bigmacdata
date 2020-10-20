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
#'
#' Codebook:
#' \begin{tabular}{l|l}
#' \hline
#' Name & Description\\
#' \hline
#' date & Date\\
#' \hline
#' iso\_a3 & Three-character ISO 3166-1 country code\\
#' \hline
#' currency\_code & Three-character ISO 4217 currency code\\
#' \hline
#' name & Country name\\
#' \hline
#' local\_price & Price of a Big Mac in the local currency\\
#' \hline
#' dollar\_ex & Local currency units per dollar\\
#' \hline
#' gdp\_dollar & GDP per person, in dollars\\
#' \hline
#' imf\_gdp\_dollar & GDP per person (IMF), in dollars\\
#' \hline
#' adj\_price & GDP-adjusted price of a Big Mac, in dollars\\
#' \hline
#' imf\_adj\_price & GDP-adjusted price of a Big Mac (IMF), in dollars\\
#' \hline
#' usd\_raw & Implied premium/discount of local currency to USD vs market exchange rate\\
#' \hline
#' eur\_raw & Implied premium/discount of local currency to EUR vs market exchange rate\\
#' \hline
#' gbp\_raw & Implied premium/discount of local currency to GBP vs market exchange rate\\
#' \hline
#' jpy\_raw & Implied premium/discount of local currency to JPY vs market exchange rate\\
#' \hline
#' cny\_raw & Implied premium/discount of local currency to CNY vs market exchange rate\\
#' \hline
#' usd\_adjusted & Implied premium/discount adjusted for GDP (Economist)\\
#' \hline
#' eur\_adjusted & Implied premium/discount adjusted for GDP (Economist)\\
#' \hline
#' gbp\_adjusted & Implied premium/discount adjusted for GDP (Economist)\\
#' \hline
#' jpy\_adjusted & Implied premium/discount adjusted for GDP (Economist)\\
#' \hline
#' cny\_adjusted & Implied premium/discount adjusted for GDP (Economist)\\
#' \hline
#' imf\_usd\_adjusted & Implied premium/discount adjusted for GDP (IMF)\\
#' \hline
#' imf\_gbp\_adjusted & Implied premium/discount adjusted for GDP (IMF)\\
#' \hline
#' imf\_jpy\_adjusted & Implied premium/discount adjusted for GDP (IMF)\\
#' \hline
#' imf\_cny\_adjusted & Implied premium/discount adjusted for GDP (IMF)\\
#' \hline
#' \end{tabular}
"big_mac_data"
