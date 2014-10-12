
library(data.table)

## Read full data set
dt <- fread("household_power_consumption.txt")

## Select data with dates on 1/2/2007 and 2/2/2007 only and stores the filtered rows to dt1
dt1 <- subset (dt, Date == "1/2/2007" | Date == "2/2/2007")

## plot the histogram 
hist (as.numeric(dt1$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

## Saves plot to png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()