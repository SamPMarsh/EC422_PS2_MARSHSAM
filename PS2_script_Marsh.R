library(tidyquant)
library(tidyverse)

# unemp_raw = tq_get(
#   c("UNRATE", "ORUR", "CAUR", "TCUR", "NYUR"),
#   get = "economic.data",
#   from = "1976-01-01"
# )
# 
# head(unemp_raw)
# 
# dir.create("data", showWarnings = FALSE)
# 
# write_rds(unemp_raw, "data/unemp_raw.rds")

unemp_raw = read_rds("data/unemp_raw.rds")

unemp = unemp_raw |>
  rename(unemplooyment_rate = _) |>
  mutate(
    region = case_when(
      symbol = "UNRATE" ~ "United States",
      symbol == "_" ~ "Oregon",
      
    )
  )
