# In-Class Data Exploration 1

install.packages("palmerpenguins")
install.packages("here")

#Loas packages
require(palmerpenguins)
require(here)

# Prepare the dataset
penguins = data.frame(penguins)
class(penguins)

# Numerical exploration

mean(penguins$body_mass_g)
mean(penguins$body_mass_g, na.rm = TRUE)

summary(penguins)

#Graphical exploration

boxplot(penguins$bill_length_mm)

boxplot(bill_length_mm ~ sex, data= penguins)

# How are these two plots different?
  
#What is the different insight you can gain from each boxplot separately and together?
 
par(mfrow = c(1, 2))
boxplot(penguins$bill_depth_mm)
boxplot(bill_depth_mm ~ sex, data = penguins)   

# Coplots

coplot(body_mass_g ~ bill_depth_mm | sex, data = penguins)

#What variable did I use as the conditioning variable?
#  Try different conditioning variables.
# You should try both categorical and numerical conditioning variables.


# Saving plots to a file

png(filename = here("Classes/week3/basic_histogram.png"), width = 800, height = 600)
hist(penguins$body_mass_g)
dev.off()

# Questions and deliverables

# As a group, select two different classes of plots.
  # coplot
  # boxplot 

#Try plotting different combinations of variables.

coplot(body_mass_g ~ bill_depth_mm | island + sex, data= penguins)

boxplot(body_mass_g ~ island + sex, data= penguins)

# Export your plots to image files and paste them into a document along with your responses to the questions below
png(filename = "Classes/week3/coplot_DavidMurillo.png", units = "cm",
    width = 18, height = 14, res = 600)

coplot(body_mass_g ~ bill_depth_mm | island + sex, data= penguins)

dev.off()

png(filename = "Classes/week3/boxplot_DavidMurillo.png", units = "cm",
    width = 18, height = 14, res = 600)

boxplot(body_mass_g ~ island + sex, data= penguins)

dev.off()

# Describe whether the plot shows a summary of the data, or all of the data points.
 # Answer: The coplot show all the data point separate by, island, and sex.
        #  The boxplot summarise the meadian and quartil at 25% and 75% categorise by island and sex

# Describe the insight your plot can provide, for example:
  
#Are the data evenly distributed, or skewed?
  # With the boxplot we can see that the dream and torgensen isalands have the most evenly distribuited data,
 # and the biscoe island has the most skewed data.


  #If your plot contains more than one variable, does the plot reveal any interesting relationships?
  # The coplot show that that the Biscoe island could have the highest value of body mass, and the male
  # have higher values that female

coplot(body_mass_g ~ bill_depth_mm | island + sex, data= penguins)

