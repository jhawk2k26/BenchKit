Write-Host "Starting Bench Session..." -ForegroundColor Cyan

$apps = @(
    "HWiNFO64",
    "GPU-Z",
    "3DMark"
)

# Try to launch by common paths; adjust if needed
$paths = @(
    "C:\Program Files\HWiNFO64\HWiNFO64.exe",
    "C:\Program Files (x86)\HWiNFO64\HWiNFO64.exe",
    "C:\Program Files (x86)\GPU-Z\GPU-Z.exe",
    "C:\Program Files\GPU-Z\GPU-Z.exe",
    "C:\Program Files\UL\3DMark\3DMark.exe",
    "C:\Program Files (x86)\UL\3DMark\3DMark.exe"
)

foreach ($p in $paths) {
    if (Test-Path $p) {
        Write-Host "Launching: $p"
        Start-Process $p
    }
}

Write-Host "Bench Session launch attempt complete. Verify all tools started as expected." -ForegroundColor Green
