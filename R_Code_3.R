> setwd("/Users/jayson/Desktop/Module4")
> hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'))
> hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
> hpc <- subset(hpc,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
> hpc <- hpc[complete.cases(hpc),]
> DT <- paste(hpc$Date, hpc$Time)
> DT <- setNames(DT, "DateTime")
> hpc <- hpc[ ,!(names(hpc) %in% c("Date","Time"))]
> hpc <- cbind(DT, hpc)
> hpc$DT <- as.POSIXct(DT)

> with(hpc, {
+     plot(Sub_metering_1~DT, type="l",
+          ylab="Energy Sub Metering", xlab="")
+     lines(Sub_metering_2~DT,col='Red')
+     lines(Sub_metering_3~DT,col='Blue')
+ })
> legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
+        c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


> dev.copy(png,"plot3.png", width=480, height=480)
> dev.off()
