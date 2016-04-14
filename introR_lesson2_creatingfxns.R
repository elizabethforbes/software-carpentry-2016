#asks what the structure of a thing is
str(read.csv)

# make yurr own function!
# you can use functions inside it (e.g. return, which will print the 
# product of your function)
fahr_to_kelvin <- function(temp){
  kelvin <- ((temp-32)*(5/9))+273.15
  return(kelvin)
}
# test it out, with temp F
fahr_to_kelvin(32)

kelvin_to_celcius <- function(temp){
  celcius <- temp - 273.15
  return(celcius)
}

# fahrenheit to celcius
fahr_to_celcius <- function(temp){
  temp_k <- fahr_to_kelvin(temp)
  result <- kelvin_to_celcius(temp_k)
  return(result)
}
fahr_to_celcius(32)

# challenge: create a function
best_practice <- c("Write", "programs", "for", "people", "not", "computers")
asterisk <- "***" # R interprets a variable with a single value as a vector with one element
fence <- function(original, wrapper){
  wrapped <- c(wrapper, original, wrapper)
  return(wrapped)
}
fence(best_practice, asterisk)
