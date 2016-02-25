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


## names(data)
# [1] "Date"                 
# [2] "Time"                 
# [3] "Global_active_power"  
# [4] "Global_reactive_power"
# [5] "Voltage"              
# [6] "Global_intensity"     
# [7] "Sub_metering_1"       
# [8] "Sub_metering_2"       
# [9] "Sub_metering_3"       
# [10] "datetime"

str(data)
summary(data)

## setting plotting information
png(filename = "../plot2.png",
      width = 480, height = 480, units = "px", pointsize = 12,
      bg = "white",  res = NA)

## creating plot
  plot(data$datetime, data$Global_active_power, type = "l", 
       xlab = "", ylab = "Global Active Power (kilowatts)", main = "")

## end of device command
dev.off()

