Import-Module "C:\BenchKit\Modules\Detect-Hardware.psm1"

$profile = Get-HardwareProfile
Write-Host "First-Boot Optimizer – Profile: $profile" -ForegroundColor Cyan

# 1. Power plan – performance oriented but safe
powercfg -setactive SCHEME_MIN
powercfg -change -monitor-timeout-ac 0
powercfg -change -disk-timeout-ac 0
powercfg -change -standby-timeout-ac 0
powercfg -change -hibernate-timeout-ac 0

# 2. Disable Game Bar / DVR (safe)
reg add "HKCU\Software\Microsoft\GameBar" /v "ShowStartupPanel" /t REG_DWORD /d 0 /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d 0 /f

# 3. Profile-specific tweaks (all safe)
switch ($profile) {

    "Z790ApexEncore" {
        Write-Host "Applying Z790 Apex Encore first-boot tweaks..."
        # Example: keep everything performance oriented, no extra debloat here
    }

    "Z590Apex" {
        Write-Host "Applying Z590 Apex first-boot tweaks..."
    }

    "MSIB550" {
        Write-Host "Applying B550 first-boot tweaks..."
    }

    "StrixIntel" {
        Write-Host "Applying Strix Intel first-boot tweaks..."
    }

    "StrixAMD" {
        Write-Host "Applying Strix AMD first-boot tweaks..."
    }

    "ROGIntel" {
        Write-Host "Applying ROG Intel first-boot tweaks..."
    }

    "ROGAMD" {
        Write-Host "Applying ROG AMD first-boot tweaks..."
    }

    "LaptopNormal" {
        Write-Host "Applying Laptop Normal tweaks..."
        # Slightly less aggressive: keep balanced behavior
        powercfg -setactive SCHEME_BALANCED
    }

    "LaptopGaming" {
        Write-Host "Applying Laptop Gaming tweaks..."
        # Keep performance plan but don't touch much else
    }

    default {
        Write-Host "Applying GenericSafe tweaks..."
    }
}

Write-Host "First-Boot Optimizer complete. Reboot recommended." -ForegroundColor Green
