# Speech recognition system

The system is written in Matlab. The local save location is ‘/Users/crystal/Documents/MATLAB/assignment1’, which needs to be changed when running on other devices. The system uses the voicebox tool to finish task5.

## How to run

Run this program in MATLAB.

Folder ‘Signal Analysis’ contains all work required in task4. You can call the functions in the file ‘use_function.m’.

Folder ‘speech_recognition_system’ contains all the work required in task5. You can run 'compare_one_signal.m' to calculated an accumulated distortion score matrix. The optimal score is highlight manually. You can run 'confusion_matrix.m' to compare all the inferences and inputs and save the confusion matrix table in 'Confusion matrix-table.csv'.

## More details

Recording of template data(SxA.wav) and testing data(SxB.wav) are saved separately in folder ‘inference’ and folder ‘input’.

Plotting.m is use to plot time domain signals of 'S1A.wav'. 

Folder ‘Signal Analysis’ contains all work required in task4 and I use 'S1A.wav' for example. 'end_point_dect.m' is written to find and plot the start-point and end-point of a signal. 'get_seg.m' is used to pick a 20ms segment from the same signal. The result of Fourier Transform is plotted in 'fourier_transform.m'. The pre-emphasis signal of the segment is found in 'pre_emphasis'. The 10 LPC parameters are calculated in 'lpc.m'.

The speech recognition system in task5 is completed in folder ‘speech_recognition_system’. Capture_audio.m is used to capture clips with voice. Get_MFCC_parameters.m is the function to get MFCC matrix of a signal. The distortion matrix between these two signals is calculated by calculate_distance.m. Accumulated distortion score matrix and optimal score are found in accumulated_distortion.m and optimal_score.m. In compare_one_signal.m, I calculate accumulated distortion score matrix of S1A.wav and S1B.wav, and write the result in ‘accumulated distortion score matrix.csv’, optimal path are manually highlight to yellow and saved in ‘accumulated distortion score matrix.xlsm’. In 'confusion_matrix.m', I calculated all the optimal scores and classified each input into the class with the smallest optimal score, I build a confusion matrix to represent the recognition result and saved the confusion matrix in ‘Confusion matrix-table.csv’.