library(dplyr)
library(lubridate)
data <- read.table(file = 'power_consumption_data/household_power_consumption.txt', sep= ";", skip = 1, na.strings = "?",
                   col.names = c("Date", "Time", "Global_active-power", "Global_reactive-power", "Voltage", "Global_intensity","Submetering_1", "Submetering_2", "Submetering_3"),
                   colClasses = c("character", "character", "numeric", "numeric","numeric", "numeric", "numeric", "numeric", "numeric"))
data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)

data1<- data %>% filter(between(Date,as.Date('2007-2-1'), as.Date('2007-2-2')))
png(filename = 'plot1.png')

hist(data1$Global_active.power, col= "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
