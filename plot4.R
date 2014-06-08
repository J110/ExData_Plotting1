## Pull data from Electric Power Consumption data from UCI website

EA1 <- read.table('/tmp/household_power_consumption.txt', header = TRUE, sep = ';', na.strings = c('','?', 'NA')) ## Replace missing values in ? with NA


## Change date format
EA1$Date <- as.Date(EA1$Date, format = '%d/%m/%Y')


## Create a subset of data needed for exercise
Power_Data <- subset(EA1, Date >= '2007-02-01' & Date <= '2007-02-02')

## Pasting Dates with Times
Power_Data$Time <- paste(Power_Data$Date, Power_Data$Time)


## Conversion into Time variable
Power_Data$Time <- strptime(Power_Data$Time, '%Y-%m-%d %H:%M:%S')

## Open png device in R
png(file = 'plot4.png')

## Divide device into 4 quads
par(mfrow = c(2,2))


## Create skeleton for plotting Global active power against time
with(Power_Data, plot(Time, Global_active_power, type = 'n', xlab = '', ylab = 'Global Active Power'))


## Plot lines of global active power
with(Power_Data, lines(Time, Global_active_power))


## Create skeleton for plotting Voltage against time
with(Power_Data, plot(Time, Voltage, type = 'n', xlab = 'datetime', ylab = 'Voltage'))


## Plot lines of Voltage
with(Power_Data, lines(Time, Voltage))


## Create skeleton for plotting Sub metering against time
with(Power_Data, plot(Time, Sub_metering_1, type = 'n', xlab = '', ylab = 'Energy sub metering'))


## Plot lines of Sub Metering 1 in black
with(Power_Data, lines(Time, Sub_metering_1))


## Plot lines of Sub metering 2 in red
with(Power_Data, lines(Time, Sub_metering_2, col = 'red'))


## Plot lines of Sub metering 3 in blue
with(Power_Data, lines(Time, Sub_metering_3, col = 'blue'))


## Add legends to sub metering plots
legend("topright", col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty = c(1,1,1), bty = 'n')


## Create Skeleton for Global reactive power against time
with(Power_Data, plot(Time, Global_reactive_power, type = 'n', xlab = 'datetime', ylab = 'Global_reactive_power'))


## Create lines for Global reactive power plot
with(Power_Data, lines(Time, Global_reactive_power))


## Change back the default partition for device
par(mfrow = c(1,1))


## Switch device off
dev.off()



