library(openxlsx)
library(tidyverse)
library(lubridate)

ants <- read.xlsx("xlsx_data.xlsx", detectDates = TRUE, sheet=1)
ants$measured_at <- as_datetime(ants$measured_at * 24 * 3600, origin="1899-12-30")
ants
concentration <- read.xlsx("xlsx_data.xlsx", detectDates = TRUE, sheet=2)
concentration$measured_at <- as_datetime(concentration$measured_at * 24 * 3600, origin="1899-12-30")
concentration

merge(ants, concentration)
