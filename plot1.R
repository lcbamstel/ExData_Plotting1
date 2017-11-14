library(dplyr)
library(lubridate)

## Read the data
powerConsumption <- read.table("household_power_consumption.txt", na.strings = "?", sep = ";", header = TRUE)
## Change the date column to a "Date" class for subsetting
powerConsumption <- mutate(powerConsumption, Date = dmy(Date))
## Subset the dates as per assignment
powerConsumption <- filter(powerConsumption, Date == ymd("2007-02-01") | Date == ymd("2007-02-02"))


## Open 'png' graphics device with size 480x480
png("plot1.png",width = 480, height = 480)
## Create plot1
hist(powerConsumption$Global_active_power, col = "red", breaks = 12, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
## Turn of graphics device
dev.off()
