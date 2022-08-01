#Yakir shalom 
#Afik franko
#part 1 
a <- as.numeric(123)
str(a)
a<-as.character(123)
str(a)
a<-as.factor(123)
str(a)

b <-list(1,2,3)
str(b)
b1<- list(1,"2",3)
str(b1)
c<-data.frame(b)
str(c)
c1<- data.frame(b1)
str(c1)
d<- c(1,2,3)
str(d)

# Line 14 b1 turns from list into a data frame
#and in In line 14 b1 turns the impressive into a data frame and in line 15 we get an explanation of our variable which consists of 3 variables / columns and one line
#And describes to us the type of variable, tells us how many columns and rows and what kind of data each column contains.


#yakir shalom 
#afik franko 
#part 1 
#Q2
mydata<-read.csv(choose.files(), stringsAsFactors =FALSE)
str(mydata)

#The variable type is Data frame

mydata1 <- mydata +1
write.csv(mydata1, file = "data2.csv", row.names = FALSE)

#Q 3.1
library(forecast)

#Q 3.2
data.ts<-ts(mydata)
plot(data.ts)
class(data.ts)

#The variable type is time series

#Q 3.3  Sections 1/2/3
timeS12 <- ts(data = data.ts,start = 2012,end = 2022,frequency = 12)
plot(timeS12)
#Q 3.3 Sections 4/5/6
timeS4 <- ts(data = data.ts,start = 2012,end = 2021,frequency = 4)
plot(timeS4)

#Q4 
# fit a linear regression model to the time series
dat.lm1 <- tslm(data.ts ~ trend)
summary(dat.lm1)
plot(data.ts)
lines(dat.lm1$fitted)


#Q5
movingAverage3<-ma(data.ts,order=3)
movingAverage6<-ma(data.ts,order=6)

plot(data.ts)
lines(movingAverage3, col="red")
lines(movingAverage6, col="blue")

#Q6

autoplot(data.ts, series="Demand")+
ggtitle("Covid-19 monthly infections")+
xlab("Month")+ 
ylab("Monthly Covid19 infections’")+
autolayer(movingAverage3, series="3-months")+
autolayer(movingAverage6, series="6-months")

#Q7
fc1 <- ses(data.ts, h=12, alpha = 0.1)
fc2 <- ses(data.ts, h=12, alpha = 0.5)
fc3 <- ses(data.ts, h=12, alpha = 0.9)
  
fc<- ses(data.ts, h=12)


autoplot(data.ts, series="Demand")+
ggtitle("Covid-19 monthly infections")+
xlab("Month")+ 
ylab("Monthly Covid19 infections’")+
autolayer(fc, series="Exponential smoothing")

#Q8
# Because the seasonality was unclear so we decided to do a seasonality of months
data.ts<-ts(mydata,frequency = 12)
decomposedTimeSeries <- decompose(data.ts)
plot(decomposedTimeSeries)

data.ts
summary(data.ts)
max(data.ts)-min(data.ts)

#Q9
dat.hw <- HoltWinters(AirPassengers)
plot(dat.hw, col = "blue", col.predicted = "red")

m <- HoltWinters(AirPassengers)
p <- predict(m, 100, prediction.interval = FALSE)
plot(m, p)


m <- HoltWinters(data.ts)
p <- predict(m, 20, prediction.interval = FALSE)

#Q10
fit <- HoltWinters(AirPassengers)
forc<-forecast(fit, h = 100)
plot(forc)

res<- forc$mean

fit <- HoltWinters(data.ts)
forc<-forecast(fit, h = 100)
plot(forc)
res<- forc$mean

#Q11
decomposedTimeSeries <- decompose(data.ts)
noise <-c(decomposedTimeSeries$random)

hist(noise,breaks = 30)
qqnorm(noise)
qqline(noise)

str(noise)

