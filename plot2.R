hwdata<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", as.is=TRUE)
hwback<-hwdata
hwdata$Date<-as.Date(hwdata$Date, format = "%d/%m/%Y")
hwrange<-subset(hwdata, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

 hwrange$dtime<-as.POSIXct(paste(hwrange$Date, hwrange$Time), format="%Y-%m-%d %H:%M:%S")

png("plot2.png", width=480, height=480, units="px")

plot(hwrange$dtime, hwrange$Global_active_power, type="n", ylab="Global Average Power (kilowatts)", xlab="")

lines(hwrange$dtime,hwrange$Global_active_power)


dev.off()



save(hwrange, file="hwdata.Rda")
write.table(hwrange, file="hwdata.txt", sep=",")