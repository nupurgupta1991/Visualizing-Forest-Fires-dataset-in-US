install.packages("readr")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("purrr")

library(readr)
library(dplyr)
library(ggplot2)
library(purrr)

forestfires <- read_csv("forestfires.csv")

freq_fires <- forestfires %>%
  select(month, day) %>%
  mutate(month = factor(month, levels = c("jan", "feb", "mar", "apr", "may", "jun", "jul", "aug", 
                                          "sep", "oct", "nov", "dec"))) %>%
  mutate(day = factor(day, levels = c("mon", "tue", 'wed', 'thu', 'fri', 'sat', 'sun')))

ggplot(freq_fires) +
  aes(x = month) +
  geom_bar() +
  labs(title = "Fires by month", y = "Total_Fires")

ggplot(freq_fires) +
  aes(x = day) +
  geom_bar() +
  labs(title = "Fires by day", y = "Total_Fires")

box_fun <- function(x,y) {
  ggplot(forestfires) +
    aes_string(x = x, y = y) +
    geom_boxplot() 
}

x1 <- names(forestfires)[3]
x2 <- names(forestfires)[4]
y_var <- names(forestfires)[5:13]

map2(x1,y_var,box_fun)
map2(x2, y_var, box_fun)

scatter_fun <- function(x,y) {
  ggplot(forestfires) +
    aes_string(x = x, y = y) +
    geom_point(alpha = 0.3)
}

x_var <- names(forestfires)[5:12]
y1 <- names(forestfires)[13]

map2(x_var, y1, scatter_fun)