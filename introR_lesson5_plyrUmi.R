install.packages('dplyr')
library(dplyr)
install.packages("ggplot2", dependencies = TRUE)
library(ggplot2)

# find mammals data in data-files, look at your data in various ways
dat <- read.csv(file.choose())
View(dat)
head(dat)
glimpse(dat)

# select just a few columns
select(dat, order, species)
select(dat, starts_with('adult'))
select(dat, -order)

#select just a few rows, using filter, which lets you pull out rows of your data set
# that conform to some logic you determine
# example below: only select the rows for which the order is Carnivora
filter(dat, order=="Carnivora")
# ok, now you just want small carnivores (under 5000 grams):
filter(dat, order=="Carnivora" & adult_body_mass_g<5000)

# arrange sorts your data frame in a variety of ways
# it won't change the fundamental data frame unless you tell it to write over the 
# original
# so if you want to save these versions, do like example 1 below
dat1 <- arrange(dat, adult_body_mass_g)
arrange(dat, desc(adult_body_mass_g))
arrange(dat, order, adult_body_mass_g))

# okay now look at dat1:
head(dat1)
# what's the smallest mammal in this data set?

# tell plyr you want to look at the data separately by order, and save it to 'a':
a <- group_by(dat, order)
# use 'a' to create a new data frame where you're finding the mean of each order's
# body mass; "for every order, make a column with the mean body mass"
b <- summarize(a, mean_mass=mean(adult_body_mass_g, na.rm=TRUE))
# other way to do this, adding new column (mean body weight) to orig. data frame:
b <- mutate(a, mean_mass=mean(adult_body_mass_g, na.rm=TRUE))

#okay, now we want the standard deviation too.  So we're going to make a new
# data frame that has a, mean body mass, and std of body mass:
d <- summarize(a, mean_mass=mean(adult_body_mass_g, na.rm=TRUE),
               sd_mass=sd(adult_body_mass_g, na.rm=TRUE))

# so what's the diff between summarize and mutate?
# mutate adds a new column (with the product of your function) to the orig. structure
# summarize gives you a completely differently structured data set

# now let's add another column, with the normalized mass of each animal (norm_mass):
# how big is each individual species relative to its genus' mean body mass?
e <- mutate(a, mean_mass=mean(adult_body_mass_g, na.rm=TRUE),
            norm_mass=(adult_body_mass_g/mean_mass))

# okay, so how do with do this without creating the variable a?
# MAKE A PIPELINE!  just like in the shell terminal.
e <- dat %>% #take our data
  group_by(order) %>% #split it up by order
  mutate(mean_mass=mean(adult_body_mass_g, na.rm=TRUE),
         norm_mass=(adult_body_mass_g/mean_mass)) %>% #how much bigger is each animal by the others in its order?
         arrange(desc(norm_mass)) #arrange by these relative masses

## CHALLENGE QUESTION: which order has the most spp?
# which order has the widest range of body mass (max-min)?
# which spp of carnivore has the largest body length to body mass ratio
  # (adult_head_body_len_mm / adult_body_mass_g)?

# which order has the most spp?
mostspp <- dat %>% #take data
  group_by(order) %>% #split it up by order
  summarize(spp_count=length(species)) %>%
  arrange(desc(spp_count))
mostspp

# which order has the widest range of body mass (max-min)?
massrange <- dat %>% #take data
  group_by(order) %>% #split by order
  summarize(mass_range=max(adult_body_mass_g, na.rm=TRUE)-min(adult_body_mass_g, na.rm=TRUE)) %>%
  arrange(desc(mass_range))
massrange

# which spp of carnivore has the largest body length to body mass ratio
# (adult_head_body_len_mm / adult_body_mass_g)?
carn_length_mass <- dat %>%
  filter(order=="Carnivora") %>%
  mutate(length_mass=(adult_head_body_len_mm/adult_body_mass_g)) %>%
  arrange(desc(length_mass))
carn_length_mass
# OR (if you just want the output, you'll need to group by species for some logical reason I don't remember):
carn_length_mass2 <- dat %>%
  group_by(species) %>%
  filter(order=="Carnivora") %>%
  summarize(length_mass=(adult_head_body_len_mm/adult_body_mass_g)) %>%
  arrange(desc(length_mass))
carn_length_mass2












