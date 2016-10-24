##Read in and format data
mydata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
mydata <- na.omit(mydata)
mydata$Date  <- paste(mydata$Date)
mydata$Time  <- paste(mydata$Time)
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydata$Time <- strptime(mydata$Time, format = "%H:%M:%S")
mydata <- subset(mydata, Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")))

## Setting parameters
par(mfrow = c(2,2))

## Start first plot
plot(mydata$DateTime, mydata$Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab = "")
lines(mydata$DateTime, mydata$Global_active_power, type = "l")

##Start Second Plot
plot(mydata$DateTime, mydata$Voltage, type = "n", ylab = "Voltage", xlab = "datetime")
lines(mydata$DateTime, mydata$Voltage, type = "l")

## Start Third Plot
plot(mydata$DateTime, mydata$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab ="")
lines(mydata$DateTime, mydata$Sub_metering_1, type = "l")
lines(mydata$DateTime, mydata$Sub_metering_2, type = "l", col = "orange")
lines(mydata$DateTime, mydata$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "orange", "blue"), lty = c(1,1,1), lwd = c(2,2,2))

##Begin Fourth Plot
plot(mydata$DateTime, mydata$Global_reactive_power, type = "n", ylab = "Global_reactive_power", xlab = "datetime")
lines(mydata$DateTime, mydata$Global_reactive_power, type = "l")

dev.copy(png,"plot4.png")
dev.off()