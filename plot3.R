#download the file
> fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
> filePath <- file.path(getwd(),"household_power_consumption.zip")
> download.file(fileUrl,filePath)

#unzip the file
> unzip(zipfile="household_power_consumption.zip")

#read the text file as table
> data <- read.table(file="household_power_consumption.txt",header=T,sep=";", na.strings="?")
> plotdata <- subset(data,asDate>="2007-02-01" & asDate<="2007-02-02")
> DateTime <- strptime(paste(plotdata$Date, plotdata$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
> FinalPlotData <- cbind(DateTime,plotdata)
#plot files
> png("plot3.png",width = 480,height = 480)
> plot(FinalPlotData$DateTime, FinalPlotData$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
> lines(FinalPlotData$DateTime, FinalPlotData$Sub_metering_2, col="red")
> lines(FinalPlotData$DateTime, FinalPlotData$Sub_metering_3, col="blue")
> legend("topright",col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty="solid")
> dev.off()
