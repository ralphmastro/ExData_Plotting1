## This file creates the plots for Week 1 Quiz

setwd('/Users/ralphmastromonaco/Documents/Coursera/DataScience/exploring/')

data <- read.table(file = 'household_power_consumption copy.txt', sep = ";",
                   stringsAsFactors = FALSE, header = TRUE )

data <- data[data$Date == "1/2/2007" | data$Date == '2/2/2007',]

setwd('/Users/ralphmastromonaco/Documents/Coursera/DataScience/exploring/ExData_plotting1/')

# Fix the time/date variables
data$datetime <- paste(data$Date, data$Time, sep = ' ')
data$datetime <- strptime(data$datetime, format = "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#Filter on the two days that are relevant


# destring the numeric variables

data$Global_active_power <- as.numeric(data$Global_active_power)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)


# Plot 1
#par(mfrow = c(1,1))
hist(data$Global_active_power,
     col = 'red',
     xlab = 'Global Active Power (Kilowatts)',
     ylab = 'Frequency',
     main = 'Global Active Power',
     axes = TRUE)
axis(1,c(0,2,4,6))
axis(2,seq(0, by = 200, len= 6))
dev.copy(png, file = 'plot1.png')
dev.off()

# Plot 2
#par(mfrow = c(1,1))
with(data, plot(x = datetime, y = Global_active_power, type = 'l',
                ylab = 'Global Active Power (Kilowatts)'))
dev.copy(png, file = 'plot2.png')
dev.off()

# Plot 3
#par(mfrow = c(1,1))
png(file = 'plot3.png')
plot(x = data$datetime, y = data$Sub_metering_1, type = 'l',
     ylab = 'Energy Sub Metering',
     xlab = '')
lines(x = data$datetime, y = data$Sub_metering_2, col = 'red')
lines(x = data$datetime, y = data$Sub_metering_3, col = 'blue')
legend('topright', legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       lty = 1,
       col = c('black','red','blue'),
       xjust = 1,
       cex = 0.7)
dev.off()


# Plot 4

png(file = 'plot4.png')
par(mfrow = c(2,2))
with(data,{
    plot(x = datetime, y = Global_active_power, type = 'l',
         ylab = 'Global Active Power (Kilowatts)')   
    plot(x = datetime, y = Voltage, type = 'l')
    plot(x = datetime, y = Sub_metering_1, type = 'l',
         ylab = 'Energy Sub Metering',
         xlab = '')
    lines(x = datetime, y = Sub_metering_2, col = 'red')
    lines(x = datetime, y = Sub_metering_3, col = 'blue')
    legend('topright', legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
           lty = 1,
           col = c('black','red','blue'))
    plot(x = datetime, y = Global_reactive_power, type = 'l',
         ylab = 'Global Reactive Power')
    
}
     )

dev.off()






