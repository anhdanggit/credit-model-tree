summary_handy <- function(df, brief = T, quantile = F){
  df1 <- do.call(rbind, lapply(df, function(u)
    data.frame(
      Obs = length(u),
      Missing = sum(is.na(u)),
      Unique  = length(unique(u)),
      Type    = class(u)[1],
      Min     = if(is.numeric(u)) min(u, na.rm=TRUE) else NA,
      Mean    = if(is.numeric(u)) mean(u, na.rm=TRUE) else NA,
      Median  = if(is.numeric(u)) median(u, na.rm=TRUE) else NA,
      Max     = if(is.numeric(u)) max(u, na.rm=TRUE) else NA,
      SD      = if(is.numeric(u)) sd(u, na.rm=TRUE) else NA,
      Q0.01   = if(is.numeric(u)) quantile(u, 0.01, na.rm=TRUE) else NA,
      Q0.05   = if(is.numeric(u)) quantile(u, 0.05, na.rm=TRUE) else NA,
      Q0.10   = if(is.numeric(u)) quantile(u, 0.10, na.rm=TRUE) else NA,
      Q0.25   = if(is.numeric(u)) quantile(u, 0.25, na.rm=TRUE) else NA,
      Q0.50   = if(is.numeric(u)) quantile(u, 0.50, na.rm=TRUE) else NA,
      Q0.75   = if(is.numeric(u)) quantile(u, 0.75, na.rm=TRUE) else NA,
      Q0.90   = if(is.numeric(u)) quantile(u, 0.90, na.rm=TRUE) else NA,
      Q0.95   = if(is.numeric(u)) quantile(u, 0.95, na.rm=TRUE) else NA,
      Q0.99   = if(is.numeric(u)) quantile(u, 0.99, na.rm=TRUE) else NA
      )))
  
  df1 <- df1 %>%
    dplyr::mutate(Variable = row.names(df1),
                  NA_rate = Missing / Obs) %>%
    dplyr::select(Variable, Obs, Missing, NA_rate, everything())
  if (brief == T){
    df1 <- df1 %>%
      select(-c(Q0.01, Q0.10, Q0.90, Q0.99))
  } 
  if(quantile == F){
    df1 <- df1 %>%
      select(-c(Q0.05, Q0.25, Q0.50, Q0.75, Q0.95))
  }
  
  return(df1)
}
