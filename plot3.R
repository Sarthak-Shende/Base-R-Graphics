library(dplyr)
library(lubridate)
data <- read.table(file = 'power_consumption_data/household_power_consumption.txt', sep= ";", skip = 1, na.strings = "?",
                   col.names = c("Date", "Time", "Global_active-power", "Global_reactive-power", "Voltage", "Global_intensity","Submetering_1", "Submetering_2", "Submetering_3"),
                   colClasses = c("character", "character", "numeric", "numeric","numeric", "numeric", "numeric", "numeric", "numeric"))
data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)

data1<- data %>% filter(between(Date,as.Date('2007-2-1'), as.Date('2007-2-2')))
png(filename = 'plot3.png')
barplot(data1$Submetering_1, ylab = "Energy sub metering",col= "white",border = "grey")
lines(data1$Submetering_2, col= "red", border ="red")
lines(data1$Submetering_3, col= "blue", border ="blue")
legend("topright", legend= c("Submetering_1","Submetering_2","Submetering_3"), col = c("grey", "red", "blue"), lwd = 1)
dev.off()