library("dplyr")
library("ggplot2")

data <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/blob/main/us-prison-jail-rates-1990.csv?raw=true")

data_in_2018 <- data %>% filter(year == "2018")

per_county <- data_in_2018 %>%
  group_by(county_name) %>%
  summarise(total_jail_pop_rate = mean(total_jail_pop_rate, na.rm = TRUE), black_jail_pop_rate = mean(black_jail_pop_rate, na.rm = TRUE))

chart_2_plot <- ggplot(per_county) + 
  geom_smooth(mapping = aes(x = total_jail_pop_rate, y = black_jail_pop_rate)) +
  geom_point(mapping = aes(x = total_jail_pop_rate, y = black_jail_pop_rate)) +
  scale_x_continuous(limits = c(0, 1000)) +
  scale_y_continuous(limits = c(0, 4000)) + 
  labs(title = "Black Jail Pop Rate vs. Total Jail Pop Rate", x = "Total Jail Pop Rate", y = "Black Jail Pop Rate")

chart_2_plot
