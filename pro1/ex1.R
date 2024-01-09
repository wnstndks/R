# 변수(데이터 유형)

va <- 1 
va=2
3->va
va #스칼라가 아님, 1차원 배열 va의 1번째값이 나오는 것

#함수 내에서 변수에게 값을 치환할때는 =방식을 추천
#일반 커맨드창에서 추천하고 싶다면<-방식을 추천

print(va) 
cat(va)

print(1,2)
cat(1,2)

# print는 한개만,cat은 여러개

a=5
b=3
c=a+b
c  #ctrl+alt+r->전체실행, ctrl+enter->한줄실행, 범위지정+ctrl+enter->범위실행
   #ctrl+shift c->주석

a=5
b=6
(c=a+b)


# 데이터 유형(문자형,숫자형,복소수형,논리형)
ss="홍길동"
typeof(ss)

kbs=9
typeof(kbs)

zz=5.5-3i
typeof(zz)
Re(zz)
Im(zz)

bb=TRUE
typeof(bb)
bb+T
is.logical(bb)

aa=NA #결측값->데이터값이 없다.
is.na(aa)

sum(2,3)
sum(2,3,NA) #연산에 NA가 포함되면 NA로 된다.
sum(2,3,NA,na.rm=T) #na.rm=T -> NA 제외하고 값 계산

typeof(NA)
typeof(NULL)
typeof(NaN)

length(NA) # ->missing value, 자릿수 확보, 값을 어디선가 데이터를 수집했지만, 데이터가 비어있는 값에 들어감
length(NULL) #자릿수 확보하지 않음
length(NaN) #자릿수 확보, , 수학적으로 정의되지 않은값

0/0
Inf*0 




#참고 -------------
#package : 데이터(dataset)+함수+알고리즘 꾸러미(컬렉션,R패키지가 저장된 폴더는 라이브러리라 함)

install.packages("plyr")
library(plyr)
search()

plyr::ddply()
#로딩된 패키지에서 ddply를 쓰는 것이 이것밖에 없다? 그냥 하면 됨
help("ddply")

dfx <- data.frame(
  group = c(rep('A', 8), rep('B', 15), rep('C', 6)),
  sex = sample(c("M", "F"), size = 29, replace = TRUE),
  age = runif(n = 29, min = 18, max = 54)
)

ddply(dfx, .(group, sex), summarize,
      mean = round(mean(age), 2),
      sd = round(sd(age), 2))

remove.packages("plyr")
search()

data() #dataset 목록보기
Nile
head(Nile,3)
hist(Nile,freq=F)
lines(density(Nile))

example("head")
help("mean")
example("mean")
x<-c(0:10,50,100)
x
c(xm,mean(c,trim = 0.10))
head(iris,3)
mean(iris$Sepal.Length)



