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
png("plot3.png",width = 480, height = 480)
## Create the plot, start with empty plot.
plot(powerConsumption$Time,powerConsumption$Sub_metering_1, type = 'n', xlab = "", ylab = "Energy sub metering")
## Add lines one by one
lines(powerConsumption$Time, powerConsumption$Sub_metering_1, col = "black")
lines(powerConsumption$Time, powerConsumption$Sub_metering_2, col = "red")
lines(powerConsumption$Time, powerConsumption$Sub_metering_3, col = "blue")
## Add legend based on colnames
legend("topright", legend = names(powerConsumption[,7:9]), lty = 1, col = c("black","blue","red"))

## Close graphics device
dev.off()