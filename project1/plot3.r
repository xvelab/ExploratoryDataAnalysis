#Read data from source file: household_power_consumption.txt
setwd("G:/Xavier/Estudios/Online/Data Science/4 Exploratory Data Analysis/working directory XV/project")
epc<-read.table("household_power_consumption.txt",sep=";",na.strings="?", header=TRUE)

#Create a column "DateTime" for dates in format POSIXlt
epc$DateTime<-strptime(paste(epc$Date,epc$Time), "%d/%m/%Y %H:%M:%S")

#Subset DateTime between days 2007-02-01 and 2007-02-02
fromdate<-as.POSIXlt("2007-02-01")
todate<-as.POSIXlt("2007-02-03")
epc2<-epc[epc$DateTime>=fromdate & epc$DateTime<todate,]
rm(epc)

#Draw and save to png
plot(epc2$DateTime, epc2$Sub_metering_1,type="l",ylab="Energy sub metering", xlab="")
lines(epc2$DateTime, epc2$Sub_metering_2,type="l",col='Red')
lines(epc2$DateTime, epc2$Sub_metering_3,type="l",col='Blue')
legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2,bty="n",cex=0.7,text.width=50000)
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
 