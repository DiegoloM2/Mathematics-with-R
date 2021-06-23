data00 <- mtcars
plot(x = data00$mpg, y = data00$cyl, main = 'Mpg in relation to cylinders', col = 'red')
#plotting a very basic graph

str(data00)
library(tidyverse)

#tidyverse package is great fro data wrangling
data00 %>%
  select(cyl, mpg) %>%
  filter(cyl == 4)

#using the mutate function to change a dataset
k = data00 %>%
  mutate(mpg.per.cyl = mpg/cyl)%>%
  group_by(mpg)%>%
  summarise(mean(mpg.per.cyl))


plot(x = data00$mpg, y = data00$cyl, main = 'Mpg in relation to cylinders', col = 'red')
#plotting a very basic graph
View(k)
