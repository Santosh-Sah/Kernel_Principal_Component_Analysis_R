source("KernelPrincipalComponentAnalysisUtils.R")
library(kernlab)
library(caret)
library(kernlab)

#reading KernelPrincipalComponentAnalysis object
kernelPrincipalComponentAnalysis <- readRDS("kernelPrincipalComponentAnalysis.RDS")

#reading testing set data
kernelPrincipalComponentAnalysisTestingSet <- readRDS("KernelPrincipalComponentAnalysisTestingSet.RDS")

#feature scaling
kernelPrincipalComponentAnalysisTestingSet[, 1:2] = scale(kernelPrincipalComponentAnalysisTestingSet[, 1:2])

#applying KernelPrincipalComponentAnalysis on testing set
kernelPrincipalComponentAnalysisTestingSetPCA = as.data.frame(predict(kernelPrincipalComponentAnalysis, kernelPrincipalComponentAnalysisTestingSet))

kernelPrincipalComponentAnalysisTestingSetPCA$Purchased = kernelPrincipalComponentAnalysisTestingSet$Purchased

#reading predicted values of the testing set
kernelPrincipalComponentAnalysisPredictedValuesForTestingSet <- readRDS("KernelPrincipalComponentAnalysisPredictedValuesForTestingSet.RDS")

kernelPrincipalComponentAnalysisConfusionMatrix = table(kernelPrincipalComponentAnalysisTestingSetPCA[, 3], kernelPrincipalComponentAnalysisPredictedValuesForTestingSet)

kernelPrincipalComponentAnalysisConfusionMatrix

#    0  1
# 0 46  5
# 1  7 22