@echo off
cd "%USERPROFILE%"

git clone https://github.com/vsedge/stable-diffusion-webui.git

cd "%USERPROFILE%\stable-diffusion-webui"
call webui-user.bat

