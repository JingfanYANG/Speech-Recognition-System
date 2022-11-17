clc
clear
%help audioread
%pick S6A from inference
[Y, FS]=audioread("/Users/crystal/Documents/MATLAB/assignment1/inference/S1A.wav")
%help plot
plot(Y);
title("Plot")
%sound(Y,FS)
