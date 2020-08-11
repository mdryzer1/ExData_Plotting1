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
png('plot2.png')

# 2. Create a plot
plot(feb_data$Global_active_power ~ feb_data$DateTime, type='l', 
    ylab='Global Active Power (kilowatts)', xlab='')

# 3. Close/save the png file
dev.off()