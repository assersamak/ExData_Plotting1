library(plyr)
data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";")
feb_data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
feb_data <- mutate(feb_data, DateTime =  strptime(paste(Date, Time),format= "%d/%m/%Y %H:%M:%S"))
feb_data <- mutate(feb_data, Global_active_power = as.numeric(as.character(Global_active_power)))
feb_data <- mutate(feb_data, Global_reactive_power = as.numeric(as.character(Global_reactive_power)))
feb_data <- mutate(feb_data, Voltage = as.numeric(as.character(Voltage)))
feb_data <- mutate(feb_data, Sub_metering_1 = as.numeric(as.character(Sub_metering_1)))
feb_data <- mutate(feb_data, Sub_metering_2 = as.numeric(as.character(Sub_metering_2)))
feb_data <- mutate(feb_data, Sub_metering_3 = as.numeric(as.character(Sub_metering_3)))

#Plot 4
png(filename = "plot4.png")
par(mfrow=c(2,2))
#Plot 4:1
plot(x=feb_data$DateTime, y=feb_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
#Plot 4:2
plot(x=feb_data$DateTime, y=feb_data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
#Plot 4:3
plot(x=feb_data$DateTime, y=feb_data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(x=feb_data$DateTime, y=feb_data$Sub_metering_2, type = "l", col="red")
lines(x=feb_data$DateTime, y=feb_data$Sub_metering_3, type = "l", col="blue")
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"),bty = "n")
#plot 4:4
plot(x=feb_data$DateTime, y=feb_data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()