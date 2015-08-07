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

plot(househ.subset$dttime, 
     househ.subset$Global_active_power, 
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "") 