clear;  close;  clc;

optimal_matix=zeros(6,6);
for i=1:6
    %reference
    file_name1=strcat('/Users/crystal/Documents/MATLAB/assignment1/inference/S',string(i),'A.wav');
    new_file_name1=strcat('S',string(i),'A_cut.wav');
    for j=1:6
        %input
        file_name2=strcat('/Users/crystal/Documents/MATLAB/assignment1/input/S',string(j),'B.wav');
        new_file_name2=strcat('S',string(j),'B_cut.wav');
        optimal_matix(i,j) = optimal_score(file_name1,new_file_name1,file_name2,new_file_name2);
    end
end

Confusion_matrix=zeros(6,6);
for i=1:6
    minj=1;
    for j=2:6
        if optimal_matix(i,j)<optimal_matix(i,minj);
            minj=j;
        end
    end
    Confusion_matrix(i,minj)=1;
end

xlswrite('Confusion matrix-table',Confusion_matrix);