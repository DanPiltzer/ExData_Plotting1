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

## Begin plotting
plot(mydata$DateTime, mydata$Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab = "")
lines(mydata$DateTime, mydata$Global_active_power, type = "l")
dev.copy(png,"plot2.png")
dev.off()
