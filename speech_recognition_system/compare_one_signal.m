%compare one signal and write the accumulated distortion in a file
%manully draw the path
%highlight the path in the file

%reference
file_name1='/Users/crystal/Documents/MATLAB/assignment1/inference/S1A.wav';
new_file_name1='S1A_cut.wav';

%input
file_name2='/Users/crystal/Documents/MATLAB/assignment1/input/S1B.wav';
new_file_name2='S1B_cut.wav';

D = accumulated_distortion(file_name1,new_file_name1,file_name2,new_file_name2);

%save the martix in a file
xlswrite('accumulated distortion score matrix',D);