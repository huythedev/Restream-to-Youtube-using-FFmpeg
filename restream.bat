@echo off
setlocal

:: Prompt for HTTP link
set /p "http_link=Enter the HTTP link: "

:: Prompt for stream key
set /p "stream_key=Enter the stream key: "

:: Initialize retry counter
set "retry_count=0"
set "max_retries=5"

:retry
:: Run ffmpeg command with the provided HTTP link and stream key
ffmpeg -i "%http_link%" -c copy -f flv "rtmp://a.rtmp.youtube.com/live2/%stream_key%"

:: Increment retry counter
set /a retry_count+=1

:: Check if the retry limit has been reached
if %retry_count% geq %max_retries% (
    echo The ffmpeg command has failed %max_retries% times. Exiting script.
    exit /b 1
)

:: Wait for 5 seconds before retrying
echo ffmpeg command exited. Retrying in 5 seconds... (Attempt %retry_count% of %max_retries%)
timeout /t 5 /nobreak >nul
goto retry

echo Max retries reached, exiting...

endlocal
