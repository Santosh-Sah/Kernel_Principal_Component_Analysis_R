source("KernelPrincipalComponentAnalysisUtils.R")
library(ggplot2)
library(ElemStatLearn)
library(caret)
library(kernlab)

#reading training set 
kernelPrincipalComponentAnalysisTrainingSet <- readRDS("KernelPrincipalComponentAnalysisTrainingSet.RDS")

#reading testing set data
kernelPrincipalComponentAnalysisTestingSet <- readRDS("KernelPrincipalComponentAnalysisTestingSet.RDS")

#reading KernelPrincipalComponentAnalysis with logistic regression model
KernelPrincipalComponentAnalysisWithLogisticRegressionModel = readRDS("KernelPrincipalComponentAnalysisWithLogisticRegressionModel.RDS")

#visualizing training set result
#It will take huge memory. If the system is not advance it will give memory error
visualisingTrainingSetResult <- function(kernelPrincipalComponentAnalysisTrainingSet, KernelPrincipalComponentAnalysisWithLogisticRegressionModel){
  
  set = kernelPrincipalComponentAnalysisTrainingSet
  
  X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
  X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
  
  grid_set = expand.grid(X1, X2)
  
  colnames(grid_set) = c('V1', 'V2')
  prob_set = predict(KernelPrincipalComponentAnalysisWithLogisticRegressionModel, type = 'response', newdata = grid_set)
  y_grid = ifelse(prob_set > 0.5, 1, 0)
  
  plot(set[, -3],
       main = 'KernelPrincipalComponentAnalysis Logistic Regression (Training set)',
       xlab = 'PC1', ylab = 'PC2',
       xlim = range(X1), ylim = range(X2))
  
  contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
  
  points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
  points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
  
  
  ggsave("KernelPrincipalComponentAnalysisTrainingsetResult.png")
  
}

#visualizing testing set result
visualisingTestingSetResult <- function(kernelPrincipalComponentAnalysisTestingSet, KernelPrincipalComponentAnalysisWithLogisticRegressionModel){
  
  set = kernelPrincipalComponentAnalysisTestingSet
  
  X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
  X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
  
  grid_set = expand.grid(X1, X2)
  
  colnames(grid_set) = c('V1', 'V2')
  prob_set = predict(KernelPrincipalComponentAnalysisWithLogisticRegressionModel, type = 'response', newdata = grid_set)
  y_grid = ifelse(prob_set > 0.5, 1, 0)
  
  plot(set[, -3],
       main = 'KernelPrincipalComponentAnalysis Logistic Regression (Test set)',
       xlab = 'Age', ylab = 'Estimated Salary',
       xlim = range(X1), ylim = range(X2))
  
  contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
  
  points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
  points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
  
  
  
  ggsave("KernelPrincipalComponentAnalysisTestingsetResult.png")
  
}

visualisingTrainingSetResult(kernelPrincipalComponentAnalysisTrainingSet, KernelPrincipalComponentAnalysisWithLogisticRegressionModel)
visualisingTestingSetResult(kernelPrincipalComponentAnalysisTestingSet, KernelPrincipalComponentAnalysisWithLogisticRegressionModel)