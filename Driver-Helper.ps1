Import-Module "C:\BenchKit\Modules\Detect-Hardware.psm1"

$profile = Get-HardwareProfile
$gpuInfo = Get-CimInstance Win32_VideoController | Select-Object -First 1 Name

Write-Host "Driver Helper" -ForegroundColor Cyan
Write-Host "Profile: $profile"
Write-Host "GPU: $($gpuInfo.Name)"
Write-Host ""

# 1. Chipset / platform guidance
switch ($profile) {

    "Z790ApexEncore" {
        Write-Host "Intel Z790 platform detected."
        Write-Host "Use latest Intel chipset + ME drivers from ASUS support for Apex Encore."
    }

    "Z590Apex" {
        Write-Host "Intel Z590 platform detected."
        Write-Host "Use Intel chipset + ME drivers from ASUS Z590 Apex support page."
    }

    "MSIB550" {
        Write-Host "MSI B550 platform detected."
        Write-Host "Use AMD chipset drivers from AMD.com, plus MSI board support page."
    }

    "StrixIntel" {
        Write-Host "ROG Strix Intel platform detected."
    }

    "StrixAMD" {
        Write-Host "ROG Strix AMD platform detected."
    }

    "ROGIntel" {
        Write-Host "ROG Intel platform detected."
    }

    "ROGAMD" {
        Write-Host "ROG AMD platform detected."
    }

    "LaptopNormal" {
        Write-Host "Normal laptop detected – use OEM support page for drivers."
    }

    "LaptopGaming" {
        Write-Host "Gaming laptop detected – use OEM support page + GPU vendor drivers."
    }

    default {
        Write-Host "Generic platform – use board vendor + CPU vendor driver pages."
    }
}

Write-Host ""

# 2. GPU vendor detection
$gpuName = $gpuInfo.Name

if ($gpuName -match "NVIDIA") {
    Write-Host "NVIDIA GPU detected."
    Write-Host "- Use Game Ready or Studio driver from NVIDIA.com."
    Write-Host "- During install, choose Custom -> Graphics Driver + PhysX only."
}
elseif ($gpuName -match "AMD" -or $gpuName -match "Radeon") {
    Write-Host "AMD GPU detected."
    Write-Host "- Use Adrenalin driver from AMD.com."
}
elseif ($gpuName -match "Intel") {
    Write-Host "Intel iGPU detected."
    Write-Host "- Use Intel Graphics driver from Intel.com or OEM support."
}
else {
    Write-Host "Unknown GPU vendor – check Device Manager for details."
}

Write-Host ""
Write-Host "This helper gives you the correct direction; download/install from official sources." -ForegroundColor Yellow
