
function seg = pre_emphasis(file_name)

[Y,FS]=audioread(file_name);
[s,e] = get_seg(file_name);
%the number of sample = frequency * time
N=0.02*FS;      %number of time samples
seg=Y(s:e-1);     %the seg1

clear Y;
clf;

figure(1);
plot(0:N-1,seg);       %the origional segment
a=0.95;     %pre-emphasis constant
for i=2:N
    seg(i)=seg(i)-a*seg(i-1);
end
figure(2);
plot(0:N-1,seg);

end
