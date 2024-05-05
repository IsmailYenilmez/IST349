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


# logit: Generate simulated data
set.seed(123)
n <- 1000  # Number of observations
x1 <- rnorm(n)  # Predictor variable 1
x2 <- rnorm(n)  # Predictor variable 2
p <- 0.3 + 0.5 * x1 - 0.8 * x2  # True relationship (logit function)
y <- rbinom(n, 1, plogis(p))  # Simulate binary outcome based on logit function

# Create a data frame
data_logit <- data.frame(y, x1, x2)

# Fit Logit Model
logit_model <- glm(y ~ x1 + x2, data = data_logit, family = binomial(link = "logit"))

# Summary of the model
summary(logit_model)


# probit: Fit Probit Model
probit_model <- glm(y ~ x1 + x2, data = data_logit, family = binomial(link = "probit"))

# Summary of the model
summary(probit_model)

