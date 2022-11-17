
function dist = calculate_distance(file_name1,new_file_name1,file_name2,new_file_name2)


[mfcc1,mfcc2] = get_MFCC_parameters(file_name1,new_file_name1,file_name2,new_file_name2);


% a (13-parameter) sound segment at time index t is M(1: 13, 𝑡).
% 时间为t时mfcc参数为M(1: 13, 𝑡)

%calculate distortion matrix
dist=zeros(size(mfcc1,2),size(mfcc2,2));

for t1=1:size(mfcc1,2)
    for t2=1:size(mfcc2,2)
        d=0;
        for j=2:13
            d=d+(mfcc1(j,t1)-mfcc2(j,t2)).^2;
        end
        dist(t1,t2)=sqrt(d);
    end
end

end
