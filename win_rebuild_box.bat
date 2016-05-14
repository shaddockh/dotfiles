@echo off
:: Install chocolatey
@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

:: Install some common packages

:: System
choco install geforce-experience -y

:: Browsers
choco install googlechrome -y
choco install firefox -y

:: Tools
choco install treesizefree -y
choco install caffeine -y
choco install evernote -y
choco install gitter -y
choco install filezilla -y

:: Dev Tools
choco install git -y
choco install sourcetree -y
choco install atom -y
choco install cmake -y

:: Gaming
choco install steam -y


choco upgrade all

pause
