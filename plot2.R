library(plyr)
data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";")
feb_data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
feb_data <- mutate(feb_data, DateTime =  strptime(paste(Date, Time),format= "%d/%m/%Y %H:%M:%S"))
feb_data <- mutate(feb_data, Global_active_power = as.numeric(as.character(Global_active_power)))
#Plot 2
png(filename = "plot2.png")
plot(x=feb_data$DateTime, y=feb_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()