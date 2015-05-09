library(plyr)
data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";")
feb_data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
feb_data <- mutate(feb_data, Global_active_power = as.numeric(as.character(Global_active_power)))

#Plot 1
png(filename = "plot1.png")
hist(feb_data$Global_active_power, col="red", main = "Global Active Power" , xlab = "Global Active Power (kilowatts)")
dev.off()