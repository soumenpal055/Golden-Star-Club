@echo off
echo Compiling Servlets...

REM Define Tomcat Home for servlet-api.jar
set TOMCAT_HOME=c:\Program Files\Apache Software Foundation\Tomcat 9.0
set CLASSPATH="%TOMCAT_HOME%\lib\servlet-api.jar"

REM Create WEB-INF\classes directory if it does not exist
if not exist "WEB-INF\classes" mkdir "WEB-INF\classes"

REM Compile the servlet
javac -cp %CLASSPATH% -d WEB-INF\classes src\main\java\servlet\*.java

if %ERRORLEVEL% equ 0 (
    echo Compilation successful. Classes placed in WEB-INF\classes.
) else (
    echo Compilation failed.
)
pause