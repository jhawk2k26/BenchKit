Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = "BenchKit Launcher"
$form.Size = New-Object System.Drawing.Size(400,260)
$form.StartPosition = "CenterScreen"

$btnBuildISO = New-Object System.Windows.Forms.Button
$btnBuildISO.Text = "Build Universal ISO"
$btnBuildISO.Size = New-Object System.Drawing.Size(160,40)
$btnBuildISO.Location = New-Object System.Drawing.Point(30,30)
$btnBuildISO.Add_Click({
    Start-Process pwsh -ArgumentList "C:\BenchKit\Build-UniversalISO.ps1" -Verb RunAs
})

$btnBenchKit = New-Object System.Windows.Forms.Button
$btnBenchKit.Text = "Run BenchKit"
$btnBenchKit.Size = New-Object System.Drawing.Size(160,40)
$btnBenchKit.Location = New-Object System.Drawing.Point(200,30)
$btnBenchKit.Add_Click({
    Start-Process pwsh -ArgumentList "C:\BenchKit\BenchKit.ps1" -Verb RunAs
})

$btnDeployVentoy = New-Object System.Windows.Forms.Button
$btnDeployVentoy.Text = "Deploy ISOs to Ventoy"
$btnDeployVentoy.Size = New-Object System.Drawing.Size(160,40)
$btnDeployVentoy.Location = New-Object System.Drawing.Point(30,90)
$btnDeployVentoy.Add_Click({
    Start-Process pwsh -ArgumentList "C:\BenchKit\Deploy-ToVentoy.ps1" -Verb RunAs
})

$btnFirstBoot = New-Object System.Windows.Forms.Button
$btnFirstBoot.Text = "Run First-Boot Optimizer"
$btnFirstBoot.Size = New-Object System.Drawing.Size(160,40)
$btnFirstBoot.Location = New-Object System.Drawing.Point(200,90)
$btnFirstBoot.Add_Click({
    Start-Process pwsh -ArgumentList "C:\BenchKit\FirstBoot-Optimizer.ps1" -Verb RunAs
})

$btnDrivers = New-Object System.Windows.Forms.Button
$btnDrivers.Text = "Driver Helper"
$btnDrivers.Size = New-Object System.Drawing.Size(160,40)
$btnDrivers.Location = New-Object System.Drawing.Point(30,150)
$btnDrivers.Add_Click({
    Start-Process pwsh -ArgumentList "C:\BenchKit\Driver-Helper.ps1" -Verb RunAs
})

$form.Controls.AddRange(@(
    $btnBuildISO,
    $btnBenchKit,
    $btnDeployVentoy,
    $btnFirstBoot,
    $btnDrivers
))

[void]$form.ShowDialog()
