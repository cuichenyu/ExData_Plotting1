#Sorry that I really didn't know how to read data from just those dates... So I
#calculated the lines of those two dates and use "skip" and "nrow" to achieve that
#goal. And to do this, I have to get the colnames first.

#Please notice that the data file must be under the same directory with this file.

#Sorry that the tickmarks on x axis are displayed in Chinese. This may be due to
#some kind of system settings but I didn't know how to change that...

colNames <- colnames(read.table("household_power_consumption.txt", header = T, sep = ";", nrows = 10))
data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?", nrows = 2880, skip = 66637, col.names = colNames)
data$DateAndTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

par(mfrow = c(2,2))

plot(data$DateAndTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

plot(data$DateAndTime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

with(data, plot(DateAndTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(data, points(DateAndTime, Sub_metering_2, type = "l", col = "red"))
with(data, points(DateAndTime, Sub_metering_3, type = "l", col = "blue"))
legend("topright",bty = "n", lwd = 1, cex = 0.7, text.width = 80000, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(data$DateAndTime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()