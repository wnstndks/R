# 단순 선형회귀 분석 모델
# 독립변수(x) 1개:연속형,종속변수(y):연속형

# 부모의 두뇌지수(IQ)와 자녀의 IQ를 이용해 선형회귀 분석
x <-c(110,120,130,140,150)
y <- c(100,105,128,115,155)
cor(x,y) #상관계수가 y: 0.86, 양의 상관관계가 매우 강함
plot(x,y)

#두 변수의 인과관계는? x가 y에 영향을 주는 것(분석가의 주관이 들어간것) -->회귀분석을 시도가능
#인과관계를 빼버리면 원인과 결과를 얘기하지 않음

#y=wx+b, w값을 구하는 것 <==최소제곱법을 이용하면 구할 수 있음
#모델을 생성 방법1 : 최소 제곱법 수식을 사용

x_dev=x-mean(x) #x에 대한 편차를 구한 것
y_dev=y-mean(y)
dev_mul<-(x_dev)*(y_dev) # 두 변수 각 편차의 곱
square<-x_dev**2 #x 편차 제곱
df<-data.frame(x,y,x_dev,y_dev,dev_mul,square)
df
mean(df$x)
mean(df$y)
sum(df$dev_mul)
sum(df$square)

w <- sum(df$dev_mul)/sum(df$square)
w #1.2

b<- mean(df$y)-w*mean(df$x)
b

#y=w*x+b     y=1.2*x+(-35.4) #모델 완성

#부모의 IQ 110인 경우 자식 IQ는?
w*110+b
w*120+b
1.2*120+(-35.4)


#모델을 생성 방법1 : R이 제공하는 함수를 사용
mymodel<-lm(formula=y~x) #lm(formula=종속변수 ~ 독립변수)
mymodel
predict(mymodel,data.frame(x=c(110,120,87.5,134.5667)))

plot(x,y)
abline(mymodel,col='blue')







