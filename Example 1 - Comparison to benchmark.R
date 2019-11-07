##################################################
## Description: Fit Bayesian model for first example (benchmark comparison) from IDinsight working paper
## Author: Doug Johnson
##################################################

# Create string with details of Bayesian model in Stan
stan_model_string = "
data {
  int<lower=0> N;  // number of observations
  real y[N];  // outcome variable
  vector[N] treat;  // treatment indicator
}
parameters {
  real alpha;
  real beta;
}
model {
  // priors for alpha and beta. note that the second parameter specifies the std dev not the variance (as in BUGS)
  alpha ~ normal(-1,2); 
  beta ~ normal(.1,.1); 
  y ~ normal(alpha + beta*treat,1);
} 
"

# load the rstan library
library(rstan)

# input fake outcome and treatment assignment data
outcome <- c(-0.86, -1.03, -3.45, -2.88, -1.39, -0.64, -1.38, -0.13, -1.80, -0.82, -0.27, -3.80, -0.25, 0.14, -1.30, 1.46, 0.59, -0.80, -1.40, -1.52, -1.28, -1.34, -2.11, -5.35, 0.09, -2.39, -1.65, -3.35, -0.29, -1.44, -4.23, -0.96, -0.46, -2.07, -2.96, -0.93, -0.69, -0.84, -2.27, 4.93, -0.79, -1.46, -0.93, -0.09, -0.47, -0.23, -2.49, -0.30, -1.03, -0.87, 0.60, -0.32, -3.29, -3.12, -1.78, -2.74, -0.60, 0.10, -0.96, -0.30, -2.18, -0.45, 0.03, -0.66, -4.85, -0.48, -1.92, -2.89, -1.11, -1.48, 0.59, -0.60, 0.09, -0.16, -0.03, 0.83, -1.21, -0.40, 2.45, -2.98, -2.76, -0.13, -1.40, 0.14, -0.87, 0.52, 0.46, -0.25, 0.11, -2.16, -1.58, -1.32, -0.58, -0.92, -0.30, 0.76, -3.57, 0.46, -0.82,  -0.41)
treat <- c(rep(0,50),rep(1,50))

# generate an R list containing N (# of units), the outcome vector, and the treatment vector
stan_data <- list(N = length(outcome), y = outcome, treat = treat)

# pass the list of data and the stan model string to the stan function to fit the model
fit <- stan(model_code = stan_model_string, data = stan_data, iter = 10000, chains = 4)

# print the output from the stan function
print(fit)

# extract the posteriordraws from the fit object
extracted_values<-extract(fit, permuted = TRUE)
beta <- extracted_values$beta

# estimate the probability that beta is greater than .2 by calculating the % of draws for beta greater than .2
prob_better <- sum(beta >.2)/length(beta)
print("Probability from Stan model of beta > .2")
print(prob_better)

# generate kernel density of posterior for beta
library(ggplot2)
p <- ggplot(data.frame(beta), aes(x=beta))+ geom_density()
print(p)
ggsave("graphs/example 1 - beta posterior.jpg")