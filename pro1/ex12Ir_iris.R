# 단순선형회귀(독립변수 하나)모델: 회귀식 적합도 확인
data(iris)
head(iris,n=3)

cor(iris[1:4])
cor(iris$Sepal.Length,iris$Sepal.Width) #음의 상관관계가 매우 약하다

# 모델1 : 두 변량 간 상관관계가 낮은 경우로 모델 생성
model1 = lm(formula = Sepal.Length ~ Sepal.Width,data=iris)
model1

summary(model1) 
#해석 
# p-value(유의 확률) : 0.1519 > α(유의 수준:0.05) 
# 5프로 허용범위에서 벗어남 ->모델은 유의하지 않다.(인관관계가 없다)
# Multiple R-squared(결정계수,설명력) : 0.01382

#모델2 : 두 변량 간 상관관계가 높은 경우로 모델 생성
cor(iris$Sepal.Length,iris$Petal.Length) #0.8717538 ->야으이 상관관계가 매우 높다다
model2 = lm(formula = Sepal.Length ~ Petal.Length,data=iris)
model2

summary(model2)
#해석 
# p-value(유의 확률) : 2.2e-16 < α(유의 수준:0.05)이므로 유의하다.
# Multiple R-squared(결정계수,설명력) : 0.76









