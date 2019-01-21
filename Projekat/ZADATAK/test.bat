@echo off

SET CONFIGURATION=Debug
SET PROJECT_NAME1=Zadatak_model0
SET PROJECT_NAME2=Zadatak_model1
SET PROJECT_NAME3=Zadatak_model2

SET COMPARE="PCMCompare.exe"
SET COMPARE_ARGS=-b16

SET SIMULATOR=C:\CirrusDSP\bin\cmdline_simulator.exe -silent

: Delete log files first.

del /Q OutCmp\*
del /Q Output\*


: For each Test stream
for %%f in (TestStreams\*.*) do ( 
	echo Running tests for stream: %%~nf%%~xf
	
	: Execute Model 0, Model 1 and Model 2
	echo     model 0
	"Zadatak_model0\%CONFIGURATION%\%PROJECT_NAME1%.exe" "%%f" "Output//%%~nf_model0.wav" 1 -6 -3 3_2_0

	echo     model 1
	"Zadatak_model1\%CONFIGURATION%\%PROJECT_NAME2%.exe" "%%f" "Output//%%~nf_model1.wav" 1 -6 -3 3_2_0
	
	echo     model 2
	"Zadatak_model2\%CONFIGURATION%\%PROJECT_NAME3%.exe" "%%f" "Output//%%~nf_model2.wav" 1 -6 -3 3_2_0
	
	echo     model 3
	(
		@echo ^<?xml version="1.0" encoding="UTF-8" standalone="yes"?^>
		@echo ^<CL_PROJECT^>
		@echo     ^<argv^>%%f Output\%%~nf_model3.wav %ADDITIONAL_ARGS%^</argv^>
		@echo     ^<FILE_IO_CFG block_type="Input" channels_per_line="2" delay="0" file_mode="PCM" index="0" justification="Left" sample_format="LittleEndian" sample_rate="48000" sample_size="32"/^>
		@echo     ^<FILE_IO_CFG block_type="Output" channels_per_line="2" delay="0" file_mode="PCM" index="0" justification="Left" sample_format="LittleEndian" sample_rate="48000" sample_size="32"/^>
		@echo     ^<MEMORY_CFG^>
		@echo         ^<ULD_FILE disk_path="Zadatak_model3/output/standalone/Zadatak_model3.uld"/^>
		@echo     ^</MEMORY_CFG^>
		@echo     ^<PROFILE_CFG enable="on"/^>
		@echo     ^<SCP_CFG load_delay="0"/^>
		@echo ^</CL_PROJECT^>
	) > SimulatorConfigurationTemp.sbr
	%SIMULATOR% -project SimulatorConfigurationTemp.sbr -max_cycles 1000000
	


	: Generate new logs
	%COMPARE% Output//%%~nf_model0.wav Output//%%~nf_model1.wav %COMPARE_ARGS% 2> OutCmp//%%~nf_Model0_vs_Model1.txt
	%COMPARE% Output//%%~nf_model1.wav Output//%%~nf_model2.wav %COMPARE_ARGS% 2> OutCmp//%%~nf_Model1_vs_Model2.txt
	%COMPARE% Output//%%~nf_model1.wav Output//%%~nf_model3.wav %COMPARE_ARGS% 2> OutCmp//%%~nf_Model1_vs_Model3.txt
)
cmd /k