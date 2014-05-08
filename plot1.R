hwdata<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", as.is=TRUE)
hwback<-hwdata
hwdata$Date<-as.Date(hwdata$Date, format = "%d/%m/%Y")
hwrange<-subset(hwdata, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))


png("plot1.png", width=480, height=480, units="px")

hist(hwrange$Global_active_power, breaks=12, col="red", xlab = "Global Active Power (kilowatts)", main="Global Active Power")

dev.off()



save(hwrange, file="hwdata.Rda")
write.table(hwrange, file="hwdata.txt", sep=",")