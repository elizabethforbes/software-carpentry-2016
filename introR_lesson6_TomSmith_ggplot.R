#learning to use GGPLOT2!
# gg = grammar of graphics
getwd()
install.packages("ggplot2", dependencies=TRUE)
library(ggplot2)
library(dplyr)

# note to self: you're making a lot of layers on plot here, whereas in real life (lol real life)
# you'd probably just integrate all this into one section once you're done formatting

mammals<- read.csv(file.choose())
head(mammals)
myplot <- ggplot(data=mammals)
# won't see your points til you assign 'points' to your geometry, as seen below
# without geom, you get the plot space but no data populating it yet
myplot <- ggplot(data=mammals, aes(x=adult_body_mass_g, y=adult_head_body_len_mm))+geom_point()
# soooo clearly there's a huge range of head:body sizes in this data; so, use a log scale!:
myplot + scale_x_log10()
# change the size of my points!
myplot + geom_point(size=3) + scale_x_log10()
myplot + geom_point(size=3) + scale_x_log10() + aes(color=litter_size)
myplot + geom_point(size=3) + scale_x_log10() + aes(color=litter_size)

TailsnWhales <- filter(mammals, order == "Rodentia" | order == "Cetacea")
#boxplot:
ggplot(data=TailsnWhales, aes(x=order, y=adult_body_mass_g))+geom_boxplot(size=1, aes(color=order))+
  scale_y_log10()
#histogram:
ggplot(data=TailsnWhales, aes(x=adult_head_body_len_mm))+  
  geom_histogram()+
  scale_x_log10()

## FACET WRAPPING!  this is awesome.
ggplot(data=mammals, aes(x=adult_body_mass_g, y=adult_head_body_len_mm))+
  geom_point()+
  scale_x_log10()+
  facet_wrap(~order)
# cut and paste code from site in order to add extra info on home ranges:
# if you type data$"vector that doesn't already exist", it gets created
# though it is empty til you fill it (which is what's happening below)
mammals$RangeCategory[mammals$home_range_km2 <= 0.01] <- "micro_machines"
mammals$RangeCategory[mammals$home_range_km2 > 0.01 & mammals$home_range_km2 <= 1] <- "homebodies"
mammals$RangeCategory[mammals$home_range_km2 > 0.1 & mammals$home_range_km2 <= 10] <- "strollers"
mammals$RangeCategory[mammals$home_range_km2 > 10 & mammals$home_range_km2 <= 100] <- "roamers"
mammals$RangeCategory[mammals$home_range_km2 > 100 & mammals$home_range_km2 <= 1000] <- "free_agents"
mammals$RangeCategory[mammals$home_range_km2 > 1000] <- "transcendentalists"
# okay check out what this looks like
head(mammals$RangeCategory)

# now: filter, to create a subset of data that only includes a few orders
OrderSubset<-filter(mammals, order == "Rodentia" | order == "Cetacea" | order=="Primates" | order=="Carnivora") 
OrderSubset$RangeCategory <- factor(OrderSubset$RangeCategory, levels = c("micro_machines", "homebodies", "strollers", "roamers", "free_agents", "transcendentalists"))
OrderSubset$order <- factor(OrderSubset$order, levels = c("Rodentia", "Carnivora", "Primates", "Cetacea"))
# now, make a histogram of this subsetted data.
ggplot(data=OrderSubset, aes(x=adult_body_mass_g))+
  geom_histogram(aes(fill=order))+
  scale_x_log10()+
  facet_grid(RangeCategory~order, scales="free")+
  scale_fill_brewer(palette="Spectral")

#now we want to add theme: overarching qualities of whole image
# we want WES ANDERSON THEME
install.packages("wesanderson")
library(wesanderson)

ggplot(data=OrderSubset, aes(x=adult_body_mass_g))+
  geom_histogram(aes(fill=order))+
  scale_x_log10()+
  facet_grid(RangeCategory~order, scales="free")+
  scale_fill_manual(values=wes_palette("GrandBudapest"))+
  theme_bw()+
  theme(legend.key=element_rect(fill=NA),
        legend.position="bottom",
        axis.title=element_text(angle=0, size=18, face="bold"),
        legend.text=element_text(angle=0, size=12, face="bold"),
        panel.background=element_rect(fill=NA))




