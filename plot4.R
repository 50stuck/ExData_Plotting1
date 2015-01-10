data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                   na.strings="?")

data$Date <- as.Date(data$Date, "%d/%m/%Y") #converting date to propar class
subdata <- data[(data$Date=="2007-02-01" | data$Date=="2007-02-02"),] #subsetting
                                                                #the two days
subdata$DateTime <- paste(subdata$Date, subdata$Time) #creating a new column that
                                                        #contains both date and time
subdata$DataTime <- strptime(subdata$DateTime, format="%Y-%m-%d %H:%M:%S") #formatting
                                                        #the new column

Sys.setlocale(category = "LC_TIME", locale = "C") #so that the time will appear
                                                #in english and not my local language

png(filename="plot4.png", width=480, height=480, bg="white") #creating the
                                                #png file in the properties
                                                #asked for by the instructions

par(mfrow=c(2,2)) #creating a 2 by 2 "canvas" for the plots

##top-left plot, same as second plot for the assignment
with(subdata, plot(DataTime, Global_active_power, type="l", ylab="Global Active Power",
                   xlab=""))

##top-right plot - pretty straight forward
with(subdata, plot(DataTime, Voltage, type="l", ylab="Voltage",
                   xlab="datetime"))

##bottom-left plot, same as third plot for the assignment
with(subdata, plot(DataTime, Sub_metering_1, type="n", ylab="Energy Sub metering",
                   xlab="")) #creating the canvas
with(subdata, lines(DataTime, Sub_metering_1, col="black")) #adding the black line
with(subdata, lines(DataTime, Sub_metering_2, col="red")) #adding the red line
with(subdata, lines(DataTime, Sub_metering_3, col="blue")) #adding the blue line
legend("topright", bty="n", lwd=1, col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) #adding the legend

##bottom-right plot - histogram type plot
with(subdata, plot(DataTime, Global_reactive_power, type="h",
                   ylab="Global_reactive_power", xlab="datetime"))

dev.off() #closing the png device so file will be created