# setwd('/Users/michaelhsu/code/mini_project')

setup_data = read.csv('data/ldpa30_train.csv')

# further divide into two sets
Set1 = subset(setup_data, week_index <= 270)
Set2 = subset(setup_data, week_index > 270)
N1 = nrow(Set1)
N2 = nrow(Set2)

calculate_rmse <- function(lambda){
	m0 = matrix(rep(0),3)
	a0 = 1
	b0 = 1

	aN = a0 + N1/2
	phi1 = matrix(c(rep(1,N1), Set1$week_return1, Set1$week_return4), ncol=3)

	S0 = lambda * diag(ncol(phi1))
	SN = solve(solve(S0) + t(phi1) %*% phi1)
	t1 = matrix(Set1$week_return13, ncol=1)
	mN = SN %*% (solve(S0) %*% m0 + t(phi1) %*% t1 )
	bN = b0 + 1/2 * ( t(m0)%*%solve(S0)%*%m0 - t(mN)%*%solve(SN)%*%mN + sum(t1*t1) )

	beta = mean(rgamma(100, shape = aN, scale = 1/bN))
	w0 = mean(rnorm(100, mean = mN[1,1], sd = (1/beta)*SN[1,1] ) )
	w1 = mean(rnorm(100, mean = mN[2,1], sd = (1/beta)*SN[2,2] ) )
	w2 = mean(rnorm(100, mean = mN[3,1], sd = (1/beta)*SN[3,3] ) )
	w = matrix(c(w0,w1,w2))

	phi2 = matrix(c(rep(1,N2), Set2$week_return1, Set2$week_return4), ncol=3)
	prediction = phi2 %*% w

	t2 = matrix(Set2$week_return13, ncol=1)

	error = t2 - prediction
	rmse = sqrt(mean(error * error))
	rmse
}

lambdas = seq(1, 30, by = 0.1)
lambda_vector = c()
count = 1
for(lambda in lambdas) {
    lambda_vector[count] = calculate_rmse(lambda)
    count = count + 1
}

plot(lambdas, lambda_vector, type = "l", col = "red")