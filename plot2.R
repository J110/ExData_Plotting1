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
png(file = 'plot2.png')


## Create required histogram with Time vs Global active power variable without plotting actual points
with(Power_Data, plot(Time, Global_active_power, type = 'n', xlab = '', ylab = 'Global Active Power (kilowatts)'))


## Creating lines for plot above
with(Power_Data, lines(Time, Global_active_power))


## Switch device off
dev.off()



