# 산술(+,-,*,/,%%,^,**),관계(==,!=,>,>=,<,<=),논리(&,|,!,xor())

#제어문:조건판단문
#if()

x=10;
y=5;
x
y

if(x+y>=10){
  cat('결과는 ',x+y)
  cat('\n참일때 수행')
}else{
  print('거짓일때 수행')
}

#elseif 가능

ifelse(x>=5,'good','bad')
mpg

install.packages('ggplot2')
library(ggplot2)
head(mpg,n=2)
mpg=as.data.frame(ggplot2::mpg)
head(mpg,n=2)
dim(mpg)
str(mpg)
summary(mpg)
mpg$total=(mpg$cty+mpg$hwy)/2
head(mpg,n=2)
mean(mpg$total)

if(mean(mpg$total)>=20){
  cat('우수연비')
}else{
  cat('일반연비')
}

summary(mpg$total)
hist(mpg$total)

mpg$test=ifelse(mpg$total>=20,'합격','불합격')
head(mpg)
tail(mpg)

mpg$grade=ifelse(mpg$total>=30,'A',ifelse(mpg$total>=20,'B','C'))
head(mpg)

#switch 조건문

#switch(비교구문,실행1,실행2,...)
switch("age",id="hong",age=33,name="홍길동")
a=2
switch(a,mean(1:10),sd(1:10))

# 반복문
# for(변수 in 값){표현식}
i=1:5
for(n in i){
  print(n)
}
for(n in i){
  print(n)
  for(a in 1:10)
    print(a*n)
}

for(n in i){
  if(n%%2==1){
    next
  }else{
    print(n)
  }
}

#while(조건){표현식}
i=0
while(i<10){
  i=i+1
  print(i)
}

i=0
while(T){
  i=i+1
  print(i)
  if(i==15)
    break
}

#repeat
cnt=1
repeat{
  print(cnt)
  cnt=cnt+2
  if(cnt>5)break
}






