@echo off
cd %~dp0
start /WAIT "" "http://localhost/gui/programas"
npm i
npm run go