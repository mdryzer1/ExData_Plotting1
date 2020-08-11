# Set the working directory
data_dir = paste('C:/Users/mdryz/Desktop/Code/R Projects/',
            'Coursera Data Science Course Projects/Data/Course 4', sep='')
setwd(data_dir)

# Load in the data
data = read.delim('household_power_consumption.txt', sep=';')

# Extract the data only pertaining to 2007-02-01 through 2007-02-02
feb_data = subset(data, Date=='1/2/2007' | Date=='2/2/2007')

# Set the directory to the output folder
output_dir = paste('C:/Users/mdryz/Desktop/Code/R Projects/',
                   'Coursera Data Science Course Projects/Output/Course 4/',
                   'course_project_1', sep='')
setwd(output_dir)

# Plot the graph and save it as a .png file
# 1. Open a png file
png('plot1.png')

# 2. Create a plot
hist(as.numeric(feb_data$Global_active_power), col='red', 
     main='Global Active Power', xlab='Global Active Power (kilowatts)')

# 3. Close/save the png file
dev.off()