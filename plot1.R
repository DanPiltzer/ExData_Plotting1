## Read in and format data
mydata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
mydata <- na.omit(mydata)
mydata$Date  <- paste(mydata$Date)
mydata$Time  <- paste(mydata$Time)
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydata$Time <- strptime(mydata$Time, format = "%H:%M:%S")
mydata <- subset(mydata, Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")))

## Set up parameters
par(mfrow = c(1,1))

## Begin plotting
hist(mydata$Global_active_power, col = "orange", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.copy(png,"plot1.png")
dev.off()
