
function a=lpc(file_name)

[Y,FS]=audioread(file_name);
seg=pre_emphasis(file_name);     %pre-emphasis: calculate s(k)

p=10;       %the order of LPC for the chosen segment
N=0.02*FS;     %number of samples
r=zeros(1,p+1);

%autocorrelation: calculate r
for i=1:N
    r(1)=r(1)+seg(i)*seg(i);        %r0
    if i>=2
        r(2)=r(2)+seg(i)*seg(i-1);      %r1
    end
    if i>=3
        r(3)=r(3)+seg(i)*seg(i-2);
    end
    if i>=4
        r(4)=r(4)+seg(i)*seg(i-3);
    end
    if i>=5
        r(5)=r(5)+seg(i)*seg(i-4);
    end
    if i>=6
        r(6)=r(6)+seg(i)*seg(i-5);
    end
    if i>=7
        r(7)=r(7)+seg(i)*seg(i-6);
    end
    if i>=8
        r(8)=r(8)+seg(i)*seg(i-7);
    end
    if i>=9
        r(9)=r(9)+seg(i)*seg(i-8);
    end
    if i>=10
        r(10)=r(10)+seg(i)*seg(i-9);
    end
    if i>=11
        r(11)=r(11)+seg(i)*seg(i-10);       %r10
    end
end
%r

%LPC: calculate a
a=zeros([p,1]);
matrix=zeros([p,p]);
matrix_r=zeros([p,1]);

for i=1:p       %i row
    for j=1:p       % j col
        if i==j
            matrix(i,j)=r(1);
        else
            matrix(i,j)=r(abs(i-j));
        end
    end
end
%matrix

for i=1:p
    matrix_r(i,1)=r(i+1);
end
%matrix_r

a=inv(matrix)*matrix_r

end

