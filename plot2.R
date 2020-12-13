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
par(mfrow= c(1,1))
with(PowerData, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab ="Global Active Power (kilowatts)"))
dev.copy(png, file = "plot2.png")
dev.off()