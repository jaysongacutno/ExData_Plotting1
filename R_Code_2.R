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

> plot(hpc$Global_active_power~hpc$DT, type="l", ylab="Global Active Power (kilowatts)", xlab="")

> dev.copy(png,"plot2.png", width=480, height=480)
> dev.off()
