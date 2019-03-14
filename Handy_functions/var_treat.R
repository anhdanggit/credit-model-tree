
var_treat <- function(v, q_low = 0.05, q_up = 0.95, impute_val = NULL){
  v[v < quantile(v, q_low, na.rm = T)] = quantile(v, q_low, na.rm = T)
  v[v > quantile(v, q_up, na.rm = T)] = quantile(v, q_up, na.rm = T)
  if (is.null(impute_val)){
     v[is.na(v)] = median(v, na.rm = T)
  } else {
    v[is.na(v)] = impute_val
  }
 
  return(v)
}
