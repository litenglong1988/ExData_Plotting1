
# download and unzip the file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              destfile="./Electri_power_consumption.zip")
unzip("./Electri_power_consumption.zip")

# subsetting the date we need
project1<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)
project1$Date<-as.Date(project1$Date, format="%d/%m/%Y")
project1<-subset(project1,Date >= "2007-02-01" & Date <= "2007-02-02")
project1$Global_active_power<-as.numeric(project1$Global_active_power)
project1$DateTime<-as.POSIXct(paste(as.Date(project1$Date), project1$Time))
project1$Sub_metering_1<-as.numeric(project1$Sub_metering_1)
project1$Sub_metering_2<-as.numeric(project1$Sub_metering_2)
project1$Sub_metering_3<-as.numeric(project1$Sub_metering_3)

# plot and save to png file
png(file="plot3.png",width = 480, height = 480)
with(project1, {
    plot(Sub_metering_1~DateTime, type="l", ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~DateTime,  col="red")
    lines(Sub_metering_3~DateTime,  col="blue")
} )
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=1, lwd=2)
dev.off()


