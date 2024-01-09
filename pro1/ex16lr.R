#Logistic Regression
# 종속변수(y:범주형)와 독립변수(x:연속형) 간의 관계를 통해 분류 모델을 작성
# 대개의 경우, 이항분류를 한다.
# 시그모이드 function 
# 신경망 이론(딥러닝)의 기초가 된다.

#실습 :미국의 어느 대학원 입학여부 관련 dataset을 사용
getwd()
setwd("C:/work/rsou/pro1")
mydata<-read.csv("testdata/binary.csv")
mydata
head(mydata,3)
unique(mydata$admit)
summary(mydata)

#admit에 대한 rank 빈도수
table(mydata$admit,mydata$rank)
xtabs(formula=~admit+rank,data=mydata)


#표본통계량으로 모집단을 추론하게 됨
#모집단의 경우 양이 많기 때문

#데이터분리 : 학습데이터 70%, 검정데이터 30% -과적합 방지가 목적
set.seed(1) #랜덤데이터 고정값
idx<-sample(1:nrow(mydata),nrow(mydata)*0.7)
length(idx)
train<-mydata[idx,]
test<-mydata[-idx,]
dim(train)
dim(test)
head(train,n=3)

#로지스틱회귀모델(이항분류)
?glm
lgmodel<-lm(formula=admit~.,data=train,family=binomial(link="logit"))
lgmodel
anova(lgmodel)
summary(lgmodel)


#분류예측
pred<-predict(lgmodel,newdata=test)
head(pred,10)
cat('예측값 :',head(ifelse(pred>0.5,1,0),30))
cat('실제값 :',head(test$admit,30))

#분류 정확도 계산
result_pred<-ifelse(pred>0.5,1,0)
t<-table(result_pred,test$admit)
t

(78+10)/nrow(test) # 0.7333333: 분류정확도(모델의 기능)->정통적방법, 오차행렬이용
(t[1,1]+t[2,2])/nrow(test)
sum(diag(t))/nrow(test)

# 새로운값으로 분류 결과 얻기
newdata<-train[c(1:3),]
newdata<-edit(newdata)
new_pred<-predict(lgmodel,newdata=newdata,type="response")
new_pred
ifelse(new_pred>0.5,'합격','불합격')





