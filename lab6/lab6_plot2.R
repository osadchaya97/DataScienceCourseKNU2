data = read.table("lab6.txt", sep = ";", header = T)
data[,"Date"] = as.Date(data[,"Date"], format = "%d/%m/%Y")
data = data[(data[,"Date"] <= as.Date("2007-02-02")) & (data[,"Date"] >= as.Date("2007-02-01")), ]

colnames(data)[3] ="GAP"
data$datetime = paste(data$Date, data$Time)  # concatenating
data$datetime = as.POSIXct(data$datetime, format = "%Y-%M-%d %H:%M:%S")  # Converting to time format
data <- data[order(data$datetime),] # Sorting by the date time for future line plotting

plot(data$datetime, data$GAP, type = "l", xlab = "weekday", ylab = "Global active power")