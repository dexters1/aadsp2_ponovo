@echo off

SET CONFIGURATION=Debug
SET PROJECT_NAME1=Zadatak_model0
SET PROJECT_NAME2=Zadatak_model1
SET PROJECT_NAME3=Zadatak_model2

: TO DO: Add additional command line args for your program 
: LIST OF ARGS: ( 1. ENABLE(0/1), 2. INPUT GAIN(-dB), 3. HEADROOM GAIN(-dB), 
:				4. MODE(0/2_0_0, 1/0_2_0, 2/3_2_0), 5. RATIO[0.0, 8.0), 6. TRESHOLD[0.0, 1.0))
SET ADDITIONAL_ARGS="1 -3 1"

SET COMPARE="PCMCompare.exe"
SET COMPARE_ARGS=-b16

: Delete log files first.

del /Q OutCmp\*
del /Q Output\*


: For each Test stream
for %%f in (TestStreams\*.*) do ( 
	echo Running tests for stream: %%~nf%%~xf
	
	: Execute Model 0, Model 1 and Model 2
	echo     model 0
	"Zadatak_model0\%CONFIGURATION%\%PROJECT_NAME1%.exe" "%%f" "Output//%%~nf_model0.wav" 1 -3 1

	echo     model 1
	"Zadatak_model1\%CONFIGURATION%\%PROJECT_NAME2%.exe" "%%f" "Output//%%~nf_model1.wav" 1 -3 1
	
	echo     model 2
	"Zadatak_model2\%CONFIGURATION%\%PROJECT_NAME3%.exe" "%%f" "Output//%%~nf_model2.wav" 1 -3 1

	: Generate new logs
	%COMPARE% Output//%%~nf_model0.wav Output//%%~nf_model1.wav %COMPARE_ARGS% 2> OutCmp//%%~nf_Model0_vs_Model1.txt
	%COMPARE% Output//%%~nf_model1.wav Output//%%~nf_model2.wav %COMPARE_ARGS% 2> OutCmp//%%~nf_Model1_vs_Model2.txt
	%COMPARE% Output//%%~nf_model1.wav Output//%%~nf_model3.wav %COMPARE_ARGS% 2> OutCmp//%%~nf_Model1_vs_Model3.txt
)
cmd /k