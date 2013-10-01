
# setwd('k:\\Users\\hmlu\\svn_drive\\teaching\\data mining and information retrieval\\2013 fall\\mini_project')
setwd('/Users/michaelhsu/code/mini_project')

train1 = read.csv('ldpa30_train.csv')

#further divide into two sets
train2a = subset(train1, week_index <=270)
train2b = subset(train1, week_index >270)

##check the dataset
#fix(train1)

lm1 = lm(week_return13~week_return1, data=train2a)

cat("Run regression using built-in functions\n")
print(summary(lm1))

#m1 = model.matrix(~week_return1, train1)

cat("Estimate regression models from scratch\n")
cat("model with one feature:\n")
#create a matrix 
nobs = nrow(train2a)
x2a=matrix(c(rep(1,nobs), train2a$week_return1), ncol=2)
t2a=matrix(train2a$week_return13, ncol=1)

b2a=solve(t(x2a)%*%x2a) %*% t(x2a) %*% t2a

nobs2b = nrow(train2b)
x2b = matrix(c(rep(1, nobs2b), train2b$week_return1), ncol=2)
t2b=matrix(train2b$week_return13, ncol=1)

t2b_head = x2b %*% b2a

t2b_err = t2b - t2b_head

#root mean square error
rmse = sqrt(mean(t2b_err * t2b_err))

cat("reg. coef=", b2a, "\n")
cat("The RMSE (one feature)=", rmse, "\n")

cat("\n\nmodel with two features:\n")




# try out a model with two features
nobs = nrow(train2a)
x2a=matrix(c(rep(1,nobs), train2a$week_return1, train2a$week_return4), ncol=3)
t2a=matrix(train2a$week_return13, ncol=1)

b2a=solve(t(x2a)%*%x2a) %*% t(x2a) %*% t2a

nobs2b = nrow(train2b)
x2b = matrix(c(rep(1, nobs2b), train2b$week_return1, train2b$week_return4), ncol=3)
t2b=matrix(train2b$week_return13, ncol=1)

t2b_head = x2b %*% b2a

t2b_err = t2b - t2b_head

#root mean square error
rmse = sqrt(mean(t2b_err * t2b_err))

cat("reg. coef=", b2a, "\n")
cat("The RMSE (two features)=", rmse, "\n")














