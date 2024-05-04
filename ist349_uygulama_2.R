# Load necessary libraries
library(stats)

# Example dataset for logistic regression
data(iris)

# Fit logistic regression model using GLM
# Note: 'Species' is the binary response variable and 'Petal.Length' is the predictor
logit_model <- glm(Species ~ Petal.Length, 
                   data = iris,
                   family = binomial(link = "logit"))

# Print summary of the model
summary(logit_model)



#---
# Load necessary libraries
library(stats)

# Example dataset for Poisson regression
data(mtcars)

# Fit Poisson regression model using GLM
# Note: 'cyl' is the response variable and 'wt' and 'hp' are the predictors
poisson_model <- glm(cyl ~ wt + hp, 
                     data = mtcars,
                     family = poisson(link = "log"))

# Print summary of the model
summary(poisson_model)
