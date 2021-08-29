library(data.table)
# Load data.table package
setwd("D:/R Course/Exploratory Data Analysis/Project1")
# Set working directory for project
PowerDT <- data.table::fread(input = "household_power_consumption.txt", na.strings = "?")
#reads household power consumption data as PowerDT and converts ? into NA
View(PowerDT) 
# Views PowerDT data
PowerDT[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")] 
# Converts Date to date class
PowerDT <- PowerDT[(Date >= "2007-02-01") &(Date <= "2007-02-02")]
# Filter data for 2007-02-01 to 2007-02-02
png("plot1.png", width = 480, height = 480) 
# Makes png of 480 width and 480 length
hist(PowerDT[, Global_active_power],main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red") 
# Makes histogram with Global Active Power on x and Frequency on y
dev.off() 
# Turns off png