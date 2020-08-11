# load data

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02", ]

#file name

png(filename = "plot2.png",
    width = 480, height = 480, units = "px")

#plot chart

with(data, plot(Global_active_power, type = "l", axes = FALSE, xlab = "", ylab = "Global_active_power (kilowatts)"))
axis(side = 1, at = c(1, 1500, 2900), labels = c("Thu","Fri","Sat"))
axis(side = 2, at = c(0,2,4,6))
box()

#save file

dev.off()
