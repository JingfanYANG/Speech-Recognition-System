%use function
clear all;  close all; clc;

file_name='/Users/crystal/Documents/MATLAB/assignment1/inference/S1A.wav';

%[s,e]=end_point_dect(file_name);     %4a end point detection
%[ss,se]=get_seg(file_name);     %manually pick a segment
%fr_seg = fourier_transform(file_name);      %fourier transform
%seg = pre_emphasis(file_name);       %pre_emphasis
a = lpc(file_name);     %calculate LPC parameters
