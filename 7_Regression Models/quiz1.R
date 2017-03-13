library(datasets)
plot(mpg ~ wt, data=mtcars)
model <- lm(mpg ~ wt, data=mtcars)
abline(model)

head(mtcars)
predict(model,newdata = data.frame(wt=7))

model <- lm(mpg ~ am, data=mtcars)
summary(model)
predict(model,newdata = data.frame(mpg=18.5))


x <- c(0.18, -1.54, 0.42, 0.95)
w <- c(2, 1, 3, 1)
sum(x*w)/sum(w)



x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)
regr_line <- lm(y ~ x + 0)
coef(regr_line)


library(datasets)
mtcars
lm(mpg~wt,mtcars)


slope <- .5 * 1/0.5



nor_score_quiz1 <- 1.5
nor_score_quiz2 <- 0.4 * nor_score_quiz1
nor_score_quiz2 


x <- c(8.58, 10.46, 9.01, 9.64, 8.86)
(x-mean(x))/sd(x)



x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)
lm(y~x)



x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
mean(x)