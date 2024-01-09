#단순/다중선형회귀 :mtcars dataset으로 mpg(연비) 예측하기
head(mtcars, n=3)
str(mtcars) #32*11

#연습1 -단순선형회귀
#hp : 독립변수, mpg :종속변수
#임의의 마력수를 입력하면 연비는 얼마?


cor(mtcars$hp,mtcars$mpg) # -0.7761684 :상관계수(공분산을 표준화)
plot(mpg ~hp,data=mtcars,xlab='hp',ylab='mpg')

# 공분산또한 표준화를 할수 있다
# y에 대한 분산
# x에 대한 분산
# x- x,y 각각의 표준편차로 나누어주게 되면 극단적인 걸로 들어가게 되면 표준편차는 0,
# 편차는 1


#인과관계가 있다고 판단하고, 회귀분석모델 작성
model1<-lm(mpg~hp,data=mtcars)
model1 #y= -0.06823*x+ 30.09886 : 일차방정식
summary(model1) #p-value:1.788e-0.7 < 0.05유의한 모델. R-squared:0.6024

abline(model1,col='blue')

#예측1 :수식사용
new_hp=110
cat('예측값 :',-0.06823*new_hp+ 30.09886)

new_hp=160
cat('예측값 :',-0.06823*new_hp+ 30.09886)

new_hp=60
cat('예측값 :',-0.06823*new_hp+ 30.09886)

#예측2 :predict 함수 사용
mynew <- mtcars[c(1,2),,] #기존데이터를 읽어
mynew<-edit(mynew)
pred<-predict(model1,newdata=mynew)
cat('예측값:',pred)


#연습2 -다중선형회귀
#hp(마력수),wt(차체무게):독립변수, mpg(연비) :종속변수
#임의의 마력수를 입력하면 연비는 얼마?

cor(mtcars$hp,mtcars$mpg) #-0.7761684
cor(mtcars$wt,mtcars$mpg) #-0.8676594

model2<-lm(formula=mpg~hp+wt,data=mtcars)
model2

summary(model2) #p-value:9.109e-12 <0.05이므로 유의. R-squared:0.8268
# 수식 :y=  -0.03177 *new_hp+   -3.87783 *new_wt+37.22727 

#예측1 :수식사용
new_hp=110;new_wt=2.2;
cat('예측값 :',-0.03177*new_hp+ 3.87783*new_wt+37.22727)  #25.20134

#예측2 :함수사용
pred2<-predict(model2) #모델 작성 학습에 참여한 데이터로 예측
cat('예측값 :',pred2[1:10])
cat('실제값 :',mtcars$mpg[1:10])

#새로운값에 대한 연비가 궁금
new_data<-data.frame(hp=123.45,wt=3.456)
predict(model2,newdata = new_data)

new_data<-data.frame(hp=c(93.45,111.11,145.0),wt=c(1.456,4,8))
predict(model2,newdata = new_data)




