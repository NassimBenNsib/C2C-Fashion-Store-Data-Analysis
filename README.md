# Mini BI Project - C2C Fashion Store Data Analysis

This README file provides an overview of the mini Business Intelligence (BI) project conducted as part of the LA3INFO course. The project focuses on the data analysis of a Customer-to-Customer (C2C) online fashion store. Specific details and steps of the work carried out are presented below.

## Project Description:

The project involves an in-depth analysis of a dataset from a Customer-to-Customer (C2C) online fashion store. The goal is to understand user purchasing and interaction behaviors, identify trends, and create predictive models for customer retention.

## Tasks and Accomplished Steps:

### A-  Data Preparation:

1.   Loading data from a CSV file.
2.   Data transformation to reduce the number of attributes to 20.
3.   Conversion of categorical variables to factor variables.
4.   Checking for missing data and data cleaning.

### B-  Data Exploration:

1.  Calculation of correlation between numeric variables.
2.  Summary statistics of numeric variables.
3.  Plots of histograms, boxplots, and scatter plots to understand distribution and potential presence of outliers.

### C.  Cluster Analysis:

1. Application of K-Means clustering algorithm to group users into clusters.
2. Evaluation of inertia to determine the optimal number of clusters.
3. Visualization of clusters using scatter plots.

### D.  Classification and Prediction:

1.  Creation of a target variable "leaveStore" to predict if a user will leave the store.
2.  Division of data into training and test sets.
3.  Creation of a decision tree model for classification.
4.  Prediction of classes on the test set and evaluation of performance.

## Project Overview:

Data Transformation and Attribute Reduction: You performed data transformations on the dataset and reduced the number of attributes to 20. After these transformations, you used the str command to observe the current state of the dataset.

1.  **Correlation Analysis**: Calculated correlations between numeric variables to identify linear relationships. If variables show strong correlations (>0.9), you considered further attribute reduction to eliminate redundancy.
2.  **Data Exploration**: After transformation, your dataset now contains 18 attributes. You again used the str command to observe the dataset's current state.
3.  **Summary Statistics**: Used the summary command to generate summary statistics for numeric variables. You commented on the values to identify trends and potential outliers.
4.  **Plots**: Created histograms, boxplots, and scatter plots to visualize the distribution and relationships of numeric variables.
5.  **Barplots**: Used barplots to visualize the distribution of Factor-type categorical variables.
6.  **Clustering Algorithms**: Applied clustering algorithms like K-Means to categorize customers based on behaviors and preferences.
7.  **Classification Algorithms**: Used decision trees or K-Nearest Neighbors (KNN) to predict whether customers are likely to leave the store or stay and conduct transactions. Required labeled data indicating whether customers left or not.

Each step involves programming, statistics, and machine learning skills. You utilized programming languages like R or Python with libraries like pandas, scikit-learn, and matplotlib/seaborn.

If you have further questions or need assistance, feel free to ask!

## Data Description:

**Data Dimension**: 98913 observations (users)
**Reduced Variables:**
-   identifierHash: Numeric - Anonymous unique ID.
-   type: Character - The type of entity (only "user" entities).
-   country: Character - User's country (written in French). See "Country Code" for ISO identifier.
-   language: Character - The user's preferred language.
-   socialNbFollowers: Integer - Number of users who follow this user's activity.
-   socialNbFollows: Integer - Number of user accounts this user follows.
-   socialProductsLiked: Integer - Number of products this user liked.
-   productsListed: Integer - Number of currently unsold products uploaded by this user.
-   productsSold: Integer - Number of products sold by this user.
-   productsPassRate: Numeric - Percentage of products meeting the description (reviewed by the store's team before shipping).
-   productsBought: Integer - Number of products bought by this user.
-   gender: Character - User's gender.
-   civilityGenderId: Integer - Civility as an integer.

## How to use code

1.  Make sure you have R installed on your system.
2.  Download the data in a CSV file and specify its path in the script script_final_mini_projet.R.
3.  Run the R script script_final_mini_projet.R to perform data analysis.


## Note
This project was carried out for educational purposes and demonstrates the use of data analysis, statistical, and machine learning techniques. The results and conclusions should be interpreted with care and might require further analysis.

Feel free to contact us if you have any questions or comments regarding this project.

## Project Information:
**Realized by**: Nassim Ben Nsib (LA3INFO TD1 TP1)
**Email Address**: nassim.bennsib@gmail.com
Professor: Gzara Mariem
**Level**: LA3INFO
**Group** : TD1
**TP (Practical Work)**: TP1
**Academic Year**: 2020-2021