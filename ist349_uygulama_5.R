#if you want to generate your own data for truncated regression, 
#you can simulate a dataset where the dependent variable is truncated at 
#a certain threshold. For example, let's generate a dataset where the dependent
#variable (income) is truncated at $30,000, meaning that any income above
#$30,000 is censored and not observed:

# Set seed for reproducibility
set.seed(123)

# Number of observations
n <- 100

# Generate independent variables
education <- rnorm(n, mean = 12, sd = 2)
experience <- rnorm(n, mean = 10, sd = 3)

# Generate truncated dependent variable
income <- rnorm(n, mean = 25000, sd = 5000)

income[income > 30000] <- 30000

original_df <- data.frame(education, experience, income)
# Create a data frame
truncated_data <- data.frame(education, experience, income)

# View the first few rows of the dataset
head(truncated_data)

#You can then apply truncated regression techniques to analyze the relationship
#between the independent variables (e.g., education, experience) and the 
#truncated income variable.between the independent variables 
#(e.g., education, experience) and the truncated income variable.

# Install and load the censReg package
install.packages("censReg")
library(censReg)

# Fit Tobit regression model
tobit_model <- censReg(income ~ education + experience, left = 0, right = 30000, data = truncated_data)

# Summary of the Tobit regression model
summary(tobit_model)

