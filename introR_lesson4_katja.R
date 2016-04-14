analyze <- function(filename) {
  # Plots the average, min, and max inflammation over time.
  # Input is character string of a csv file.
  dat <- read.csv(file = filename, header = FALSE)
  avg_day_inflammation <- apply(dat, 2, mean)
  plot(avg_day_inflammation)
  max_day_inflammation <- apply(dat, 2, max)
  plot(max_day_inflammation)
  min_day_inflammation <- apply(dat, 2, min)
  plot(min_day_inflammation)
}

analyze_all <- function(pattern) {
  # Runs the function analyze for each file in the current working directory
  # that contains the given pattern.
  filenames <- list.files(path = "data", pattern = pattern, full.names = TRUE)
  for (f in filenames) {
    analyze(f)
  }
}

analyze("inflammation-01.csv")
# creates pdf for the three graphs produced by the above code
# pdf opens it, dev.off turns it off (need to do this so it doesn't print over your old ones)
pdf("inflammation-01.pdf")
analyze("inflammation-01.csv")
dev.off()

# if statements!
num <- 37
if(num>100){
  print("greater")
} else{
  print ("not greater")
}
print("done)")

num <- 102
if(num>100){
  print("num is greater than 100")
}


sign <- function(num){
  if(num>0){
    return(1)
  } else if (num == 0){
    return(0)
  } else {
    return(-1)
  }
}
sign(-3)
sign(0)
sign(2/3)

# combine tests
if (1>0 & -1>0){
  print("both parts are true")
} else {
  print ("at least one part is not true")
}

