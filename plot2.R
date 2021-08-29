library(data.table)
# Load data.table package
setwd("D:/R Course/Exploratory Data Analysis/Project1")
# Set working directory for project
download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "power")
unzip("power")
# Download and unzip files
PowerDT <- data.table::fread(input = "./household_power_consumption.txt", na.strings = "?")
#reads household power consumption data as PowerDT and converts ? into NA
PowerDT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
# Make date capable of being graphed by time of day
PowerDT <- PowerDT[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]
# Filter data between 2007-02-01 to 2007-02-02
png("plot2.png", width=480, height=480)
# Opens png
plot(x = PowerDT[, dateTime], y = PowerDT[, Global_active_power], type="l", xlab="", ylab="Global Active Power (kilowatts)")
# Creates plot of Date and Time on x-axis and Global Active Power on y-axis
dev.off()
# Turns off png