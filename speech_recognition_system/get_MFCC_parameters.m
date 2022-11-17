%use wav2mfcc1 to get MFCC parameters

%Clean-up MATLAB's environment
%clear; close all; clc;  
function [mfcc1,mfcc2] = get_MFCC_parameters(file_name1,new_file_name1,file_name2,new_file_name2)


%cut the audio
signal1 = capture_audio(file_name1,new_file_name1);
signal2 = capture_audio(file_name2,new_file_name2);

mfcc1=wav2mfcc1(signal1);
mfcc2=wav2mfcc1(signal2);

end


