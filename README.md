# Credit Scoring: Logistic + Tree-based Algorithms

---
title: 'Credit Scoring: Logistic + Tree-based Algorithms'
author: "Anh Dang"
date: "10 March 2019"
---

By the data set from **Give Me Some Credit** (2012) <https://www.kaggle.com/c/GiveMeSomeCredit>, which contains 150,000 observations with 11 features, this work is to illustrate some useful techniques in Credit Scoring Modelling, namely:

1. Data Preparation and Exploration at Univariate Level with rank plots for continuous variables, and the Information Value Analysis to do variable transformation and selection
2. Multivariate Analysis with several feature engineering along the analytics 
3. **Synthetic Minority Over-sampling Techique (SMOTE)** for the unbalance data
4. **Standard Logistic Regression** with Step-wise selection
5. **Tree-based Recursive Partitioning** 
6. **(Unbiased Non-parametric Model-Based (MOB)** with two-layer of recursive partitioning, and logistic regression at terminal node as the hybrid of (4) and (5)
7. **Chi-squared Automation Interaction Detection** as another (and very interesting) approach of tree-based algorithms, comparing to the popular Recursive Partitioning CART or Regression Tree. The algorithms is designed to be more analytical-oriented than predict-oriented. 

**Practical Meanings**:

The purpose of this work is to briefly overview some practical and handy techniques which are applicable for credit scoring. Rather than the thorough calibriating and validating the model to obtain higher accuracy, this work is focusing on walk-through and discuss around the practical applications of these techniques.

* Data Exploration and Preparation would be mentioned
* `Logistic Regression` is covered as this is one of the most conventional approach in Credit Scoring
* However, the limitation of Logit is its dependencies in lineary and monotone relationship, and not efficient in capturining the non-linearity and interaction among features. This is a big limitation, especially in Credit Scoring for SMEs where we would expect the pattern is more varied, non-linear, and less straighforward than that of bigger companies
* In that sense, tree-based alogrithms might be good ideas as it conducts the classification taking into account the interactions, non-linearity and working well with categorical variables. The visual presentation of decision trees is easy to communicate, and could play the role as a framework for rule-based credit risk models. We would walk-through the `Recursive Partitioning` and `Chi-squared Automatic Detection (CHAID)`.
* As a hybrid approach, we discuss about `Model-Based Recursive Partitioning (MOB)` based on Logit model, to combine the advantages of both trees and logit regression. This method is also potential to be applied for segmentation in Risk modelling, and to validating the stability of model parameters among different subsets of population. 
