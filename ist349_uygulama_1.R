#---an example of data cleaning and manipulation in R, 
#along with generating dataset


# Load required libraries
install.packages("dplyr")
library(dplyr)

# Generate sample data
set.seed(123)
data <- data.frame(
  ID = 1:10,
  Name = c("John", "Emily", "Michael", "Anna", "David", "Sarah", "Matthew", "Emma", "James", "Olivia"),
  Age = sample(18:60, 10, replace = TRUE),
  Gender = sample(c("Male", "Female"), 10, replace = TRUE),
  Score = rnorm(10, mean = 70, sd = 10)
)

# Print the generated sample data
print("Original Data:")
print(data)

# Data cleaning and manipulation
# Remove rows with missing values
cleaned_data <- na.omit(data)

# Filter data based on specific conditions (e.g., Age greater than 30)
filtered_data <- filter(cleaned_data, Age > 30)

# Select specific columns
selected_data <- select(filtered_data, ID, Name, Age)

# Rename columns
renamed_data <- rename(selected_data, StudentID = ID, StudentName = Name)

# Sort data by Age in descending order
sorted_data <- arrange(renamed_data, desc(Age))

# Print cleaned and manipulated data
print("Cleaned and Manipulated Data:")
print(sorted_data)

#---

#--- an example for SLR

# Generate some sample data for the regression model
set.seed(123)
x <- rnorm(100)  # Independent variable
y <- 2 * x + rnorm(100, mean = 0, sd = 0.5)  # Dependent variable with noise

# Fit a linear regression model
model <- lm(y ~ x)

# Summary of the regression model
summary(model)

#The coefficients table provides estimates for the intercept and slope of the regression line. 
#In this example, the estimated intercept is close to 0, and the estimated slope (coefficient for x) is close to 2. 
#These coefficients represent the intercept and slope of the regression line, respectively.

#Residuals represent the differences between the observed and predicted values of the dependent variable. 
#The summary provides statistics about the residuals, including the mean, median, and quartiles. 
#Additionally, the residual standard error indicates the standard deviation of the residuals,
#which measures the typical size of the errors in the regression model.

#Significance--- The Pr(>|t|) column in the coefficients table provides p-values for each coefficient. 
#These p-values indicate the significance of each coefficient in the regression model. 
#Generally, smaller p-values (typically less than 0.05) suggest that 
#the corresponding coefficient is significantly different from zero and contributes significantly to the model.

#The R-squared value (or coefficient of determination) indicates 
#the proportion of variance in the dependent variable that is explained by the independent variable(s). 
#In this example, the R-squared value is close to 1, 
#indicating that a large proportion of the variance in y is explained by x.

#The adjusted R-squared value adjusts the R-squared value for the number of predictors in the model. 
#It penalizes the inclusion of additional predictors that do not significantly improve the model fit.

#Overall, the regression model summary provides valuable information about the relationship 
#between the independent and dependent variables, the significance of the predictors, 
#and the overall fit of the model to the data.


# Load required libraries
install.packages("quantmod")
library(quantmod)

# Get historical stock data (example: Apple Inc.)
getSymbols("AAPL", from = "2020-01-01", to = Sys.Date())

# Extract adjusted close prices of the stock
stock_prices <- Ad(AAPL)

# Get historical market data (example: S&P 500 index)
getSymbols("^GSPC", from = "2020-01-01", to = Sys.Date())

# Extract adjusted close prices of the market index
market_prices <- Ad(GSPC)

# Compute daily returns for the stock and market
stock_returns <- diff(log(stock_prices))
market_returns <- diff(log(market_prices))

# Combine stock returns and market returns into a data frame
data <- data.frame(Date = index(stock_returns),
                   StockReturns = as.numeric(stock_returns),
                   MarketReturns = as.numeric(market_returns))

# Fit a linear regression model
model <- lm(StockReturns ~ MarketReturns, data = data)

# Summary of the regression model
summary(model)



#One common real-life example where regression models are used extensively is in the field of finance, 
#particularly in asset pricing and portfolio management.
#Let's consider an example where we want to predict the returns of a stock based on various factors 
#such as market returns, interest rates, and company-specific fundamentals.


# Load required libraries
library(quantmod)

# Get historical stock data (example: Apple Inc.)
getSymbols("AAPL", from = "2020-01-01", to = Sys.Date())

# Extract adjusted close prices of the stock
stock_prices <- Ad(AAPL)

# Get historical market data (example: S&P 500 index)
getSymbols("^GSPC", from = "2020-01-01", to = Sys.Date())

