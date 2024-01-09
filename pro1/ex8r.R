# 공분산과 상관계수

plot(1:5, 2:6)
cov(1:5,2:6) #공분산
cor(1:5,2:6) #상관계수(공분산을 표준화한 값 -> 평균 0, 표준편차 1)


plot(10:50,20:60)
cov(10:50,20:60)
cor(10:50,20:60)

plot(1:5,c(3,3,3,3,3))
cov(1:5,c(3,3,3,3,3))
cor(1:5,c(3,3,3,3,3))


plot(1:5,5:1)
cov(1:5,5:1)
cor(1:5,5:1)


# 아버지와 아들의 키의 공분산과 상관계수 구하기
getwd()
hf=read.csv("testdata/galton.csv",header=T)
head(hf,n=3)
dim(hf)
str(hf)

hf_man=subset(hf,sex=='M')
head(hf_man)
dim(hf_man)
hf_man=hf_man[c('father','height')]
head(hf_man)

# 공분산
cov(hf_man$father,hf_man$height)
cor(hf_man$father,hf_man$height) #상관계수
plot(hf_man$father,hf_man$height)
#폭이 좁을수록 데이터들이 몰려있다는 것
#뚱뚱할수록 관계가 우상향하고 있고, 뚜렷하지 않음

cor.test(hf_man$father,hf_man$height,method='pearson')

plot(height~father,data=hf_man,xlab="아버지키",ylab="아들키")
abline(lm(height~father,data=hf_man))

#상관계수가 절대값 1에 가까워질수록 두 변수 사이에는 관계가 있다



















