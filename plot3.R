hwdata<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", as.is=TRUE)
hwback<-hwdata
hwdata$Date<-as.Date(hwdata$Date, format = "%d/%m/%Y")
hwrange<-subset(hwdata, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

 hwrange$dtime<-as.POSIXct(paste(hwrange$Date, hwrange$Time), format="%Y-%m-%d %H:%M:%S")

old.par <- par(mar = c(0, 0, 0, 0))
.pardefault<-par(no.readonly=T)


png("plot3.png", width=480, height=480, units="px")
plot(hwrange$dtime, hwrange$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
lines(hwrange$dtime, hwrange$Sub_metering_1, col="black")
lines(hwrange$dtime, hwrange$Sub_metering_2, col="red")
lines(hwrange$dtime, hwrange$Sub_metering_3, col="blue")
legend(x="topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red","blue"), lwd=1, lty=c(1,1,1), merge=FALSE, xjust=2, yjust=0)

dev.off()



save(hwrange, file="hwdata.Rda")
write.table(hwrange, file="hwdata.txt", sep=",")
