@echo off

:start
cls
echo Created by Cieldev
echo.
cd Config
for /f "tokens=* delims=" %%x in (DirToSave.txt) do set dir=%%x
if %dir%== goto errset
for /f "tokens=* delims=" %%x in (Mp3_OR_Mp4.txt) do set mp=%%x
if %mp%==mp4 goto mp4
if %mp%==Mp4 goto mp4
if %mp%==mP4 goto mp4
if %mp%==MP4 goto mp4
if %mp%==video goto mp4
if %mp%==Video goto mp4
if %mp%==VIDEO goto mp4



goto start1



:mp4
cd ..
cd Core
set /p id="Enter video url: "
echo.
yt-dlp -F %id%
echo.
set /p qua="Select video+audio quality: "
yt-dlp "-f %qua%" --merge-output-format mkv --console-title --no-mtime -o %dir%\%%(title)s.%%(ext)s %id% 
echo.
pause
cd ..
goto start



:start2
cd ..
cd Core
set /p id="Enter video url: "
yt-dlp --extract-audio --audio-format "mp3" --audio-quality 0 --console-title --no-mtime --youtube-skip-dash-manifest -o Download\%%(title)s.%%(ext)s %id%
yt-dlp --extract-audio --audio-format "mp3" --audio-quality 0 --console-title --no-mtime --youtube-skip-dash-manifest -o %dir%\%%(title)s.%%(ext)s %id%
pause
cd ..
goto start

:start1
cd ..
cd Core
set /p id="Enter video url: "
yt-dlp --extract-audio --audio-format "mp3" --audio-quality 0 --console-title --no-mtime --youtube-skip-dash-manifest -o %dir%\%%(title)s.%%(ext)s %id%
pause
cd ..
goto start











:errset
echo This is an empty file in the folder setting, please fill out correctly all the settings
echo.
pause
goto start