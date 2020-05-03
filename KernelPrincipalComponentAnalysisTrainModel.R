source("KernelPrincipalComponentAnalysisUtils.R")
library(e1071)
library(caret)
library(kernlab)

#reading training set 
kernelPrincipalComponentAnalysisTrainingSet <- readRDS("KernelPrincipalComponentAnalysisTrainingSet.RDS")

#feature scaling
kernelPrincipalComponentAnalysisTrainingSet[, 1:2] = scale(kernelPrincipalComponentAnalysisTrainingSet[, 1:2])

#here I have taken 2 component.
kernelPrincipalComponentAnalysis = kpca(~., data = kernelPrincipalComponentAnalysisTrainingSet[-3], kernel = 'rbfdot', features = 2)

#applying KernelPrincipalComponentAnalysis on training set
kernelPrincipalComponentAnalysisTrainingSetPCA = as.data.frame(predict(kernelPrincipalComponentAnalysis, kernelPrincipalComponentAnalysisTrainingSet))

kernelPrincipalComponentAnalysisTrainingSetPCA$Purchased = kernelPrincipalComponentAnalysisTrainingSet$Purchased

# Fitting KernelPrincipalComponentAnalysis with  logistic regression to the Training set
kernelPrincipalComponentAnalysisWithLogisticRegressionModel = glm(formula = Purchased ~ .,
                                                         family = binomial,
                                                         data = kernelPrincipalComponentAnalysisTrainingSetPCA)


#saving KernelPrincipalComponentAnalysis with logistic regression model
saveKernelPrincipalComponentAnalysisWithLogisticRegressionModel(kernelPrincipalComponentAnalysisWithLogisticRegressionModel)

#saving KernelPrincipalComponentAnalysis object
saveKernelPrincipalComponentAnalysis(kernelPrincipalComponentAnalysis)
