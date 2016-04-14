# lesson on loops!
list.files()

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

# this method, below, is boring.
analyze("inflammation-01.csv")
analyze("inflammation-02.csv")
analyze("inflammation-03.csv")

# let's make it more efficient and less boring with a for loop!
best_practice <- c("Let", "the", "computer", "do", "the", "work")
best_practice 

# this isn't a for loop, and is therefore still stupidly boring and inefficiently
print_words <- function(sentence){
  # function prints a sentence
  print(sentence[1])
  print(sentence[2])
  print(sentence[3])
  print(sentence[4])
  print(sentence[5])
  print(sentence[6])
}

print_words(best_practice)
print_words(best_practice[-6])

# OMG! for-loops
print_words <- function(sentence){
  for(word in sentence){
    print(word)
  }
}
print_words(best_practice)
# hooray!  doesn't have the silly empty term at the end when you do this:
print_words(best_practice[-6])

# generally for a for loop (this is the intellectual thought process):
# for (variable in collection){
# do things with variable
# }

# here's another for loop example:
len <- 0
vowels <- c("a", "e", "i", "o", "u")
for (v in vowels){
  len <- len+1
}
# number of vowels is:
len

# ch-ch-ch-CHALLENGE
# using seq (a built-in function that creates a list of numbers),
# write a function that prints the first N natural numbers, one per line
# like so: print_N(3)
print_N <- function(nat_numbers){
  #function prints the first n natural numbers
  container_of_numbers <- seq(nat_numbers)
  for(n in container_of_numbers){
      print(n)
  }
}
print_N(5)
print_N(7)
# etc....

# processing multiple files!  this is what we want to do.
list.files()
Sys.glob("*.csv")
Sys.glob("i*.csv")
filenames=Sys.glob("i*.csv")

# run the analysis on each file (analyze being the function we defined earlier)
for(file in filenames){
  print(file)
  analyze(file)
}




