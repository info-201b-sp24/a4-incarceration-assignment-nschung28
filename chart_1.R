library("dplyr")
library("ggplot2")

data <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/blob/main/us-prison-jail-rates-1990.csv?raw=true")

avg_jail_pop_ot <- data %>% 
  filter(year > "1995") %>% group_by(year) %>% 
  summarise(black_jail_rate = mean(black_jail_pop_rate, na.rm = TRUE), white_jail_rate = mean(white_jail_pop_rate, na.rm = TRUE))

chart_1_plot <- ggplot(avg_jail_pop_ot) + 
  geom_line(mapping = aes(x = year, y = black_jail_rate, color = "Black Jail Pop Rate")) +
  geom_line(mapping = aes(x = year, y = white_jail_rate, color = "White Jail Pop Rate")) +
  labs(title = "Average Jail Rate From 1995-2018", x = "Year", y = "Average Rate", color = "Legend")

chart_1_plot
