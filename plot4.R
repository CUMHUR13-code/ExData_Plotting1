setwd("C:/Users/Lenovo/Desktop/Coursera_Project1")

## Reading Data

ckdata <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                   nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
##Subset Data
Subsetdata <- ckdata[ckdata$Date %in% c("1/2/2007","2/2/2007"), ]

Date2 <- strptime(paste(Subsetdata$Date, Subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

Subsetdata$Date <- as.Date(Subsetdata$Date, format="%d/%m/%Y")
Subsetdata$Time <- format(Subsetdata$Time, format="%H:%M:%S")
Subsetdata$Global_active_power <- as.numeric(Subsetdata$Global_active_power)
Subsetdata$Global_reactive_power <- as.numeric(Subsetdata$Global_reactive_power)
Subsetdata$Voltage <- as.numeric(Subsetdata$Voltage)
Subsetdata$Global_intensity <- as.numeric(Subsetdata$Global_intensity)

Subsetdata$Sub_metering_1 <- as.numeric(Subsetdata$Sub_metering_1)
Subsetdata$Sub_metering_2 <- as.numeric(Subsetdata$Sub_metering_2)
Subsetdata$Sub_metering_3 <- as.numeric(Subsetdata$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

plot(Date2, Subsetdata$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(Date2, Subsetdata$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(Date2, Subsetdata$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(Date2, Subsetdata$Sub_metering_2, type="l", col="red")
lines(Date2, Subsetdata$Sub_metering_3, type="l", col="red")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2.5, bty="n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(Date2, Subsetdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
