setwd("C:/Users/Lenovo/Desktop/Coursera_Project1")

## Reading Data

ckdata <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                   nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
##Subset Data
Subsetdata <- ckdata[ckdata$Date %in% c("1/2/2007","2/2/2007"), ]

Date2 <- strptime(paste(Subsetdata$Date, Subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

Subsetdata$Sub_metering_1 <- as.numeric(Subsetdata$Sub_metering_1)
Subsetdata$Sub_metering_2 <- as.numeric(Subsetdata$Sub_metering_2)
Subsetdata$Sub_metering_3 <- as.numeric(Subsetdata$Sub_metering_3)
png("plot3.png", width=480, height=480)

plot(Date2, Subsetdata$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(Date2, Subsetdata$Sub_metering_2, type="l", col="red")
lines(Date2, Subsetdata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

