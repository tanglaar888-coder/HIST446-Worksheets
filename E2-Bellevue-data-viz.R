# =============================================================================
# In-class: First graphs with ggplot2, using the Bellevue Almshouse admissions
# HIST 446: The Past as Data | Ball State University | Fall 2026
#
# Data: Anelise Hanson Shrout, "(Re)Humanizing Data: Digitally Navigating the
# Bellevue Almshouse," Current Research in Digital History 1 (2018).
# One row = one admission to the Bellevue Almshouse, New York, 1845-1847.
#
# Keep the ggplot2 cheatsheet open. Every graph below follows its template:
#   ggplot(data, aes(x = ..., y = ...)) + geom_...() + labs(...)
# =============================================================================

library(tidyverse)   # includes ggplot2 and lubridate (for dates)

bellevue <- read_csv("data/bellevue_for_R.csv", show_col_types = FALSE)
glimpse(bellevue)
# The first column (...1) is just row numbers saved by R. You can ignore it.


#### 1. "Recent emigrant" admissions by month ####

# Count admissions whose reason was "recent emigrant", month by month.
# floor_date() turns every date into the first day of its month.
emigrants_by_month <- bellevue %>%
  filter(reason_cleaned == "recent emigrant") %>%
  mutate(month = floor_date(date_in, "month")) %>%
  count(month)

emigrants_by_month

# Your first ggplot: the data, which column goes on each axis, and a geom.
ggplot(emigrants_by_month, aes(x = month, y = n)) +
  geom_col()

# Same data, as a line with points, plus labels. Each "+" adds a layer.
ggplot(emigrants_by_month, aes(x = month, y = n)) +
  geom_line() +
  geom_point() +
  labs(title = "Admissions for 'recent emigrant', Bellevue Almshouse",
       x = "Month of admission", y = "Admissions")

# QUESTION: What happens after May 1847? Write down what you think it means
# before you run the next section.


#### 2. Did the immigrants stop coming? ####

# Count ALL admissions by month, split into "recent emigrant" and everything else.
all_by_month <- bellevue %>%
  mutate(month  = floor_date(date_in, "month"),
         reason = if_else(reason_cleaned %in% "recent emigrant",
                          "recent emigrant", "any other reason")) %>%
  count(month, reason)

# Mapping a column to color draws one line per group, with a legend.
ggplot(all_by_month, aes(x = month, y = n, color = reason)) +
  geom_line() +
  geom_point() +
  geom_vline(xintercept = as.Date("1847-06-01"), linetype = "dashed") +
  labs(title = "Bellevue Almshouse admissions by month, 1845-1847",
       x = "Month of admission", y = "Admissions", color = "Recorded reason")

# QUESTION: Total admissions stay high after June 1847, but "recent emigrant"
# almost disappears. What changed: the people, or the paperwork? What would a
# reader who saw only the graph in section 1 conclude?

dir.create("output/exercise2/", showWarnings = FALSE)
ggsave("output/exercise2/bellevue_admissions_by_month.png", width = 8, height = 5)


#### 3. Your turn: pick at least two ####
# Each starter works as is. Change it, label it, and save the one you like.

# (a) The ten most common reasons for admission (a bar chart).
#     aes(y = ...) puts the bars sideways so the labels are readable.
bellevue %>%
  count(reason_cleaned) %>%
  slice_max(n, n = 10) %>%
  ggplot(aes(x = n, y = reorder(reason_cleaned, n))) +
  geom_col()

# (b) The ages of the people admitted (a histogram). Why are some bars so much
#     taller than their neighbors? (Try binwidth = 1.) Look at the far right too:
#     is every age believable? What should a historian do with them?
ggplot(bellevue, aes(x = age_standard)) +
  geom_histogram(binwidth = 5)

# (c) Ages by gender (a boxplot). Try geom_violin() instead of geom_boxplot().
ggplot(bellevue, aes(x = gender, y = age_standard)) +
  geom_boxplot()

# (d) Reasons over time, one small graph per reason (facets). Compare "sickness"
#     and "recent emigrant" after June 1847. What might be going on?
bellevue %>%
  filter(reason_cleaned %in% c("sickness", "recent emigrant", "destitution", "intemperance")) %>%
  mutate(month = floor_date(date_in, "month")) %>%
  count(month, reason_cleaned) %>%
  ggplot(aes(x = month, y = n)) +
  geom_line() +
  facet_wrap(~ reason_cleaned)

# (e) The top "occupations." Color the bars by gender with aes(fill = gender).
#     What does it mean that "married," "spinster," and "widow" appear here?
bellevue %>%
  count(occupation, gender) %>%
  slice_max(n, n = 12) %>%
  ggplot(aes(x = n, y = reorder(occupation, n), fill = gender)) +
  geom_col()

# (f) Choose one of the above visualizations to save to your new output/exercise2/ directory. Commit, then push to GitHub.