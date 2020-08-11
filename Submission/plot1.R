# load data

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02", ]

#file name

png(filename = "plot1.png",
    width = 480, height = 480, units = "px")

#plot the bar chart

data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", 
     col = "red", main = "Global Active Power")

#save the file

dev.off()
