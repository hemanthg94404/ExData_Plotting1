#library(dplyr)
## Class 4 : Exploratory Data Analysis
## Hemanth G - 5/7/16
##
subjectexplore1 <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", nrows=2075259,check.names=FALSE,
                    stringsAsFactors = FALSE, comment.char="",na.strings = "?")
subjectexplore1$Date <- as.Date(subjectexplore1$Date, format = "%d/%m/%Y")
#Filter only for 2 days in February
#
FebFilter <- subset(subjectexplore1, subset=(Date >= "2007/02/01" & Date <= "2007/02/02"))
rm(subjectexplore1)
#
##plot the graph
#
hist(FebFilter$Global_active_power, main = "Global Active Power", xlab = "Global Active Power(KiloWatts)", ylab="Frequency", col = "Red")

dev.copy(png, file="plot1.png", width = 480,height = 480)

dev.off()
 