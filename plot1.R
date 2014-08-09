#Sorry that I really didn't know how to read data from just those dates... So I
#calculated the lines of those two dates and use "skip" and "nrow" to achieve that
#goal. And to do this, I have to get the colnames first.

#Please notice that the data file must be under the same directory with this file.

colNames <- colnames(read.table("household_power_consumption.txt", header = T, sep = ";", nrows = 10))
data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?", nrows = 2880, skip = 66637, col.names = colNames)

hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")

dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()