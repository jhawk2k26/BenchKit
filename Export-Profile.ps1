Import-Module "C:\BenchKit\Modules\Detect-Hardware.psm1"

$profile = Get-HardwareProfile
$cpu     = (Get-CimInstance Win32_Processor).Name
$board   = (Get-CimInstance Win32_BaseBoard).Product
$vendor  = (Get-CimInstance Win32_BaseBoard).Manufacturer
$gpu     = (Get-CimInstance Win32_VideoController | Select-Object -First 1).Name

$logDir = "C:\BenchKit\Logs"
if (!(Test-Path $logDir)) { New-Item $logDir -ItemType Directory | Out-Null }

$outFile = Join-Path $logDir "Profile-$(Get-Date -Format yyyyMMdd-HHmm).json"

$data = [PSCustomObject]@{
    Timestamp = Get-Date
    Profile   = $profile
    CPU       = $cpu
    Board     = $board
    Vendor    = $vendor
    GPU       = $gpu
}

$data | ConvertTo-Json | Out-File $outFile -Encoding UTF8

Write-Host "Profile exported to $outFile" -ForegroundColor Green
