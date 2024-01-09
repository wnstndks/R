#어떤 음료에 대한 설문조사 결과로 상관관계 분석
result=read.csv("testdata/drinking_water.csv",header=T)
result
head(result,3)

summary(result)

cov(result$친밀도,result$적절성) #공분산 구하기
cov(result) #모든 칼럼사이의 공분산 보기

cor(result$친밀도,result$적절성)#상관계수 구하기
cor(result,method="pearson")

plot(result$적절성,result$만족도) #상관계수 0.7668527

symnum(cor(result)) #숫자를 심볼로 표시

install.packages("corrgram")
library(corrgram)

corrgram(result) #색상으로 상관계수를 표시
corrgram(result,upper.panel = panel.conf)  
corrgram(result,lower.panel = panel.conf)  
# 괄호안은 신뢰구간 제일 큰 숫자는 상관계수

#차트에 밀도곡선과 상관성 출력
install.packages("PerformanceAnalytics")
library(PerformanceAnalytics)

chart.Correlation(result,histogram = ,pch="+")
















