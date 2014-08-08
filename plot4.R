##Read clean and subset the input data the input data
indata_raw<-read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)
indata_raw[indata_raw=="?"]=NA
indata_clean<-na.omit(indata_raw)
indata_clean_subset<-indata_clean[indata_clean$Date %in% c("1/2/2007","2/2/2007"),]

##PLOT 4
png(file = "plot4.png",width = 480, height = 480, bg = "transparent")
par(mfrow = c(2, 2))
plot(as.POSIXct(paste(indata_clean_subset$Date,indata_clean_subset$Time), format = "%d/%m/%Y %H:%M:%S"),as.numeric(indata_clean_subset$Global_active_power),type="l",xlab="",ylab="Global Active Power (kilowatts)")
##box(which = "figure")
plot(as.POSIXct(paste(indata_clean_subset$Date,indata_clean_subset$Time), format = "%d/%m/%Y %H:%M:%S"),as.numeric(indata_clean_subset$Voltage),type="l",xlab="datetime",ylab="Voltage")
plot(as.POSIXct(paste(indata_clean_subset$Date,indata_clean_subset$Time), format = "%d/%m/%Y %H:%M:%S"),as.numeric(indata_clean_subset$Sub_metering_1),type="l",xlab="",ylab="Global Active Power (kilowatts)")
lines(as.POSIXct(paste(indata_clean_subset$Date,indata_clean_subset$Time), format = "%d/%m/%Y %H:%M:%S"),as.numeric(indata_clean_subset$Sub_metering_2),col="red")
lines(as.POSIXct(paste(indata_clean_subset$Date,indata_clean_subset$Time), format = "%d/%m/%Y %H:%M:%S"),as.numeric(indata_clean_subset$Sub_metering_3),col="blue")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3") , lty=1, col=c('black', 'red', 'blue'), bty='y', cex=.75)
plot(as.POSIXct(paste(indata_clean_subset$Date,indata_clean_subset$Time), format = "%d/%m/%Y %H:%M:%S"),as.numeric(indata_clean_subset$Global_reactive_power),type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()