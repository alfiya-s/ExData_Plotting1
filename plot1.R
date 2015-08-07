arch <- unz('exdata-data-household_power_consumption.zip', 
            'household_power_consumption.txt')
househ.data <- read.table(arch, sep = ";", header = TRUE, na.strings = "?")
png("Rplot1.png", 480, 480)
hist(househ.subset$Global_active_power, 
     xlab = "Global Active Power (kilowatts)", 
     col = "red",
     main = "Global Active Power")
dev.off()