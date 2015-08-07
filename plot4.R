arch <- unz('exdata-data-household_power_consumption.zip', 
            'household_power_consumption.txt')
househ.data <- read.table(arch, sep = ";", header = TRUE, na.strings = "?")
househ.data$Date <- as.Date(househ.data$Date, "%d/%m/%Y")
househ.subset <- househ.data[househ.data$Date <= as.Date("2007-02-02") & 
                                     househ.data$Date >= as.Date("2007-02-01"), ]
househ.subset$dttime <- strptime(paste(househ.subset$Date, 
                                       househ.subset$Time), "%Y-%m-%d %H:%M:%S") 

png(filename = "Rplot4.png", width = 480, height = 480)
par(mfcol = c(2,2))
par(mar = c(4,4,2,2))
plot(househ.subset$dttime, 
     househ.subset$Global_active_power, 
     type = "l",
     ylab = "Global Active Power",
     xlab = "") 
plot(househ.subset$dttime, 
     househ.subset$Sub_metering_1,
     type = "l",
     xlab = "", 
     ylab = "Energy sub metering",
     ylim=range(househ.subset$Sub_metering_1, 
                househ.subset$Sub_metering_2, 
                househ.subset$Sub_metering_3)) 
lines(househ.subset$dttime, househ.subset$Sub_metering_2, col = 2, type = "l")
lines(househ.subset$dttime, househ.subset$Sub_metering_3, col = 4, type = "l")
legend("topright", lty =1, names(househ.data)[7:9], col = c(1, 2, 4), bty = "n")
plot(househ.subset$dttime, 
     househ.subset$Voltage, 
     type = "l",
     ylab = "Voltage",
     xlab = "datetime") 
plot(househ.subset$dttime, 
     househ.subset$Global_reactive_power, 
     type = "l",
     ylab = "Global_reactive_power",
     xlab = "datetime") 
dev.off()