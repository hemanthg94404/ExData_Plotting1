## Class 4 : Exploratory Data Analysis
## Hemanth G - 5/7/16
## Plot 3
subjectexplore1 <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", nrows=2075259,check.names=FALSE,
                    stringsAsFactors = FALSE, comment.char="",na.strings = "?")
subjectexplore1$Date <- as.Date(subjectexplore1$Date, format = "%d/%m/%Y")
#Filter for Feb 2 days
#
FebFilter <- subset(subjectexplore1, subset=(Date >= "2007/02/01" & Date <= "2007/02/02"))
rm(subjectexplore1)
# Format for Date/ time
datetime <- paste(as.Date(FebFilter$Date), FebFilter$Time)
FebFilter$Datetime <- as.POSIXct(datetime)

##plot the graph
#
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
#First box

plot(FebFilter$Global_active_power~FebFilter$Datetime, ylab = "Global Active Power", xlab = "", type ="l")

#Second box
plot(FebFilter$Voltage~FebFilter$Datetime, ylab = "Voltage", xlab = "datetime", type ="l")

#Third box
plot(FebFilter$Sub_metering_1~FebFilter$Datetime, ylab = "Energy SubMetering", xlab = "", type ="l")
lines(FebFilter$Sub_metering_2~FebFilter$Datetime, col = "Red")
lines(FebFilter$Sub_metering_3~FebFilter$Datetime, col = "Blue")
legend("topright",legend = c("Sub_metering_1  ", "Sub_Metering_2  ", "Sub_Metering_3  "), col = c("Black", "Red", "Blue"), lty = 1, lwd = 2, cex = 0.7)

#Fourth box
plot(FebFilter$Global_reactive_power~FebFilter$Datetime, ylab = "Global Reactive Power", xlab = "datetime", type ="l")

#Print png/ PDF graph
dev.copy(png, file="plot4.png", width = 480,height = 480)

dev.off()
 