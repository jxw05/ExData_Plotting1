File1 <- read.table("household_power_consumption.txt",header = TRUE, stringsAsFactors = TRUE, 
                    sep = ";", fill=TRUE, col.names = c("Date","Time","Global_active_power","Global_reactive_power",
                                                        "Voltage", "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                    skip=grep("1/2/2007", readLines("household_power_consumption.txt" )), nrows=2880)


Date <- File1$Date ##subset date
Time <- File1$Time ##subset time
Datetime <- paste(Date,Time) ##merge datatime
Merge <- strptime(Datetime, format = "%d/%m/%Y %H:%M:%S") ##change class to "Date" & "Time".  Date and Time had to be merged and formatted to the right class in order for the times series line graph to print correctly
plot(Merge, File1$Sub_metering_1, type = "l", ylab = "Energy sub Meeting", xlab = "")
lines(Merge, File1$Sub_metering_2, type="l", col = "red")
lines(Merge, File1$Sub_metering_3, type="l", col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       pch = "_", col = c("black", "red", "blue"))
png("plot3.png", width = 480, height = 480)
plot(Merge, File1$Sub_metering_1, type = "l", ylab = "Energy sub Metering", xlab = "")
lines(Merge, File1$Sub_metering_2, type="l", col = "red")
lines(Merge, File1$Sub_metering_3, type="l", col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       pch = "_", col = c("black", "red", "blue"))
dev.off()