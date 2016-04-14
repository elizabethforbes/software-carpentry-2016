# changing directory
setwd("~/Desktop/software-carpentry-2016/data-files/r-lesson/data/")
list.files()
dat <- read.csv('inflammation-01.csv', header=FALSE)
inf_01 <- read.csv('inflammation-01.csv', header=FALSE)

weight_kg <- 55
weight_kg

#convert weight to pounds
weight_kg*2.2

#calculate weight in pounds, save it to a variable
weight_lb <- weight_kg*2.2

head(dat)
class(dat)
dim(dat)
#first value in dat
dat[1,1]
#middle value in dat
dat[30,20]
#get data for first 10 days (cols) of first 4 raptors (rows)
dat[1:4,1:10]
#use function c to combine non-contiguous values (raptors 3,8,37, and 56,
# days 10, 14, and 29):
dat[c(3,8,37,56),c(10,14,29)]
#all columns from row (raptor) 5:
dat[5,]
#all rows from column (day) 10:
dat[,10]

## MATH TIME!  LA DA DEE DA DEEEEEE
# first row, all the cols (days)
raptor_1 <- dat[1,]
#max inflammation levels for this poor arthritic raptor 1:
max(raptor_1)
#OR!  be more efficient, and get the max inf. of raptor 2 this way:
max(dat[2,])
#minimum inflammation on day 7
min(dat[,7])
#mean
mean(dat[,7])
#median
median(dat[,7])
#standard deviation
sd(dat[,7])

#apply function!  we want the max inflammation for all raptors, or the
# average for each day, etc.  need to perform fxn across a margin of the
# data frame
# apply allows you to repeat a function on row (MARGIN = 1) or columns
# (MARGIN = 2)<-- margin is the second argument of apply, so you can just use the numbers in the command
#avg infl of all raptors
avg_raptor_inflammation <- apply(dat, 1, mean)
#avg infl of all days
avg_day_inflammation <- apply(dat,2,mean)

# challenge: slice of character vector
animal <- c("m","o","n","k","e","y")
#first three characters:
animal[1:3]
#last three:
animal[4:6]
#get first four characters in reverse order?
rev(animal[1:4])
#what is animal[-1]? <-- takes away first character
#what is animal[-4]? <-- takes away fourth character
animal[-1]
animal[-4]
#what is animal[-1:-4]? <-- takes away the characters from 1 to 4
animal[-1:-4] 
# create a slice of animal that spells the word eon
animal[c(5,2,3)]

plot(avg_day_inflammation)
max_day_inflammation <- apply(dat,2,max)
plot(max_day_inflammation)
min_day_inflammation <- apply(dat,2,min)
plot(min_day_inflammation)
sd_day_inflammation <- apply(dat,2,sd)
plot(sd_day_inflammation)
