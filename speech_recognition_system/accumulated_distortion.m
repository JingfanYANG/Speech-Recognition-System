
%clear;  close;  clc;
function D = accumulated_distortion(file_name1,new_file_name1,file_name2,new_file_name2)

%distortion matrix
dist = calculate_distance(file_name1,new_file_name1,file_name2,new_file_name2);

%accumulated distortion score matrix
D=zeros(size(dist,1),size(dist,2));

for i=1:size(dist,1)
    for j=1:size(dist,2)
        if i==1 && j==1
            D(i,j)=dist(i,j);
        elseif i==1 && j~=1
            D(i,j)=dist(i,j)+D(i,j-1);
        elseif i~=1 && j==1
            D(i,j)=dist(i,j)+D(i-1,j);
        else 
            D(i,j)=dist(i,j)+find_min(D(i-1,j),D(i-1,j-1),D(i,j-1));
        end
    end
end

for i=1:size(dist)
    %找最后一行中最小的数
end

%找最后一列最小的数

%os=min(行最小，列最小)

%返回os 写入confusion matrix


end

