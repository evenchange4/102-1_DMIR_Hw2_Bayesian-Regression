Bayesian Regression with Normal-Gamma Prior
==================================

102-1_DMIR_Hw2_Bayesian-Regression

## 如何執行

R

```
source("XXXXXX.r")
```

## Homework 2 (4%) Bayesian Regression
The goal of this homework is to provide you a chance to get familiar with the basic procedure in Bayesian regression. 

We are interested in seeing how the choice of 𝑆0 influence the prediction accuracy. Split the records in ldpa30_train.csv into two sets. The records from the Week 1 to 270 are Set1 and the remaining records are Set2. Our target variable is week_return13 and our basis function includes week_return1 and week_return4 (and a constant 1). Set 𝑚0 = 0, 𝑎0 = 𝑏0 = 1. Assume that
𝑆0 = 𝜆𝐼. Train your model using Set1. Used the learned coefficients to predict Set2. Vary 𝜆 and plot the RMSE with respect to 𝜆. 

## Note that to conduct prediction you should:

### 1. Compute 𝑆𝑁, 𝑚𝑁, 𝑎𝑁, and 𝑏𝑁 

### 2. Draw 𝛽 from 𝐺𝑎𝑚𝑚𝑎(𝑎𝑁,𝑏𝑁) 

### 3. Draw 𝑤 from 𝑁(𝑤|𝑚𝑁,𝛽−1𝑆𝑁) 

### 4. Use 𝑤 to make prediction.

### 5. Compute error.

![Vary 𝜆 and plot the RMSE with respect to 𝜆](https://raw.github.com/evenchange4/102-1_DMIR_Hw2_Bayesian-Regression/master/plot%20rmse.png)
