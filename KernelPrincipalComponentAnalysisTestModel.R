source("KernelPrincipalComponentAnalysisUtils.R")
library(e1071)
library(caret)
library(kernlab)

#reading KernelPrincipalComponentAnalysis object
kernelPrincipalComponentAnalysis <- readRDS("KernelPrincipalComponentAnalysis.RDS")

#reading testing set data
kernelPrincipalComponentAnalysisTestingSet <- readRDS("KernelPrincipalComponentAnalysisTestingSet.RDS")

#feature scaling
kernelPrincipalComponentAnalysisTestingSet[, 1:2] = scale(kernelPrincipalComponentAnalysisTestingSet[, 1:2])

#applying KernelPrincipalComponentAnalysis on testing set
kernelPrincipalComponentAnalysisTestingSetPCA = as.data.frame(predict(kernelPrincipalComponentAnalysis, kernelPrincipalComponentAnalysisTestingSet))

kernelPrincipalComponentAnalysisTestingSetPCA$Purchased = kernelPrincipalComponentAnalysisTestingSet$Purchased

#reading KernelPrincipalComponentAnalysis with logistic regression model
kernelPrincipalComponentAnalysisWithLogisticRegressionModel= readRDS("KernelPrincipalComponentAnalysisWithLogisticRegressionModel.RDS")

#predicting testing set result.
prob_pred = predict(kernelPrincipalComponentAnalysisWithLogisticRegressionModel, 
                    type = "response", 
                    newdata = kernelPrincipalComponentAnalysisTestingSetPCA[-3])

y_pred = ifelse(prob_pred > 0.5, 1, 0)

#Saving prediced values for testing set
saveKernelPrincipalComponentAnalysisPredictedValuesForTestingSet(y_pred)

