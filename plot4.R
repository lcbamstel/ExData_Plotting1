library(dplyr)
library(lubridate)

## Read the data
powerConsumption <- read.table("household_power_consumption.txt", na.strings = "?", sep = ";", header = TRUE)
## Change the date column to a "Date" class for subsetting
powerConsumption <- mutate(powerConsumption, Date = dmy(Date))
## Subset the dates as per assignment
powerConsumption <- filter(powerConsumption, Date == ymd("2007-02-01") | Date == ymd("2007-02-02"))
powerConsumption <- mutate(powerConsumption, Time = ymd_hms(paste(as.character(powerConsumption$Date), powerConsumption$Time, sep = " ")))

## Open 'png' graphics device with size 480x480
png("plot4.png",width = 480, height = 480)

par(mfrow = c(2,2), mar = c(4,4,4,1))
plot(powerConsumption$Time,powerConsumption$Global_active_power, type = 'l', ylab = "Global Active Power", xlab = "")
plot(powerConsumption$Time, powerConsumption$Voltage, type = 'l', ylab = "Voltage", xlab = "datetime")

## Add plot 3
## Create the plot, start with empty plot.
plot(powerConsumption$Time,powerConsumption$Sub_metering_1, type = 'n', xlab = "", ylab = "Energy sub metering")
## Add lines one by one
lines(powerConsumption$Time, powerConsumption$Sub_metering_1, col = "black")
lines(powerConsumption$Time, powerConsumption$Sub_metering_2, col = "red")
lines(powerConsumption$Time, powerConsumption$Sub_metering_3, col = "blue")
## Add legend based on colnames
legend("topright", legend = names(powerConsumption[,7:9]), lty = 1, col = c("black","blue","red"),bty = 'n')


## Add plot 4
with(powerConsumption,plot(Time, Global_reactive_power, type = 'l', xlab = "datetime"))

## Close graphics device
dev.off()