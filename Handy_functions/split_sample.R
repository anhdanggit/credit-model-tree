split_data <- function(data, seed = 4242, p = 0.6, target = 'gb12'){
  set.seed(seed)
  
  train_index <- createDataPartition(data[[target]], times = 1, p=p)$Resample1
  train <<- data[train_index, ]
  test <<- data[-train_index, ]
  
  cat(paste0('Done! train and test are in your environment \n',
             'Train Set: ', nrow(train), ' - Percent: ', nrow(train)/nrow(data), 
             ' - Bad Rate: ', mean(train[[target]], na.rm = T), '\n',
             'Test Set: ', nrow(test), ' - Percent: ', nrow(test)/nrow(data), 
             ' - Bad rate: ', mean(test[[target]], na.rm = T)))
}
