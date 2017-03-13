x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)
fit<-lm(y~x)
summary(fit)



x<-mtcars$wt
y<-mtcars$mpg
fit<-lm(y ~ x)

predict(fit,data.frame(x=mean(x)), interval="confidence")


predict(fit,data.frame(x=3), interval="prediction")


x
I(x/2)
fit2<-lm(y~I(x/2))
tbl2<-summary(fit2)$coefficients
mn<-tbl2[2,1]      #mean is the estimated slope
std_err<-tbl2[2,2] #standard error
deg_fr<-fit2$df    #degree of freedom
#Two sides T-Tests
mn + c(-1,1) * qt(0.975,df=deg_fr) * std_err



# 1m=100cm
# this is sufficient to solve question.

c<-5
cf1<-summary(fit)$coefficients
cf1
fit4<-lm(y~I(x+c)) # add some constant c
cf2<-summary(fit)$coefficients
cf2
b0<-cf1[1,1]
b1<-cf1[2,1]
c(b0,b1)
b0 - c*b1 #new intercept



fit
fit5<-lm(y ~ 1)
anova(fit)
anova(fit5)
278/1126
