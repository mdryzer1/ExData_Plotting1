# Set the working directory
data_dir = paste('C:/Users/mdryz/Desktop/Code/R Projects/',
                 'Coursera Data Science Course Projects/Data/Course 4', sep='')
setwd(data_dir)

# Load in the data
data = read.delim('household_power_consumption.txt', sep=';')

# Extract the data only pertaining to 2007-02-01 through 2007-02-02
feb_data = subset(data, Date=='1/2/2007' | Date=='2/2/2007')

# Reformat the date and time variables
feb_data$Date = as.Date(feb_data$Date, format='%d/%m/%Y')
feb_data$DateTime = as.POSIXct(paste(feb_data$Date, feb_data$Time))

# Set the directory to the output folder
output_dir = paste('C:/Users/mdryz/Desktop/Code/R Projects/',
                   'Coursera Data Science Course Projects/Output/Course 4/',
                   'course_project_1', sep='')
setwd(output_dir)

# Plot the graph and save it as a .png file
# 1. Open a png file
png('plot4.png')

# 2. Create a plot
par(mfcol=c(2, 2)) # Set the order of plot addition
# a. Global Active Power ~ DateTime
plot(feb_data$Global_active_power ~ feb_data$DateTime, type='l', 
     ylab='Global Active Power (kilowatts)', xlab='')

# b. Energy Sub Metering ~ DateTime
plot(feb_data$Sub_metering_1 ~ feb_data$DateTime, type='l', 
     ylab='Energy sub metering', xlab='', col='black')
lines(feb_data$Sub_metering_2 ~feb_data$DateTime, type='l', col='red')
lines(feb_data$Sub_metering_3 ~feb_data$DateTime, type='l', col='blue')
legend('topright', col=c('black', 'red', 'blue'), lty=1,
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

# c. Voltage ~ DateTime
plot(feb_data$Voltage ~ feb_data$DateTime, xlab='datetime', ylab='Voltage', type='l')

# d. Global Reactive Power ~ DateTime
plot(feb_data$Global_reactive_power ~ feb_data$DateTime, xlab='datetime',
     ylab='Global_reactive_power', type='l')

# 3. Close/save the png file
dev.off()