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
filter(.data = ________, ________)

# generate a data frame with the 10 most expensive (net cost) colleges in 2018-19
arrange(.data = ________, ________) %>%
  slice(________)

slice_max(.data = ________, order_by = ________, n = ________)

# generate a data frame with the average SAT score for each type of college
scorecard %>%
  group_by(________) %>%
  summarize(mean_sat = ________)

# calculate for each school how many students it takes to pay
# the average faculty member's salary and generate a data frame
# with the school's name and the calculated value
# - use net cost of attendance
scorecard %>%
  mutate(________ = ________) %>%
  select(________, ________)

# calculate how many private, nonprofit schools have a smaller net cost
# than Cornell University
## Hint: the result should be a data frame with one row for Cornell University,
## and a column containing the requested value.

## report the number as the total number of schools
scorecard %>%
  ________ %>% ...

## Report the number as the percentage of schools
scorecard %>%
  ________ %>% ...
