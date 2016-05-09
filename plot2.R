## Class 4 : Exploratory Data Analysis
## Hemanth G - 5/7/16
## Plot 2
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
plot(FebFilter$Global_active_power~FebFilter$Datetime, ylab = "Global Active Power(KiloWatts)", xlab = "", type ="l")

dev.copy(png, file="plot2.png", width = 480,height = 480)

dev.off()
 