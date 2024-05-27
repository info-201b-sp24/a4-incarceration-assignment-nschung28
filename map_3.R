library("dplyr")
library("ggplot2")
library("usmap")

data <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/blob/main/us-prison-jail-rates-1990.csv?raw=true")

data_in_2018 <- data %>% filter(year == "2018")

per_state <- data_in_2018 %>%
  group_by(state) %>%
  summarise(black_jail_pop_rate = mean(black_jail_pop_rate, na.rm = TRUE))

plot_1 <- plot_usmap(data = per_state, values = "black_jail_pop_rate", labels = FALSE) +
  scale_fill_continuous(name = "Black Jail Pop Rate", low = "yellow", high = "red", na.value = "grey") +
  labs(title = "Black Jail Pop Rate By State in the Year 2018")

plot_1

per_state_2 <- data_in_2018 %>%
  group_by(state) %>%
  summarise(white_jail_pop_rate = mean(white_jail_pop_rate, na.rm = TRUE))

plot_2 <- plot_usmap(data = per_state_2, values = "white_jail_pop_rate", labels = FALSE) +
  scale_fill_continuous(name = "White Jail Pop Rate", low = "yellow", high = "red", na.value = "grey") +
  labs(title = "White Jail Pop Rate By State in the Year 2018")

plot_2
