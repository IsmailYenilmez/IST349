# R-1: Generating a simple dataset
set.seed(123)  # for reproducibility
x <- 1:100
y <- 3 * x + rnorm(100, mean = 0, sd = 10)  # True equation: y = 3x + error
data <- data.frame(x, y)


# Simple Linear Regression
lm_model <- lm(y ~ x, data = data)

# Summary of the regression model
summary(lm_model)

# Plotting the regression line
plot(data$x, data$y, main = "Simple Linear Regression", xlab = "x", ylab = "y")
abline(lm_model, col = "red")



# R-2: Loading built-in dataset
data(mtcars)

# Checking the structure of the dataset
str(mtcars)

# Performing linear regression
lm_mtcars <- lm(mpg ~ wt, data = mtcars)

# Summary of the regression model
summary(lm_mtcars)

# Plotting the regression line
plot(mtcars$wt, mtcars$mpg, main = "Linear Regression: mpg vs wt", xlab = "Weight", ylab = "Miles per Gallon")
abline(lm_mtcars, col = "blue")



