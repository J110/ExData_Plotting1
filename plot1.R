## Pull data from Electric Power Consumption data from UCI website

EA1 <- read.table('/tmp/household_power_consumption.txt', header = TRUE, sep = ';', na.strings = c('','?', 'NA')) ## Replace missing values in ? with NA


## Change date format
EA1$Date <- as.Date(EA1$Date, format = '%d/%m/%Y')


## Create a subset of data needed for exercise
Power_Data <- subset(EA1, Date >= '2007-02-01' & Date <= '2007-02-02')


## Open png device in R
png(file = 'plot1.png')


## Create required histogram
hist(Power_Data$Global_active_power, main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)', col = 'orangered')


## Switch device off
dev.off()
