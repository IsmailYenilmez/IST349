# LPM: Generate simulated data
set.seed(123)
n <- 1000  # Number of observations
income <- rnorm(n, mean = 50, sd = 10)  # Simulate income
purchase_prob <- 0.2 + 0.01 * income + rnorm(n, mean = 0, sd = 0.1)  # Simulate purchase probability
purchase <- as.numeric(runif(n) < purchase_prob)  # Simulate binary purchase variable

# Create a data frame
data <- data.frame(income, purchase)

# Fit Linear Probability Model
lpm_model <- lm(purchase ~ income, data = data)

# Summary of the model
summary(lpm_model)
