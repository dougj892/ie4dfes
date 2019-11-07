##################################################
## Description: Check fit of model from second example (head-to-head comparison) in IDinsight working paper.
## Discussion of code may be found in Appendix A.
## Author: Doug Johnson
## Notes: The R script "Example 2 - head to head.R" must be run prior to this R script as this script uses the output from that script.
##################################################


# Input data and save as a dataframe
y <- c(0.739, 2.392, 2.034, 4.566, 1.433, 0.504, 0.556, 0.813, 0.916, 1.542, 4.246, 2.772, 2.646, 1.684, 3.478, 1.146, 3.04, 3.148, -0.801, 1.023, 4.054, 2.272, 1.893, 3.322, 2.722, 1.752, 4.487, 1.953, 1.434, 2.424, 2.284, 0.959, 3.542, 0.774, 3.851, 1.793, 1.861, 2.866, 3.043, 2.275, 2.435, 3.091, 2.707, 2.573, 3.391, 3.548, -0.138, 3.432, 3.127, 1.018, 2.915, 3.123, 4.761, 2.462, 2.139, 0.31, 4.092, 3.197, 1.27, 5.5)
t1 <- rep(c(0,1,0), each = 20)
t2 <- rep(c(0,0,1), each = 20)
df <- data.frame(y, t1, t2)

# calculate the quantity t1_max - t1_min+t2_max-t2_min +control_max-control_min
# for the actual (as opposed to replicated) data
control_y <- y[df$t1 ==0 & df$t2 == 0] # same as y[1:20]
t1_y <- y[df$t1 ==1] # same as y[21:40]
t2_y <- y[df$t2 ==1] # same as y[21:40]
observed_quantity <- max(control_y)-min(control_y)+max(t1_y)-min(t1_y)+max(t2_y)-min(t2_y)
print("Value of the test quantity for actual data:")
print(observed_quantity)

# Read in draws from posterior from csv file
draws <- read.csv("multi_arms_draws.csv")

count <- 0
for (i in 1:nrow(draws)){
  # generate simulated data using the sampling distribution
  alpha_sim <- draws$alpha[i]
  b1_sim <- draws$beta1[i]
  b2_sim <- draws$beta2[i]
  sig_sims <- draws$sigma[i]
  
  means <- c(rep(alpha_sim,20), rep(alpha_sim+b1_sim,20), rep(alpha_sim+b2_sim,20))
  y_sim <- means + rnorm(60, mean = 0, sd = sig_sims)
  
  control_y <- y_sim[1:20]
  t1_y <- y_sim[21:40]
  t2_y <- y_sim[41:60]
  
  test <- max(control_y)-min(control_y)+max(t1_y)-min(t1_y)+max(t2_y)-min(t2_y)
  print(test)
  if (test > observed_quantity) {
    count <- count+1
  }
}

print("Bayesian p-value is:")
print(count/nrow(draws))
