File1 <- read.table("household_power_consumption.txt",header = TRUE, stringsAsFactors = TRUE, 
  sep = ";", fill=TRUE, col.names = c("Date","Time","Global_active_power","Global_reactive_power",
        "Voltage", "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
          skip=grep("1/2/2007", readLines("household_power_consumption.txt" )), nrows=2880)

##File1$Date <- as.Date(File1$Date, format = "%d/%m/%Y")
##Time <-strptime(File1$Time, format = "%H:%M:%S")
##Date1<- as.POSIXct(File1$Date)
##Date3<-strptime(File1$Date, format = "%d/%m/%Y","%H:%M:%S")
##with(File1, plot(Date,Global_active_power, type = "l")) 
##The above code are all failed attempts 

Date <- File1$Date ##subset date
Time <- File1$Time ##subset time
Datetime <- paste(Date,Time) ##merge datatime
Merge <- strptime(Datetime, format = "%d/%m/%Y %H:%M:%S") ##change class to "Date" & "Time".  Date and Time had to be merged and formatted to the right class in order for the times series line graph to print correctly
plot(Merge,File1$Global_active_power, type = "l")
png("plot2.png", width = 480, height = 480)
plot(Merge,File1$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)") 
dev.off()
