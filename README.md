# BodyFat Calculation Project

## Yun Mo, Fangyang Chen, Anne Huen Wai Wong, Richard Yang

This is a course project aiming at coming up with a simple, precise, and accurate way of determining body fat percentage of males based on available and convenient measurements. BodyFat Summary.ipynb is an summary of the data analysis process and findings in Jupyter Notebook pattern. After using several variables selection methods, we find it's highly correlated with Abdomen, Weight and Wrist. We build a linear regression model using above three variables for prediction.

The shiny app for our bodyfat calculator: https://team9bodyfat.shinyapps.io/628BodyFat/.

## code
There are 2 files: 

- code.R. Contain all codes we used.

- Overall Code.ipynb. Contain all codes and pictures, with some explanation words.


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

- **Bodyfat_used.csv is the Rdata after removing all outliers from the original dataset.**

## Shiny app

In the shiny app, we have finished a web-based application to help male users calculate their bodyfat and then give them some instruction good for their health.

