learning_rate=0.6
x1=0.5, x2=0.8, x3=0.7
wh1=0.24, wh2=0.43, wh3=0.52,
ow11=0.12, ow12=0.42, ow13=0.1,
bh1=0.33, bh2=0.21, bh3 = 0.15,
s2=0.2, s3=0.1 


%term1=s1*ow11+s2*ow12+s3*0w13
u=x1*wh1+x2*wh2+x3*wh3+bh1
%term2=sigmoid(u)*(1-sigmoid (u) )
term2=(1/(1+exp(-u)))*(1-(1/(1+exp(-u))))
term3=x1
%gradient=term1*term2*term3
%wh1: (0.234-0.24) =-gradient*learning_rate
%gradient*learning_rate=(0.24-0.234)
%gradient=(0.24-0.234)/learning_rate=term1*term2*term3
term1=(0.24-0.234)/(learning_rate*term2*term3) %term1
s1=(term1-(s2*ow12+s3*ow13))/ow11