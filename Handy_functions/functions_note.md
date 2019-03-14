## Handy Functions

This is the list of functions written by me to support the data tasks: 

1. `gb_integer_cat(x, y)`: take the predictor (x) and the response variable (y) and compute the Information Value(IV), and Weight of Evidence (WOE)
2. `minmax_normalize(x)`: take vector x and normalize by its min and max
3. `pct_factor(x)`: summarise categorical variable x
4. `split_data(data, seed, p, target)`: automatic partition the dataset into `train` and `test` set, keeping them balance by the rate of target
5. `summary_handy(df, brief = T, quantile = F)`: handy function to do the data summary for the whole table `df`
6. `univariate_cont_plot(x, y, varname, color)`: creating the plot for univariate continuous analysis
7. `var_treat(v, q_low = 0.05, q_up = 0.95, impute_val = NULL)`: handy functions to cap/floor variable, and impute missing variable by a sepcific value
