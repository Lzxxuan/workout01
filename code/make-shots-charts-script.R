# title: make-shorts-charts-script
# description: this script includes the code for preparing charts
# input (s): 
## nba-court.jpg (images/); dataset of andre_iguodala, graymond_green, kevin_durant, klay_thompson, stephen_curry
# output(s): the outputs includes: 
## andre-iguodala-shot-chart.pdf (images/)
## draymond-green-shot-chart.pdf (images/)
## kevin-durant-shot-chart.pdf (images/)
## klay-thompson-shot-chart.pdf (images/)
## stephen-curry-shot-chart.pdf (images/)
## gsw-shot-chars.pdf (images/)
## gsw-shot-chars.png (images/)

# 4.1) Shot chars of each player
library(ggplot2)
library(jpeg)
library(grid)
# court image (to be used as background of plot)
court_file <- "../images/nba-court.jpg"

## create raster object
court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc"))

## shot chart for andre
andre_shot_chart <- ggplot(data = andre_iguodala) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') +
  theme_minimal()
ggsave('../images/andre-iguodala-shot-chart.pdf', width = 6.5, height = 5, units = "in")


## shot chart for graymond
draymond_shot_chart <- ggplot(data = draymond_green) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') +
  theme_minimal()
ggsave('../images/draymond-green-shot-chart.pdf', width = 6.5, height = 5, units = "in")

## shot chart for kevin
kevin_shot_chart <- ggplot(data = kevin_durant) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') +
  theme_minimal()
ggsave('../images/kevin-durant-shot-chart.pdf', width = 6.5, height = 5, units = "in")

## shot chart for klay
klay_shot_chart <- ggplot(data = klay_thompson) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()
ggsave('../images/klay-thompson-shot-chart.pdf', width = 6.5, height = 5, units = "in")

## shot chart for stephen
stephen_shot_chart <- ggplot(data = stephen_curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') +
  theme_minimal()
ggsave('../images/stephen-curry-shot-chart.pdf', width = 6.5, height = 5, units = "in")

# 4.2) Facetted Shot Chart
gsw_shot_chart <- ggplot(data = shots_data) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: GSW (2016 season)') +
  facet_wrap(~ name)
  theme_minimal()
ggsave('../images/gsw-shot-charts.pdf', width = 8, height = 7, units = "in")


## save it in PNG format
ggsave('../images/gsw-shot-charts.png', width = 8, height = 7, units = "in")

