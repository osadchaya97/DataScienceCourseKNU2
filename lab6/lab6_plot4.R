data = read.table("lab6.txt", sep = ";", header = T)
data[,"Date"] = as.Date(data[,"Date"], format = "%d/%m/%Y")
data = data[(data[,"Date"] <= as.Date("2007-02-02")) & (data[,"Date"] >= as.Date("2007-02-01")), ]

colnames(data)[3] ="GAP"
data$datetime = paste(data$Date, data$Time)
data$datetime = as.POSIXct(data$datetime, format = "%Y-%M-%d %H:%M:%S")
data <- data[order(data$datetime),]

attach(mtcars)
par(mfrow=c(2,2))

# Graph 1
plot(data$datetime, data$GAP, type = "l", xlab = "datetime", ylab = "Global active power")
# Graph 2
plot(data$datetime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
# Graph 3
plot(data$datetime, data$Sub_metering_1, type = "l", xlab = "datetime", ylab = "Energy sub metering")
lines(data$datetime, data$Sub_metering_2, type = "l", col = "red",
      xlab = "weekday", ylab = "Energy sub metering",)
lines(data$datetime, data$Sub_metering_3, type = "l", col = "blue",
      xlab = "weekday", ylab = "Energy sub metering")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1)
# Graph 4
plot(data$datetime, data$Global_reactive_power, type = "l", 
     xlab = "datetime", ylab = "Global reactive power")