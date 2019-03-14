univariate_cont_plot <- function(x, y, varname = 'varname', color = c('#A56','#EF798A','#3D40')){
  uni_gini = pROC::roc(y ~ x, ci = TRUE, direction="<")
  gini = 2*uni_gini$auc-1
  
  df <- data.frame(feature = x, target = y)
  
  # Histogram
  p1 <- ggplot(df, aes(x=feature)) +
    geom_histogram(color="#E63462", fill="#FE5F55", size = 1, alpha = 0.5) +
    ggtitle(label = 'Distribution of Feature') +
    theme(plot.title = element_text(size = 9), axis.title=element_text(size=9))
  
  # ROC
  p2 <- ggplot(df, aes(d = target, m = feature)) +
    plotROC::geom_roc(pointsize = 0.5, color = '#FE5F55', size = 1.2, labels = T, labelsize = 3) + ## 
    plotROC::style_roc(xlab = "1-Specificity", ylab = 'Sensitivity', guide = T, theme = theme_gray) +
    ggtitle(label = sprintf("Single Gini: %2.1f%%, Confidence Int. = [ %2.1f%%, %2.1f%% ]", 
                            (uni_gini$auc*2-1)*100, 
                            (2*uni_gini$ci[1]-1)*100, (2*uni_gini$ci[3]-1)*100)) +
    theme(plot.title = element_text(size = 9), axis.title=element_text(size=9))
  
  # bad Rate
  df_2 <- df %>%
    mutate(qtile_x = mltools::bin_data(feature, bins = 10, binType = 'quantile')) %>%
    group_by(qtile_x) %>%
    summarise(target_rate = mean(target, na.rm = T))
  
  p3 <- ggplot(df_2, aes(x = as.numeric(qtile_x), y = target_rate)) +
    geom_line(size = 1.7, color = '#333745', alpha = 1) +
    geom_point(size = 3, color = '#333745') +
    #scale_y_continuous(limits = c(5,30), breaks = seq(5,30,5)) +
    ggtitle ("Bad Rate by Quantile") +
    xlab("Bins by Quantiles of Features") +  
    ylab ("Bad rate") + #theme_classic() +
    theme(plot.title = element_text(size = 9), axis.title=element_text(size=9))
  
  # bar charts
  df_3 <- df %>%
    mutate(qtile_x = mltools::bin_data(feature, bins = 10, binType = 'quantile'),
           target = as.factor(target)) 
  
  levels(df_3$qtile_x) <- paste0('q', round(seq(0, 1, length.out = length(levels(df_2$qtile_x))), 2))
  levels(df_3$target) <- c('Good','Bad')
  
  p4 <- ggplot(df_3, aes(x = qtile_x, fill = target)) +
    geom_bar(position = 'fill', alpha = 1) +
    scale_fill_manual(values = c('#333745','#FE5F55')) +
    ggtitle ("Distribution of Bad by Quantiles of Features") +
    xlab("Bins by Quantiles of Features") +  
    ylab ("Bad rate") + #theme_classic() 
    theme(plot.title = element_text(size = 9), axis.title=element_text(size=9)) 
  
  # combine
  infotext <- sprintf("Feature: %s\nN = %d, Min = %g, Max = %g, NAs: %d", varname, length(df$feature), min(df$feature,na.rm=TRUE), max(df$feature,na.rm=TRUE), sum(is.na(df$feature)))
  grid.arrange(p1,p2, p3, p4, ncol=2, top = infotext)
}


#uni_cont_plot(x = train_set$RevolvingUtilizationOfUnsecuredLines, y = train_set$SeriousDlqin2yrs,
#              varname = 'DebtRatio')











