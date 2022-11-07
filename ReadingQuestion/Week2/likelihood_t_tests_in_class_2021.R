# In-class review of likelihood and t-tests activities

# ---- Read data ----
dat_bird = read.csv(here::here("data", "bird.sta.csv"))
dat_habitat = read.csv(here::here("data", "hab.sta.csv"))
dat_all = merge(dat_bird, dat_habitat)




wiwa_counts = c(2, 6)
dpois(x = wiwa_counts, lambda = 4.5)





# ---- Poisson ----


# Find lambda that maximizes the likelihood of 
# observing values of 2 and 6.

# Try some guesses:
sum(log(dpois(x = c(2, 6), lambda = 4.5)))
sum(log(dpois(x = c(2, 6), lambda = 2)))

sum(log(dpois(x = c(2, 6), lambda = 4)))
sum(log(dpois(x = c(2, 6), lambda = 4 + 0.1)))
sum(log(dpois(x = c(2, 6), lambda = 4 - 0.1)))


# Find lambda tha maximizes the log-likelihood
# of the Winter Wren count data.

# Try some guesses:
sum(log(dpois(dat_all$WIWR, lambda = 1.2)))
sum(log(dpois(dat_all$WIWR, lambda = 1.3)))
sum(log(dpois(dat_all$WIWR, lambda = 1.4)))

# The mean is a good starting point
mean(dat_all$WIWR)
sum(log(dpois(dat_all$WIWR, lambda = 1.456023)))





# ---- Binomial ----

summary(dat_all$WIWR)

# How to choose n?
n = 20

# Let's base our probability guess on the mean observed
mean(dat_all$WIWR)

prob_guess = 1.46 / n
prob_guess * n
prob_guess 

sum(log(dbinom(
  x = dat_all$WIWR,
  size = n,
  prob = prob_guess)))




# t-tests

require(palmerpenguins)
dat_pen = droplevels(subset(penguins, species == "Adelie"))
boxplot(body_mass_g ~ sex, data = dat_pen)


# one-sample
dat_pen_f = droplevels(subset(dat_pen, sex == "female"))
dat_pen_m = droplevels(subset(dat_pen, sex == "male"))

t.test(
  x = dat_pen_f$body_mass_g,
  mu = 0
)


t.test(
  x = dat_pen_m$body_mass_g,
  mu = 4000,
  alternative = "g"
)



t.test(
  x = dat_pen_f$body_mass_g,
  y = dat_pen_m$body_mass_g,
  alternative = "l"
)


# x/y syntax
t.test(
  x = dat_pen_m$body_mass_g,
  y = dat_pen_f$body_mass_g,
  alternative = "g"
)

# formula/data syntax
t.test(
  formula = body_mass_g ~ sex, 
  data = dat_pen,
  alternative = "g")


# How do I know which is the first factor level?
levels(dat_pen$sex)



prob_guess = seq(0.01, 0.99, length.out = 1000)


# ---- Plotting binomial likelihood ----

# Likelihood function for binomial
bin_lik_fun = function(prob_guess, dat, n){
  sapply(
    prob_guess, 
    function(x)
  sum(log(dbinom(
    x = dat,
    size = n,
    prob = x))))
}

curve(
  expr = bin_lik_fun(x, dat_all$WIWR, n = 20),
  from = 0,to = 0.5,
  ylab = "log likelihood",
  xlab = "p",
  main = "Binomial likelihood curve")
