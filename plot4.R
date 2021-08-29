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
png("plot4.png", width = 480, height = 480)
# Opens png device
par(mfrow=c(2,2))
# splits device into 2 columns and 2 rows
plot(PowerDT[, dateTime], PowerDT[, Global_active_power], type="l", xlab="", ylab="Global Active Power")
# Makes plot 1
plot(PowerDT[, dateTime], PowerDT[, Voltage], type = "l", xlab = "dateTime", ylab = "Voltage")
# Makes plot 2
plot(PowerDT[, dateTime], PowerDT[, Sub_metering_1], type = "l", xlab = "", ylab = "Energy sub metering")
# Makes plot 3
lines(PowerDT[, dateTime], PowerDT[, Sub_metering_2], col = "red")
# Adds Sub_metering_2 to plot 3
lines(PowerDT[, dateTime], PowerDT[, Sub_metering_3], col = "blue")
# Adds Sub_metering_3 to plot 3
legend("topright", col= c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= c(1,1), bty = "n")
# Adds legend to topright of plot 3
plot(PowerDT[, dateTime], PowerDT[, Global_reactive_power], type = "l", xlab = "dateTime", ylab = "Global_reactive_power")
# Makes plot 4
dev.off()
# Turns of png device