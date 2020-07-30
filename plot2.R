setwd('C:/Users/Roger Xia/Desktop/Coursera Exploratory Data Analysis')

data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F,
                 stringsAsFactors=F, comment.char="", quote='\"')

subdata <- subset(data, Date %in% c('1/2/2007', '2/2/2007'))
subdata$Date <- as.Date(subdata$Date, format='%d/%m/%Y')

datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)

with(subdata, {
  plot(Global_active_power~Datetime, type='l',
       ylab='Global Active Power (kilowatts)', xlab='')
})

png('plot1.png', width=480, height=480)
dev.off()