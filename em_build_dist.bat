pushd %~dp0

call em_build_win.bat %1 Release || goto :error
echo Build Succeeded.

call set TEST_CONFIG=Release
call npm run test || goto :error

mkdir dist
copy em_build\Release\assimpjs.js dist\assimpjs.js || goto :error
copy em_build\Release\assimpjs.wasm dist\assimpjs.wasm || goto :error

popd
echo Distribution Succeeded.

exit /b 0

:error
echo Distribution Failed with Error %errorlevel%.
popd
popd
exit /b 1