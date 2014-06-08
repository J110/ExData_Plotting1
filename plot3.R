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
png(file = 'plot3.png')


## Create required line graph with Time vs sub_metering_1 variable without plotting actual points
with(Power_Data, plot(Time, Sub_metering_1, type = 'n', xlab = '', ylab = 'Energy sub metering'))


## Creating lines for plot above for sub_metering_1 in black
with(Power_Data, lines(Time, Sub_metering_1))

## Creating lines for plot above for sub_metering_2 in red
with(Power_Data, lines(Time, Sub_metering_2, col = 'red'))

## Creating lines for plot above for sub_metering_1 in blue
with(Power_Data, lines(Time, Sub_metering_3, col = 'blue'))


## Add appropriate legends to the graph
legend("topright", col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty = c(1,1,1))

## Switch device off
dev.off()



