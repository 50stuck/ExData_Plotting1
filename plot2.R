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

png(filename="plot2.png", width=480, height=480, bg="white") #creating the
                                                #png file in the properties
                                                #asked for by the instructions
with(subdata, plot(DataTime, Global_active_power, type="l", ylab="Global Active Power (Kilowatts)",
                   xlab="")) #creating the plot
dev.off() #closing the png device so file will be created