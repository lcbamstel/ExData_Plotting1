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
png("plot2.png",width = 480, height = 480)
## Create plot2
plot(powerConsumption$Time,powerConsumption$Global_active_power, type = 'l', ylab = "Global Active Power (kilowatts)", xlab = "")
## Close graphics device
dev.off()