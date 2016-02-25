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
png(filename = "../plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white",  res = NA)

## creating plot with additional lines and a legend
plot(data$datetime, data$Sub_metering_1, type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)", main = "")
lines(data$datetime,data$Sub_metering_2, type = "l", col = 2)
lines(data$datetime,data$Sub_metering_3, type = "l", col = 4)

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lwd = 1, col = c(1,2,4), cex=0.7)

dev.off()

