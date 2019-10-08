# BodyFat Calculation Project

## Yun Mo, Fangyang Chen, Anne Huen Wai Wong, Richard Yang

This is a course project aiming at coming up with a simple, precise, and accurate way of determining body fat percentage of males based on available and convenient measurements. BodyFat Summary.ipynb is an executive summary of the data analysis process and findings in Jupyter Notebook pattern. After using several variables selection methods, we found it's highly correlated with

## code
There are 4 R code files: 

- data.R visualized the data, removes outliers and divides the data into a train set and validation set.

- mlr.R constructs multiple linear models to predict BodyFat%.


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

- **Bodyfat_used.Rdata is the Rdata after removing all outliers from the original dataset.**

## Shiny app

**In the shiny app, we have finished a web-based application to help male users calculate their bodyfat and then give them some instruction good for their health.

