# BodyFat Calculator Project

### Writer: Yun Mo, Fangyang Chen, Anne Huen Wai Wong, Richard Yang

### Date: 10/09/2019

This is a course project aiming at coming up with a simple, precise, and accurate way of determining body fat percentage of males based on available and convenient measurements. Summary.ipynb is an executive summary of the data analysis process and findings in Jupyter Notebook pattern. After using several variables selection methods, we found it's highly correlated with the *weight*, circumference of *abdomen* and *wrist*.

Link to our Shiny app: https://team9bodyfat.shinyapps.io/628BodyFat/

## code
 
- Overall Code.ipynb: is an overall version of our analysis, including visualizes the data, removes outliers and constructs Multiple Linear Regression models to predict BodyFat%.

- code.R: is the overall code of our whole study, including visualizes the data, removes outliers and constructs Multiple Linear Regression models to predict BodyFat%, it also generates the dataset that we used and plots that we want to show. 


## image

This folder contains mainly the figures/images/tables produced in our analysis.

## data

- **BodyFat.csv is the original 252 records of clinical measurements including age, weight, height, bmi, and various body circumference measurements etc:**

Percent body fat from Siri's (1956) equation  
Density determined from underwater weighing  
Age (years)  
Weight (lbs)  
Height (inches)  
Adioposity (bmi)  
Neck circumference (cm)  
Chest circumference (cm)  
Abdomen 2 circumference (cm)  
Hip circumference (cm)  
Thigh circumference (cm)  
Knee circumference (cm)  
Ankle circumference (cm)  
Biceps (extended) circumference (cm)  
Forearm circumference (cm)  
Wrist circumference (cm)  

- **bodyfat_used.csv is the dataset we used to fit the model after removing outliers.**

## Shiny app

In the shiny app, we have finished a web-based application to help male users calculate their bodyfat and then give them some instruction good for their health.

