Plot2 <- function()
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
  subset<- x[y, ]
  
  ##Create a column that allows time to be plotted
  lgt <- length(subset$Date)
  subset$newCol <- c(1:lgt)
  
  ##Construct the plot
  png("Plot2.png")
  plot(subset$newCol, subset$Global_active_power, type= "l", xaxt= "n", ylab = "Global Active Power (kilowatts)", xlab = "")
  ticks <- c(1, lgt/2 + 1, lgt + 1)
  labs <- c("Thu", "Fri", "Sat")
  axis(1, at = ticks, labels = labs)
  dev.off()
}