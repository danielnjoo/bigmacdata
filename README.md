![R](https://github.com/danielnjoo/bigmacdata/workflows/R/badge.svg)
# Big Mac Dataset

Originally from the Economist, great interactive explanation of which can be found [here](https://www.economist.com/news/2020/07/15/the-big-mac-index). This package makes that data available and recalculates adjusted index figures on different IMF GDP data to increase coverage from 2000-2020 from 2011-2020.

Dimensions of the dataset are 1329x25, covering 55 countries from April 2000 to July 2020 and 33 unqiue dates.

### Codebook
<table>
 <thead>
  <tr>
   <th style="text-align:left;"> Name </th>
   <th style="text-align:left;"> Description </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> date </td>
   <td style="text-align:left;"> Date </td>
  </tr>
  <tr>
   <td style="text-align:left;"> iso_a3 </td>
   <td style="text-align:left;"> Three-character ISO 3166-1 country code </td>
  </tr>
  <tr>
   <td style="text-align:left;"> currency_code </td>
   <td style="text-align:left;"> Three-character ISO 4217 currency code </td>
  </tr>
  <tr>
   <td style="text-align:left;"> name </td>
   <td style="text-align:left;"> Country name </td>
  </tr>
  <tr>
   <td style="text-align:left;"> local_price </td>
   <td style="text-align:left;"> Price of a Big Mac in the local currency </td>
  </tr>
  <tr>
   <td style="text-align:left;"> dollar_ex </td>
   <td style="text-align:left;"> Local currency units per dollar </td>
  </tr>
  <tr>
   <td style="text-align:left;"> gdp_dollar </td>
   <td style="text-align:left;"> GDP per person, in dollars </td>
  </tr>
  <tr>
   <td style="text-align:left;"> imf_gdp_dollar </td>
   <td style="text-align:left;"> GDP per person (IMF), in dollars </td>
  </tr>
  <tr>
   <td style="text-align:left;"> adj_price </td>
   <td style="text-align:left;"> GDP-adjusted price of a Big Mac, in dollars </td>
  </tr>
  <tr>
   <td style="text-align:left;"> imf_adj_price </td>
   <td style="text-align:left;"> GDP-adjusted price of a Big Mac (IMF), in dollars </td>
  </tr>
  <tr>
   <td style="text-align:left;"> usd_raw </td>
   <td style="text-align:left;"> Implied premium/discount of local currency to USD vs market exchange rate </td>
  </tr>
  <tr>
   <td style="text-align:left;"> eur_raw </td>
   <td style="text-align:left;"> Implied premium/discount of local currency to EUR vs market exchange rate </td>
  </tr>
  <tr>
   <td style="text-align:left;"> gbp_raw </td>
   <td style="text-align:left;"> Implied premium/discount of local currency to GBP vs market exchange rate </td>
  </tr>
  <tr>
   <td style="text-align:left;"> jpy_raw </td>
   <td style="text-align:left;"> Implied premium/discount of local currency to JPY vs market exchange rate </td>
  </tr>
  <tr>
   <td style="text-align:left;"> cny_raw </td>
   <td style="text-align:left;"> Implied premium/discount of local currency to CNY vs market exchange rate </td>
  </tr>
  <tr>
   <td style="text-align:left;"> usd_adjusted </td>
   <td style="text-align:left;"> Implied premium/discount adjusted for GDP (Economist) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> eur_adjusted </td>
   <td style="text-align:left;"> Implied premium/discount adjusted for GDP (Economist) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> gbp_adjusted </td>
   <td style="text-align:left;"> Implied premium/discount adjusted for GDP (Economist) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> jpy_adjusted </td>
   <td style="text-align:left;"> Implied premium/discount adjusted for GDP (Economist) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> cny_adjusted </td>
   <td style="text-align:left;"> Implied premium/discount adjusted for GDP (Economist) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> imf_usd_adjusted </td>
   <td style="text-align:left;"> Implied premium/discount adjusted for GDP (IMF) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> imf_gbp_adjusted </td>
   <td style="text-align:left;"> Implied premium/discount adjusted for GDP (IMF) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> imf_jpy_adjusted </td>
   <td style="text-align:left;"> Implied premium/discount adjusted for GDP (IMF) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> imf_cny_adjusted </td>
   <td style="text-align:left;"> Implied premium/discount adjusted for GDP (IMF) </td>
  </tr>
</tbody>
</table>

### Usage

Install and load:
```{r}
library(devtools)
install.github("danielnjoo/bigmacdata")
library(bigmacdata)
```

The below example shows a lineplot comparing IMF-GDP adjusted Big Mac USD Premia/Discount.

```{r}
library(bigmacdata)
bigmacdata %>%
   filter(date==max(bigmacdata$date)) %>%
   mutate(over=ifelse(imf_USD_adjusted>0, 1, 0)) %>%
   ggplot(aes(
            factor(name, levels=name[order(imf_USD_adjusted)]),
            imf_USD_adjusted,
            col=as.factor(over))) +
  geom_linerange(aes(ymin=0, ymax=imf_USD_adjusted)) +
  geom_point() +
  coord_flip() +
  theme(
       axis.title.x = element_blank(),
       axis.title.y = element_blank(),
       legend.position = "none") +
  labs(title="IMF GDP adjusted Big Mac USD Premia/Discount, July 2020")
```
![](https://i.imgur.com/DvoIgMa.png)
