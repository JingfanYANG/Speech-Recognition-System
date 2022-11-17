%[s,e] = end_point_dec();




function [start_point,end_point] = end_point_dect(file_name)


%file_name='/Users/crystal/Documents/MATLAB/assignment1/input/S5B.wav'
[Y,FS]=audioread(file_name);
frame_length=0.02*2*FS;        %each frame time = 20ms          bytes                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          length of a frame
non_overlapping=0.01*2*FS;     %non-overlapping time = 10ms


%cut the audio into frame
time=length(Y)/FS;     %time of the audio       s
len=time*2*FS;      %how many bytes in the whole audio
l=frame_length;
frame_number=1;
while(l<len)    %calculate the number of frame in the audio
    frame_number=frame_number+1;
    l=l+non_overlapping;
end
% 一共分236个帧，每帧有1764个bytes 
%Y的长度为104448

%calculate the zero crossing rate
zc=zeros(1,frame_number);       %initial zero crossing number
for i=1:frame_number-1
    a=Y(i*(frame_length/2)/2 : (i+1)*(frame_length/2)/2);       %pick one frame
    for j=1:(frame_length/4-1)
        if a(j)*a(j+1)<0
            zc(i)=zc(i)+1;
        end
    end
end
%plot(zc);
%zc

%calculate energy
en=zeros(1,frame_number);
for i=1:frame_number-1
    b=Y(i*(frame_length/2)/2 : (i+1)*(frame_length/2)/2);       %pick one frame b
    e=b.*b;
    en(i)=sum(e);
end
%plot(en)
%en

%starting porint detect
E_threshold=0.1;      %define the lowest energy level
ZC_threshold=20;     %define the smalest zero crossing rate

for i=1:frame_number-2
    if( (zc(i)>ZC_threshold && en(i)>E_threshold) ...
        && (zc(i+1)>ZC_threshold && en(i+1)>E_threshold) ...
        && (zc(i+2)>ZC_threshold && en(i+2)>E_threshold) ...
        )
        start_point=(frame_length+(i-1)*non_overlapping)/2;
        break;
    end
end
for i=1:frame_number-2
    end_point=(frame_length+(i-1)*non_overlapping)/2;
    if( (zc(i)<ZC_threshold && en(i)<E_threshold) ...
            && (zc(i+1)<ZC_threshold && en(i+1)<E_threshold) ...
            && (zc(i+2)<ZC_threshold && en(i+2)<E_threshold) ...
            && end_point>start_point ...
            )
        break;
    end
end


plot(Y);
hold on;
line([start_point start_point], [-0.25 0.25], 'Color', 'red','LineWidth', 1); 
line([end_point end_point], [-0.25 0.25], 'Color', 'red','LineWidth', 1);
txt1 = 'T1';
text(start_point,-0.25,txt1,'FontSize',20,'Color','r')
txt2 = 'T2';
text(end_point,-0.25,txt2,'FontSize',20,'Color','r')


end

