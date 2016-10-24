## Read in and format data
mydata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
mydata <- na.omit(mydata)
mydata$Date  <- paste(mydata$Date)
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydata$Time  <- paste(as.character(mydata$Date), mydata$Time)
mydata$Time <- strptime(mydata$Time, format = "%Y-%m-%d %H:%M:%S")
mydata <- subset(mydata, Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")))
names(mydata)[2] = "DateTime"

## Set up parameters
par(mfrow = c(1,1))

## Begin Plotting
plot(mydata$DateTime, mydata$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab ="")
lines(mydata$DateTime, mydata$Sub_metering_1, type = "l")
lines(mydata$DateTime, mydata$Sub_metering_2, type = "l", col = "orange")
lines(mydata$DateTime, mydata$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "orange", "blue"), lty = c(1,1,1), lwd = c(2,2,2))
dev.copy(png,"plot3.png")
dev.off()
