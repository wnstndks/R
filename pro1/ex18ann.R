#ann(artificial neural network)-뉴런이 하나인 경우 논리회로 중 XOR 문제를 해결할 수 없다.->뉴런의 개수를 늘려야 한다.

install.packages("nnet")
library(nnet)

input<-matrix(c(0,0,1,1,0,1,0,1),ncol=2)
input
output<-matrix(c(0,0,0,1)) #and, or,
output<-matrix(c(0,1,1,0)) #xor
output

ann<-nnet(input,output,maxit=1,size=2,decay=0.001) #size가 1일경우 아무리 열심히 찾아봐도 안된다.
ann
result<-predict(ann,input)
result
ifelse(result>0.5,1,0)

#node의 개수를 늘려주면 가능하다.
RELU