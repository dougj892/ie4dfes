##################################################
## Description: Fit Bayesian model for second example (head to head comparison) from IDinsight working paper
## Author: Doug Johnson
##################################################

# Input fake data and save as a list for use in Stan model
y <- c(0.739, 2.392, 2.034, 4.566, 1.433, 0.504, 0.556, 0.813, 0.916, 1.542, 4.246, 2.772, 2.646, 1.684, 3.478, 1.146, 3.04, 3.148, -0.801, 1.023, 4.054, 2.272, 1.893, 3.322, 2.722, 1.752, 4.487, 1.953, 1.434, 2.424, 2.284, 0.959, 3.542, 0.774, 3.851, 1.793, 1.861, 2.866, 3.043, 2.275, 2.435, 3.091, 2.707, 2.573, 3.391, 3.548, -0.138, 3.432, 3.127, 1.018, 2.915, 3.123, 4.761, 2.462, 2.139, 0.31, 4.092, 3.197, 1.27, 5.5)
t1 <- rep(c(0,1,0), each = 20)
t2 <- rep(c(0,0,1), each = 20)
stan_data <- list(N = 60, y = y, t1 = t1, t2 = t2)

# Create Stan model as a string 
stan_model_string = "
data {
  int<lower=0> N;  // number of observations
  real y[N];  // outcome variable
  vector[N] t1;
  vector[N] t2;
}
parameters {
  // note that since we don't specify any priors Stan uses a uniform prior.
  // In the case of sigma, since we specify a lower bound, the uniform prior is over (0, infinity)
  real alpha;
  real beta1;
  real beta2;
  real <lower=0> sigma;
}


model {
  y ~ normal(alpha + beta1*t1+ beta2*t2,sigma);
}
"

# Import rstan library, fit the model to the data, and extract the posterior draws from the fit object
library(rstan)
fit <- stan(model_code = stan_model_string, data = stan_data, iter = 5000, chains = 4)
extracted_values <- extract(fit, permute = TRUE)
# Print the fit object to check for convergence.
print(fit)

# calculate probability that treatment 2 is bigger than treatment 1
print("Probability from Stan model that beta 2 is greater than beta 1")
print(mean(extracted_values$beta2 > extracted_values$beta1))

# Density graph of beta2 - beta1
diff <- extracted_values$beta2 - extracted_values$beta1
library(ggplot2)
p <- ggplot(data.frame(diff), aes(x=diff))+ geom_density()
print(p)
ggsave("graphs/example 2 - beta2 - beta1 posterior.jpg")

######### COMPARISON WITH MAXIMUM LIKELIHOOD OUTPUT ################
# Fit a maximum likelihood model to the data.  
df <- data.frame(y, t1, t2)
reg_fit <- lm(y ~ t1+ t2, data = df)
# Calculate probability beta2 > beta1 by treating output from max likelihood as posterior
vc <- vcov(reg_fit)
test_equal_se <- (vc[2,2]+vc[3,3]-2*vc[3,2])^.5
diff <- coef(reg_fit)[2]-coef(reg_fit)[3]
print("Probability from max likelihood model that beta 2 is greater than beta 1")
print(pnorm(0, diff, test_equal_se))


# Save draws from posterior to csv file for use in calculating test statistic
write.csv(data.frame(extracted_values), "multi_arms_draws.csv")

