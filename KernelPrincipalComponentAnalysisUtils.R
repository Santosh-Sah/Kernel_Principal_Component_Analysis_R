importKernelPrincipalComponentAnalysisDataset <- function(kernelPrincipalComponentAnalysisDatasetFileName) {
  
  #importing dataset
  kernelPrincipalComponentAnalysisDataset = read.csv(kernelPrincipalComponentAnalysisDatasetFileName)
  
  #splitting the dataset into training set and testing set
  library(caTools)
  set.seed(1234)
  
  #getting the required columns
  kernelPrincipalComponentAnalysisDataset = kernelPrincipalComponentAnalysisDataset[,3:5]
  
  kernelPrincipalComponentAnalysisDatasetSlpit = sample.split(kernelPrincipalComponentAnalysisDataset$Purchased, SplitRatio = 0.80)
  
  kernelPrincipalComponentAnalysisTrainingSet = subset(kernelPrincipalComponentAnalysisDataset, kernelPrincipalComponentAnalysisDatasetSlpit == TRUE)
  
  kernelPrincipalComponentAnalysisTestingSet = subset(kernelPrincipalComponentAnalysisDataset, kernelPrincipalComponentAnalysisDatasetSlpit == FALSE)
  
  
  returnList <- list(kernelPrincipalComponentAnalysisTrainingSet, kernelPrincipalComponentAnalysisTestingSet)
  
  return (returnList)
  
}

#saving training and testing set
saveTrainingAndTestingDataset <- function(kernelPrincipalComponentAnalysisTrainingSet, kernelPrincipalComponentAnalysisTestingSet){
  
  saveRDS(kernelPrincipalComponentAnalysisTrainingSet, file = "KernelPrincipalComponentAnalysisTrainingSet.RDS")
  saveRDS(kernelPrincipalComponentAnalysisTestingSet, file = "KernelPrincipalComponentAnalysisTestingSet.RDS")
  
}

#Save KernelPrincipalComponentAnalysis with SupportVectorMachine Model
saveKernelPrincipalComponentAnalysisWithLogisticRegressionModel <- function(kernelPrincipalComponentAnalysisWithLogisticRegressionModel) {
  
  saveRDS(kernelPrincipalComponentAnalysisWithLogisticRegressionModel, file = "KernelPrincipalComponentAnalysisWithLogisticRegressionModel.RDS")
}

#Save prediced values for testing set
saveKernelPrincipalComponentAnalysisPredictedValuesForTestingSet <- function(kernelPrincipalComponentAnalysisPredictedValuesForTestingSet) {
  
  saveRDS(kernelPrincipalComponentAnalysisPredictedValuesForTestingSet, file = "KernelPrincipalComponentAnalysisPredictedValuesForTestingSet.RDS")
}

#Save KernelPrincipalComponentAnalysis object
saveKernelPrincipalComponentAnalysis <- function(kernelPrincipalComponentAnalysis) {
  
  saveRDS(kernelPrincipalComponentAnalysis, file = "KernelPrincipalComponentAnalysis.RDS")
}
