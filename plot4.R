setwd("~/Coursera/Data Science/ExploratoryDataAnalysis/Assignment1/Data")
dat <- read.table("household_power_consumption.txt", sep = ";", 
                  header = TRUE,
                  colClasses = c(rep("factor",2),rep("numeric", 7)),
                  na.strings = "?")

## formatting Date as date
dat$Date <- as.Date(dat$Date, "%Y-%M-%D")

## restrcting data to a time interval
data <- subset(dat, dat$Date >= "2007-02-01" & dat$Date <= "2007-02-02")

## creating a date format with timestamp
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")


## setting plotting information
png(filename = "../plot4.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white",  res = NA)

## defining the plotting area to 2x2 matrix
par(mfrow= c(2,2))

## 1st plot
plot(data$datetime, data$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)", main = "")

## 2nd plot
plot(data$datetime, data$Voltage, type = "l", 
     xlab = "datetime", ylab = "Voltage", main = "")

## 3rd plot with lines and legend
plot(data$datetime, data$Sub_metering_1, type = "l", 
     xlab = "", ylab = "Energy bus metering", main = "")
lines(data$datetime,data$Sub_metering_2, type = "l", col = 2)
lines(data$datetime,data$Sub_metering_3, type = "l", col = 4)

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lwd = 1, col = c(1,2,4),bty = "n", cex=0.7)

## 4th plot
plot(data$datetime, data$Global_reactive_power, type = "l", 
     xlab = "datetime", ylab = "Global_reactive_power", main = "")

## end of device command
dev.off()
