## Read data file

##Use first row as names
Columns <- read.csv("household_power_consumption.txt", sep = ";", nrows = 1)
##Read only 1,2/2/2007
PowerData <- read.csv("household_power_consumption.txt", sep = ";", skip = 66636, nrows = 69518-66638, col.names = names(Columns))
##Convert Date and Time units
PowerData$DateTime <- paste(PowerData$Date, PowerData$Time)
PowerData$Date <- as.Date(PowerData$Date)
PowerData$Time <- strptime(PowerData$Time, "%H:%M:%S")
PowerData$DateTime <- strptime(PowerData$DateTime, "%d/%m/%Y %H:%M:%S")

##Plot the Plot 1
par(mfrow= c(2,2))
with(PowerData, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab ="Global Active Power (kilowatts)"))
with(PowerData, plot(DateTime, Voltage, type = "l", ylab ="Voltage"))
with(PowerData, plot(DateTime, Sub_metering_1,  type = "l", xlab = "", ylab ="Energy sub metering"))
with(PowerData, lines(DateTime, Sub_metering_2,  type = "l", col = "red"))
with(PowerData, lines(DateTime, Sub_metering_3,  type = "l", col = "blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty =1)
with(PowerData, plot(DateTime, Global_reactive_power, type = "l", ylab ="Global_reactive_power"))
dev.copy(png, file = "plot4.png")
dev.off()