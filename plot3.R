##Read clean and subset the input data the input data
indata_raw<-read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)
indata_raw[indata_raw=="?"]=NA
indata_clean<-na.omit(indata_raw)
indata_clean_subset<-indata_clean[indata_clean$Date %in% c("1/2/2007","2/2/2007"),]

##Plot 3
png(file = "plot3.png",width = 480, height = 480, bg = "transparent")
plot(as.POSIXct(paste(indata_clean_subset$Date,indata_clean_subset$Time), format = "%d/%m/%Y %H:%M:%S"),as.numeric(indata_clean_subset$Sub_metering_1),type="l",xlab="",ylab="Energy sub metering")
lines(as.POSIXct(paste(indata_clean_subset$Date,indata_clean_subset$Time), format = "%d/%m/%Y %H:%M:%S"),as.numeric(indata_clean_subset$Sub_metering_2),col="red")
lines(as.POSIXct(paste(indata_clean_subset$Date,indata_clean_subset$Time), format = "%d/%m/%Y %H:%M:%S"),as.numeric(indata_clean_subset$Sub_metering_3),col="blue")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3") , lty=1, col=c('black', 'red', 'blue'), bty='y', cex=.75)
dev.off()
