# DSST-matlab
This MATLAB code implements the Discriminative Scale Space Tracker (DSST)
___
Installation:
To be able to run the "mexResize" function, try to use either one of the included mex-files or compile one of your own. 
OpenCV is needed for this. It can be modified for this purpose.

compilemex in linux :

mex -lopencv_core -lopencv_imgproc -L/usr/include/ -I/usr/include/ mexResize.cpp MxArray.cpp
___
compilemex in windows:

mex -lopencv_core242 -lopencv_imgproc242 -L"C:\Program Files\OpenCV-2.4.2\build\x64\vc10\lib" -I"C:\Program Files\OpenCV-2.4.2\build\include" mexResize.cpp MxArray.cpp
___
Instructions:
1) Run the run_tracker.m script in MATLAB.
2) Choose sequence.
