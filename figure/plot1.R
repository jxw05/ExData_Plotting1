## dd/mm/yyyy - only need dates 01/02/2007 & 02/02/2007
## 60 min in 1 hr, 24 hours in a day, 24 * 60 = 1440 min in a day - 1440 *2 = 2880 - 2= 2878
##File1 <- read.table("household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep = ";", skip=grep("1/2/2007", readLines("household_power_consumption.txt" )), nrows=1440)
##File <- read.csv("household_power_consumption.csv", header = TRUE, sep=";",skip=grep("1/2/2007", readLines("household_power_consumption.csv" )), nrows=1440)
File1 <- read.table("household_power_consumption.txt",header = TRUE, stringsAsFactors = TRUE, 
         sep = ";", fill=TRUE, col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage", 
         "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),skip=grep("1/2/2007", 
          readLines("household_power_consumption.txt" )), nrows=2880)
hist(File1$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab="Frequency")
png("plot1.png", width = 480, height = 480)
hist(File1$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab="Frequency")
dev.off()