library(data.table)
# Load data.table package
setwd("D:/R Course/Exploratory Data Analysis/Project1")
# Set working directory for project
PowerDT <- data.table::fread(input = "household_power_consumption.txt", na.strings = "?")
#reads household power consumption data as PowerDT and converts ? into NA
colnames(PowerDT)
# looks up column names
PowerDT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
# Makes date graphable by time of day
PowerDT <- PowerDT[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]
#Filters for 2007-02-01 to 2007-02-02
png("plot3.png", width = 480, height = 480)
# Creates png
plot(PowerDT[, dateTime], PowerDT[, Sub_metering_1], type = "l", xlab = "", ylab = "Energy sub metering")
# Creates plot and Sub_metering_1 line in default
lines(PowerDT[, dateTime], PowerDT[, Sub_metering_2], col = "red")
# Creates Sub_metering_2 in red
lines(PowerDT[, dateTime], PowerDT[, Sub_metering_3], col = "blue")
# Creates Sub_metering_3 in blue
legend("topright", col= c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= c(1,1), lwd= c(1,1))
# Creates legend in top right of plot with sub_meterings 
dev.off()
# Turns of png