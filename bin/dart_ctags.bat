@echo off
rem This file was created by pub v2.16.2.
rem Package: dart_ctags
rem Version: 1.2.1
rem Executable: dart_ctags
rem Script: tags
if exist "C:\Users\han\AppData\Local\Pub\Cache\global_packages\dart_ctags\bin\tags.dart-2.16.2.snapshot" (
  call dart "C:\Users\han\AppData\Local\Pub\Cache\global_packages\dart_ctags\bin\tags.dart-2.16.2.snapshot" %*
  rem The VM exits with code 253 if the snapshot version is out-of-date.
  rem If it is, we need to delete it and run "pub global" manually.
  if not errorlevel 253 (
    goto error
  )
  dart pub global run dart_ctags:tags %*
) else (
  dart pub global run dart_ctags:tags %*
)
goto eof
:error
exit /b %errorlevel%
:eof

