arch <- unz('exdata-data-household_power_consumption.zip', 
            'household_power_consumption.txt')
househ.data <- read.table(arch, sep = ";", header = TRUE, na.strings = "?")
close(arch)
head(househ.data$Date)
househ.data$Date <- as.Date(househ.data$Date, "%d/%m/%Y")
househ.subset <- househ.data[househ.data$Date <= as.Date("2007-02-02") & 
                                     househ.data$Date >= as.Date("2007-02-01"), ]


househ.subset$dttime <- strptime(paste(househ.subset$Date, 
                                       househ.subset$Time), "%Y-%m-%d %H:%M:%S") 
plot(dd$Year[dd$School_ID=="A"], dd$Value[dd$School_ID=="A"], type="b",
     xlim=range(dd$Year), ylim=range(dd$Value))

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
legend("topright", lty =1, names(househ.data)[7:9], col = c(1, 2, 4))