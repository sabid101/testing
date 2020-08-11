# load data

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02", ]

#file name

png(filename = "plot4.png",
    width = 480, height = 480, units = "px")

#plot chart
par(mfrow = c(2, 2))

with(data, plot(Global_active_power, type = "l", axes = FALSE, xlab = "", ylab = "Global_active_power (kilowatts)"))
axis(side = 1, at = c(1, 1500, 2900), labels = c("Thu","Fri","Sat"))
axis(side = 2, at = c(0,2,4,6))
box()

data$Voltage <- as.numeric(as.character(data$Voltage))
plot(data$Voltage, type ="l", xaxt = "n", xlab = "datetime", ylab = "voltage")
axis(side = 1, at = c(1, 1500, 2900), labels = c("Thu","Fri","Sat"))

data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
plot(data$Sub_metering_1, type = "l", col = "grey", lwd = 2, axes = FALSE,
     xlab = "", ylab = "Energy sub metering")
lines(data$Sub_metering_2, col="red",lwd=2)
lines(data$Sub_metering_3, col="blue",lwd=2)

axis(side = 1, at = c(1, 1500, 2900), labels = c("Thu","Fri","Sat"))
axis(side = 2, at = c(0,10,20,30))
box()
legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       col = c ("grey", "red", "blue"), lty = 1, cex = 0.8)


data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
plot(data$Global_reactive_power, type ="l", xaxt = "n", xlab = "datetime", ylab = "Global_reactive_power")
axis(side = 1, at = c(1, 1500, 2900), labels = c("Thu","Fri","Sat"))


#save file

dev.off()

