##Read clean and subset the input data the input data
indata_raw<-read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)
indata_raw[indata_raw=="?"]=NA
indata_clean<-na.omit(indata_raw)
indata_clean_subset<-indata_clean[indata_clean$Date %in% c("1/2/2007","2/2/2007"),]

##PLOT 1
png(file = "plot1.png",width = 480, height = 480, bg = "transparent")
hist(as.numeric(indata_clean_subset$Global_active_power),main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.off()