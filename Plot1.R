Plot1 <- function()
{
  ##Reads the data into dataframe x
  x <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?", nrow = 5)
  classes <- sapply(x, class)
  x <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?", colClasses = classes)
  
  ##Create a logical vector that will be used to subset the data
  y <- c(x$Date == "1/2/2007")
  z <- c(x$Date == "2/2/2007")
  y <- as.logical(y + z)
  
  ##Subset data
  z<- x[y, ]
  
  ##Construct histogram
  png("Plot1.png")
  hist(z$Global_active_power, breaks = 12, col = "RED", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
  dev.off()
}