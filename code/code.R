remove(list = ls())

library(dplyr)
library(glmnet)
library(xtable)
library(ggplot2)

################ Part 1: Data Preprocessing ################
################ 1.1 Dataset Overview

BodyFat = read.csv("BodyFat.csv") # raw dataset: BodyFat
head(BodyFat, n=5)
str(BodyFat)
xtable(summary(BodyFat))

# boxplot:
ggplot(stack(BodyFat[ ,-1]), aes(x = ind, y = values)) + geom_boxplot()

# linear relationship btw BODYFAT and DENSITY:
plot(BodyFat$BODYFAT ~ BodyFat$DENSITY)
text(BodyFat$DENSITY[c(48,76,96)], BodyFat$BODYFAT[c(48,76,96)], labels=BodyFat$IDNO[c(48,76,96)], cex=1, pos=4, col="red")

# delete IDNO and DENSITY:
bodyfat = BodyFat[ ,-c(1,3)]

################ 1.2 Extremum

head(BodyFat %>% arrange(BODYFAT), n=5)
head(BodyFat %>% arrange(desc(BODYFAT)), n=5)

# calculate bodyfat by DENSITY:
BodyFat$cal_fat = 495 / BodyFat$DENSITY - 450

index = order(abs(BodyFat$cal_fat - BodyFat$BODYFAT), decreasing = TRUE)[1:5]
BodyFat[index, c(2,3,18)]

# Deal with the extremum of WEIGHT:
options(repr.plot.width=4.875, repr.plot.height=2.5)
stripchart(BodyFat$WEIGHT)

BodyFat[which.max(BodyFat$WEIGHT), ]  # the highest weight guy

weight_kg_39 = 48.9 * (72.25 * 2.54 / 100)^2 # the 39th guy's weight in kg
(weight_lb_39 = weight_kg_39 / 0.45359237)   # the 39th guy's weight in lb

# Deal with the extremum of HEIGHT:
options(repr.plot.width=4.875, repr.plot.height=2.5)
stripchart(BodyFat$HEIGHT)

BodyFat[which.min(BodyFat$HEIGHT), ]  # the lowest height guy

height_m_42 =  sqrt( 205 * 0.45359237 / 29.9) # the 42th guy's height in m
(height_inch_42 = height_m_42 * 100 / 2.54)   # the 42th guy's height in inch

bodyfat$HEIGHT[42] = 69.4
bodyfat = bodyfat[-c(48,76,96,182,216,39), ] # dataset we used: bodyfat

################ 1.3 Leverages

str(bodyfat)

model = lm(BODYFAT ~ ., data = bodyfat)
summary(model)

plot(model, which = 4)
abline(h = 4 /(246 - 14), lty = 2, col = "red")

# possible leverages:
BodyFat[c(82,86,221), ]



################ Part 2: Model fitting #####################
################ 2.1 BIC

model.full = lm(BODYFAT ~ ., data = bodyfat)
model.bic.both = step(model.full, direction = "both", k = log(dim(bodyfat)[2]))
model.bic.backward = step(model.full, direction = "backward", k = log(dim(BodyFat)[2]))
model.null = lm(BODYFAT ~ 1, data = bodyfat)
model.bic.forward = step(model.null, direction = "forward", k = log(dim(bodyfat)[2]), scope = formula(model.full))
summary(model.bic.both)
summary(model.bic.backward)
summary(model.bic.forward)

# 3 variables:
model_BIC = lm(BODYFAT ~ ABDOMEN + WEIGHT + WRIST, data = bodyfat)
summary(model_BIC)

################ 2.2 LASSO

x = as.matrix(bodyfat[ ,-1])
y = bodyfat[ ,1]
cvfit = cv.glmnet(x, y, family = "gaussian", type.measure = "mse", nfolds = 10, alpha = 1, standardize = T)
plot(cvfit)

print(coef(cvfit, s = "lambda.min"))
print(coef(cvfit, s = "lambda.1se"))

model_LASSO = lm(BODYFAT ~ AGE + HEIGHT + ABDOMEN + WRIST, data = bodyfat)
summary(model_LASSO)

# 3 variables:
model_LASSO_final = lm(BODYFAT ~ HEIGHT + ABDOMEN + WRIST, data = bodyfat)
summary(model_LASSO_final)



################ Part 3: Model Evaluation ##################
################ 3.1 Summary of Estimation and Inference

summary(model_BIC)$coefficients

confint(model_BIC)

################ 3.2 Model Diagnosis

options(repr.plot.width=6, repr.plot.height=3)
par(mfrow = c(1,2))
plot(model_BIC, which = 1:2)

shapiro.test(model_BIC$residuals)

acf(model_BIC$residuals, main="series of model residuals")



################ generate plots ############################

png(file="data overview.png", width=800,height=600)
ggplot(stack(BodyFat[,-c(1,3,18)]), aes(x = ind, y = values)) + 
  geom_boxplot() + labs(title = "Data Overview") + theme(plot.title = element_text(hjust = 0.5))
dev.off()

png(file="linear relationship.png", width=800,height=600)
plot(BodyFat$BODYFAT ~ BodyFat$DENSITY)
text(BodyFat$DENSITY[c(48,76,96)], BodyFat$BODYFAT[c(48,76,96)], labels=BodyFat$IDNO[c(48,76,96)], cex=1, pos=4, col="red")
dev.off()

png(file="HEIGHT+WEIGHT.png", width=1000,height=200)
par(mfrow = c(1,2))
options(repr.plot.width = 10, repr.plot.height=2.5)
stripchart(BodyFat$WEIGHT, main = "WEIGHT")
options(repr.plot.width= 10, repr.plot.height=2.5)
stripchart(BodyFat$HEIGHT, main = "HEIGHT")
dev.off()

png(file="Diagnosis.png", width=800,height=200)
options(repr.plot.width=6, repr.plot.height=3)
par(mfrow = c(1,2))
plot(model_BIC, which = 1:2)
dev.off()



