#If you want to generate your own data for censored regression, 
#you can simulate a dataset where the dependent variable is censored
#at a certain threshold. For example, let's generate a dataset where
#the dependent variable (income) is censored if it exceeds 
#a certain threshold (e.g., $50,000):

# Set seed for reproducibility
set.seed(123)

# Number of observations
n <- 100

# Generate independent variables
education <- rnorm(n, mean = 12, sd = 2)
experience <- rnorm(n, mean = 10, sd = 3)

# Generate censored dependent variable
income <- rnorm(n, mean = 40000, sd = 10000)
income[income > 50000] <- 50000

# Create a data frame
censored_data <- data.frame(education, experience, income)

# View the first few rows of the dataset
head(censored_data)


# Load the survival package
library(survival)

# Fit censored regression model
censored_model <- survreg(Surv(income, income <= 50000) ~ education + experience, data = censored_data, dist = "gaussian")

# Summary of the censored regression model
summary(censored_model)
