# load required packages
library(tidyverse)
library(rcis)

# view header of the dataset
scorecard
glimpse(scorecard)

# view help file for the dataset
?scorecard

# generate a data frame of schools with a greater than
# 40% share of first-generation students
filter(.data = scorecard, firstgen > .40)

# generate a data frame with the 10 most expensive (net cost) colleges in 2018-19
arrange(.data = scorecard, desc(netcost)) %>%
  slice(1:10)

slice_max(.data = scorecard, order_by = netcost, n = 10)

# generate a data frame with the average SAT score for each type of college
scorecard %>%
  group_by(type) %>%
  summarize(mean_sat = mean(satavg, na.rm = TRUE))

# calculate for each school how many students it takes to pay
# the average faculty member's salary and generate a data frame
# with the school's name and the calculated value
# - use net cost of attendance
scorecard %>%
  mutate(ratio = avgfacsal / netcost) %>%
  select(name, ratio)

# calculate how many private, nonprofit schools have a smaller net cost
# than Cornell University
## Hint: the result should be a data frame with one row for Cornell University,
## and a column containing the requested value.

## report the number as the total number of schools
scorecard %>%
  filter(type == "Private, nonprofit") %>%
  arrange(netcost) %>%
  # use row_number() but subtract 1 since Cornell is not cheaper than itself
  mutate(school_cheaper = row_number() - 1) %>%
  filter(name == "Cornell University") %>%
  glimpse()

## Report the number as the percentage of schools
scorecard %>%
  filter(type == "Private, nonprofit") %>%
  mutate(netcost_rank = percent_rank(netcost)) %>%
  filter(name == "Cornell University") %>%
  glimpse()
