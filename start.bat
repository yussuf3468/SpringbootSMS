@echo off
REM Student Management System - Quick Start Script
REM This script builds and runs your application

echo ========================================
echo Student Management System - Starting...
echo ========================================
echo.

REM Navigate to project directory
cd /d "%~dp0"

echo [1/3] Cleaning previous builds...
call mvnw.cmd clean

echo.
echo [2/3] Building project...
call mvnw.cmd package -DskipTests

echo.
echo [3/3] Starting application...
echo.
echo ========================================
echo Application will start on port 8080
echo Open your browser to: http://localhost:8080
echo.
echo Available URLs:
echo   - http://localhost:8080/students/list
echo   - http://localhost:8080/students/add
echo   - http://localhost:8080/h2-console
echo.
echo Press Ctrl+C to stop the application
echo ========================================
echo.

call mvnw.cmd spring-boot:run

pause
