Write-Host "Removing OneDrive for current system..." -ForegroundColor Cyan

# Kill running OneDrive
taskkill /f /im OneDrive.exe 2>$null

# Uninstall OneDrive (user + machine context)
$sysRoot = $env:SystemRoot
$oneDriveSetup = Join-Path $sysRoot "SysWOW64\OneDriveSetup.exe"
if (!(Test-Path $oneDriveSetup)) {
    $oneDriveSetup = Join-Path $sysRoot "System32\OneDriveSetup.exe"
}

if (Test-Path $oneDriveSetup) {
    & $oneDriveSetup /uninstall
}

# Remove leftover folders (safe)
$paths = @(
    "$env:USERPROFILE\OneDrive",
    "$env:LOCALAPPDATA\Microsoft\OneDrive",
    "$env:PROGRAMDATA\Microsoft OneDrive"
)

foreach ($p in $paths) {
    if (Test-Path $p) {
        Remove-Item $p -Recurse -Force -ErrorAction SilentlyContinue
    }
}

Write-Host "OneDrive removal script completed. A reboot is recommended." -ForegroundColor Green
