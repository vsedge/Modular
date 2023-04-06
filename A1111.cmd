@echo off
cd "%USERPROFILE%"

git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git

cd stable-diffusion-webui
(
  echo @echo off
  echo set PYTHON=
  echo set GIT=
  echo set VENV_DIR=
  echo set COMMANDLINE_ARGS= --xformers
  echo call webui.bat
) > temp.bat
move /y temp.bat webui-user.bat > nul
cd ..
wt -d "%USERPROFILE%\stable-diffusion-webui" cmd /c "webui-user.bat"