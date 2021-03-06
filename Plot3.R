Plot3<- function()
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
  png("Plot3.png")
  plot(subset$newCol, subset$Sub_metering_1, type= "l", xaxt= "n", ylab = "Energy sub metering", xlab = "", col = "BLACK")
  lines(subset$newCol, subset$Sub_metering_2, col = "RED")
  lines(subset$newCol, subset$Sub_metering_3, col = "BLUE")
  ticks <- c(1, lgt/2 + 1, lgt + 1)
  labs <- c("Thu", "Fri", "Sat")
  axis(1, at = ticks, labels = labs)
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("BLACK", "RED" , "BLUE"))
  dev.off()
}