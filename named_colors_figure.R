library(tidyverse)

named_colors = data.frame(name=colors()) %>%
  filter(!str_detect(name, 'gray'))

n_colors = nrow(named_colors)
n_rows = 80
n_cols = ceiling(n_colors/n_rows)

named_colors$row = rep(n_rows:1, n_cols)[1:n_colors] * 3
named_colors$col = sort(rep(1:n_cols, n_rows))[1:n_colors]

fill_space = '             '

p=ggplot(named_colors, aes(x=col,y=row)) + 
  geom_label(aes(label=fill_space),family='mono', fill=named_colors$name, size=4) +
  geom_text(aes(label=name),nudge_y = -1, size=5.2) + 
  scale_x_continuous(expand = c(0.1,0.1)) +
  scale_y_continuous(expand = c(0.01,0.01)) +
  theme_minimal() +
  theme(axis.text = element_blank(),
        axis.title = element_blank(),
        panel.grid = element_blank(),
        plot.margin = margin(0,0,0,0))

ggsave('named_colors.png', p, height=120, width=30,unit='cm',dpi=60)
             