# Extract adjusted close prices of the market index
market_prices <- Ad(GSPC)

# Compute daily returns for the stock and market
stock_returns <- diff(log(stock_prices))
market_returns <- diff(log(market_prices))

# Combine stock returns and market returns into a data frame
data <- data.frame(Date = index(stock_returns),
                   StockReturns = as.numeric(stock_returns),
                   MarketReturns = as.numeric(market_returns))

# Fit a linear regression model
model <- lm(StockReturns ~ MarketReturns, data = data)

# Summary of the regression model
summary(model)

#In this example:

#We use the quantmod package to retrieve historical stock price data for Apple Inc. (AAPL) and the S&P 500 index (^GSPC).
#We calculate the daily returns for both the stock and the market index.
#We fit a simple linear regression model where the stock returns are regressed on the market returns.
#Finally, we examine the summary of the regression model to interpret the coefficients.


#Intercept (β₀): The intercept coefficient represents the expected stock return when the market return is zero. 
#In financial terms, this could be interpreted as the alpha or abnormal return of the stock.

#Market Return Coefficient (β₁): The coefficient for the market return represents 
#the sensitivity of the stock returns to changes in the market returns. 
#A positive coefficient indicates that the stock tends to move in the same direction as the market, 
#while a negative coefficient suggests an inverse relationship.

#Interpreting these coefficients in the context of finance can provide insights 
#into how a particular stock behaves relative to the overall market.




#--- ANOVA
#ANOVA (Analysis of Variance) is a statistical method used to analyze the differences among group means in a sample. 
#It assesses whether the means of different groups are significantly different from each other. 
#ANOVA is often used when comparing three or more groups, and it helps determine 
#if there is a statistically significant difference between the means of these groups.

# Generate some sample data for three groups
set.seed(123)
group1 <- rnorm(30, mean = 10, sd = 2)
group2 <- rnorm(30, mean = 12, sd = 2)
group3 <- rnorm(30, mean = 14, sd = 2)

# Combine the data into a single data frame
data <- data.frame(
  Value = c(group1, group2, group3),
  Group = factor(rep(c("Group 1", "Group 2", "Group 3"), each = 30))
)

# Visualize the data using boxplots
boxplot(Value ~ Group, data = data, col = "lightblue", main = "Boxplot of Group Values")

# Perform one-way ANOVA
anova_result <- aov(Value ~ Group, data = data)

# Summary of ANOVA results
summary(anova_result)


#Between-group variation (SS): Sum of squares between groups, which measures the variability between group means.
#Within-group variation (SS): Sum of squares within groups, which measures the variability within each group.
#F-statistic: The ratio of between-group variation to within-group variation. 
#It tests the null hypothesis that all group means are equal.
#p-value: The probability of observing the data given that 
#the null hypothesis is true. A small p-value indicates that there is strong evidence against the null hypothesis, 
#suggesting that at least one group mean is significantly different from the others.


#--- ANCOVA
#ANCOVA (Analysis of Covariance) is an extension of the Analysis of Variance (ANOVA) method that 
#incorporates one or more continuous covariates into the analysis. 
#ANCOVA aims to assess whether the means of several groups are different after 
#adjusting for the effects of the covariates.

#In ANCOVA, the dependent variable is still categorical, 
#and the independent variable is still categorical (representing group membership), 
#but there is an additional continuous variable (the covariate) that is included in the analysis as a predictor. 
#ANCOVA helps to control for the effects of the covariate(s) and 
#improve the accuracy of the comparisons between group means.


# Load required libraries
install.packages("MASS")
library(MASS)

# Generate sample data for three groups with a continuous covariate
set.seed(123)
n <- 30
group1 <- rnorm(n, mean = 10, sd = 2)
group2 <- rnorm(n, mean = 12, sd = 2)
group3 <- rnorm(n, mean = 14, sd = 2)
covariate <- rnorm(3*n, mean = 5, sd = 2)

# Combine the data into a single data frame
data <- data.frame(
  Value = c(group1, group2, group3),
  Group = factor(rep(c("Group 1", "Group 2", "Group 3"), each = n)),
  Covariate = covariate
)

# Visualize the data using scatterplot
plot(data$Covariate, data$Value, col = as.integer(data$Group), pch = 19,
     xlab = "Covariate", ylab = "Value", main = "Scatterplot with Covariate")

# Perform ANCOVA
ancova_result <- lm(Value ~ Group + Covariate, data = data)

# Summary of ANCOVA results
summary(ancova_result)
