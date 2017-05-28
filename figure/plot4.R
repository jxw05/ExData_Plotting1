File1 <- read.table("household_power_consumption.txt",header = TRUE, stringsAsFactors = TRUE, 
                    sep = ";", fill=TRUE, col.names = c("Date","Time","Global_active_power","Global_reactive_power",
                                                        "Voltage", "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                    skip=grep("1/2/2007", readLines("household_power_consumption.txt" )), nrows=2880)


Date <- File1$Date ##subset date
Time <- File1$Time ##subset time
Datetime <- paste(Date,Time) ##merge datatime
Merge <- strptime(Datetime, format = "%d/%m/%Y %H:%M:%S") ##change class to "Date" & "Time".  Date and Time had to be merged and formatted to the right class in order for the times series line graph to print correctly
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(Merge,File1$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power") 
plot(Merge,File1$Voltage, type = "l", xlab = "datetime", ylab = "Voltage") 
plot(Merge, File1$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(Merge, File1$Sub_metering_2, type="l", col = "red")
lines(Merge, File1$Sub_metering_3, type="l", col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       pch = "_", col = c("black", "red", "blue"), bty = "n", xjust = "1")
plot(Merge,File1$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power") 
dev.off()
