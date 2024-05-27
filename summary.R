library("dplyr")
library("ggplot2")

data <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/blob/main/us-prison-jail-rates-1990.csv?raw=true")

num_rows <- nrow(data)
num_cols <- ncol(data)

avg_pop_in_2018 <- data %>% 
  filter(year == "2018") %>% 
  summarise(total_pop = round(mean(total_pop, na.rm = TRUE), 3)) %>% 
  pull(total_pop)

avg_jaiL_pop_in_2018 <- data %>% 
  filter(year == "2018") %>% 
  summarise(total_jail_pop_rate = round(mean(total_jail_pop_rate, na.rm = TRUE), 3)) %>% 
  pull(total_jail_pop_rate)

avg_black_jaiL_pop_in_2018 <- data %>% 
  filter(year == "2018") %>% 
  summarise(black_jail_pop_rate = round(mean(black_jail_pop_rate, na.rm = TRUE), 3)) %>% 
  pull(black_jail_pop_rate)

avg_white_jaiL_pop_in_2018 <- data %>% 
  filter(year == "2018") %>% 
  summarise(white_jail_pop_rate = round(mean(white_jail_pop_rate, na.rm = TRUE), 3)) %>% 
  pull(white_jail_pop_rate)
