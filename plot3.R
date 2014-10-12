library(data.table)

## Read full data set
dt <- fread("household_power_consumption.txt")

## Select data with dates on 1/2/2007 and 2/2/2007 only and stores the filtered rows to dt1
dt1 <- subset (dt, Date == "1/2/2007" | Date == "2/2/2007")


## Converting dates
dt1$Date <- as.Date(dt1$Date, format="%d/%m/%Y")
dt1$Date_time <- as.POSIXct(paste(as.Date(dt1$Date), dt1$Time))
 

## constructing the plot
plot(dt1$Sub_metering_1~dt1$Date_time, type="l", ylab="Energy sub metering", xlab="")
lines(dt1$Sub_metering_2~dt1$Date_time,col="red")
lines(dt1$Sub_metering_3~dt1$Date_time,col="blue")
legend("topright",
	c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
	lwd=1, 
	col=c("black", "red", "blue"),
	y.intersp = 0.7 )


## Saves plot to png file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()