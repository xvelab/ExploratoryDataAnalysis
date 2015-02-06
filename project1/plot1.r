#Read data from source file: household_power_consumption.txt
setwd("G:/Xavier/Estudios/Online/Data Science/4 Exploratory Data Analysis/working directory XV/project")
epc<-read.table("household_power_consumption.txt",sep=";",na.strings="?", header=TRUE)

#Create a column "DateTime" for dates in format POSIXlt
epc$DateTime<-strptime(paste(epc$Date,epc$Time), "%d/%m/%Y %H:%M:%S")

#Subset DateTime between days 2007-02-01 and 2007-02-02
fromdate<-as.POSIXlt("2007-02-01")
todate<-as.POSIXlt("2007-02-03")
epc2<-epc[epc$DateTime>=fromdate & epc$DateTime<todate,]

#Draw the histogram, format it, and save it to working directory
hist(epc2$Global_active_power,main = "Global Active Power",col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()