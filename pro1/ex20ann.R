# iris dataset으로 출력겨과가 세개의 범주로 처리
data(iris)
head(iris,n=2)
unique(iris$Species)
dim(iris)

#분류 모델 작성 전, dataset을 train /test로 분리(7:3)
set.seed(123)
idx<-sample(1:nrow(iris),nrow(iris)*0.7)
idx
train<-iris[idx,]
test<-iris[-idx,]
nrow(train)
nrow(test)

library(nnet)
library(devtools)
source_url('https://gist.githubusercontent.com/fawda123/7471137/raw/466c1474d0a505ff044412703516c34f1a4684a5/nnet_plot_update.r')

#node를 1개 사용한 경우
model_1<-nnet(Species~.,train,size=1)
model_1 #softmax modelling : 출력값은 확률
summary(model_1)
plot.nnet(summary(model_1))

#node를 3개 사용한 경우
model_2<-nnet(Species~.,train,size=3)
model_2 #softmax modelling : 출력값은 확률
summary(model_2)
plot.nnet(summary(model_2))

# 분류 모델 평가
pred<-predict(model_1,test,type = "class")
t1<-table(pred1,test$Species)
t1
sum(diag(t1))/nrow(test) #0.9777778

pred2<-predict(model_2,test,type = "class")
t2<-table(pred2,test$Species)
t2
sum(diag(t2))/nrow(test) #0.9777778

#다른 방법
model_3<-nnet(train[,1:4],class.ind(train$Species),size=3,softmax = TRUE)
model_3
pr<-predict(model_3,newdata=test[,1:4],type="class")
pr
table(pr,test$Species)

#nnet은 단방향 학습만 처리 : 역전파(back pro)를 지원하지 않음 -범주형의 개수에 따라서 달라짐



