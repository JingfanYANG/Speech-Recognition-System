%get optimal score

function os = optimal_score(file_name1,new_file_name1,file_name2,new_file_name2)

D = accumulated_distortion(file_name1,new_file_name1,file_name2,new_file_name2);
for i=1:size(D,1)-1
    if D(i,size(D,2)) < D(i+1,size(D,2))
        os1=D(i,size(D,2));
    else
        os1=D(i+1,size(D,2));
    end
end

for j=1:size(D,2)-1
    if D(size(D,1),j) < D(size(D,1),j+1)
        os2=D(size(D,1),j);
    else
        os2=D(size(D,1),j+1);
    end
end

os=min(os1,os2);

end