@echo off
cd "%USERPROFILE%"

git clone https://github.com/vsedge/stable-diffusion-webui.git

wt -d "%USERPROFILE%\stable-diffusion-webui" cmd /c "webui-user.bat"
