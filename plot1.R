setwd("C:/Users/Lenovo/Desktop/Coursera_Project1")

## Reading Data

ckdata <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')


## Convert class 

ckdata$Date <- as.Date(ckdata$Date, format="%d/%m/%Y")
ckdata$Time <- format(ckdata$Time, format="%H:%M:%S")
ckdata$Global_active_power <- as.numeric(ckdata$Global_active_power)
ckdata$Global_reactive_power <- as.numeric(ckdata$Global_reactive_power)
ckdata$Voltage <- as.numeric(ckdata$Voltage)
ckdata$Global_intensity <- as.numeric(ckdata$Global_intensity)
ckdata$Sub_metering_1 <- as.numeric(ckdata$Sub_metering_1)
ckdata$Sub_metering_2 <- as.numeric(ckdata$Sub_metering_2)
ckdata$Sub_metering_3 <- as.numeric(ckdata$Sub_metering_3)

##Subset Data

Subsetdata <- ckdata[ckdata$Date %in% c("1/2/2007","2/2/2007") ,]
png("plot1.png", width=480, height=480)
hist(ckdata$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power" )
dev.off()
