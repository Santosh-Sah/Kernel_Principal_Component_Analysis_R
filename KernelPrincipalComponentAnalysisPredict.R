source("KernelPrincipalComponentAnalysisUtils.R")
library(e1071)
library(caret)
library(kernlab)

#reading KernelPrincipalComponentAnalysis object
kernelPrincipalComponentAnalysis <- readRDS("KernelPrincipalComponentAnalysis.RDS")

#reading KernelPrincipalComponentAnalysis with logistic regression model
kernelPrincipalComponentAnalysisWithLogisticRegressionModel= readRDS("KernelPrincipalComponentAnalysisWithLogisticRegressionModel.RDS")

inputValue <- data.frame(Age = c(28,30), EstimatedSalary = c(43000,30000))
inputValue[, 1:2] = scale(inputValue[, 1:2])

#applying KernelPrincipalComponentAnalysis on new observation
inputValuePCA = as.data.frame(predict(kernelPrincipalComponentAnalysis, inputValue))

#predicting testing set result.
prob_pred = predict(kernelPrincipalComponentAnalysisWithLogisticRegressionModel, type = 'response', newdata = inputValuePCA)

y_pred = ifelse(prob_pred > 0.5, 1, 0)

y_pred

