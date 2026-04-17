🧰 BenchKit
A modular Windows benchmarking toolkit for building, deploying, and optimizing clean Windows 11 bench OS environments.

BenchKit automatically:

Detects your hardware (Intel/AMD desktops, laptops, ROG/Strix/MSI boards)

Applies the correct preset for your platform

Builds a clean Windows 11 ISO using Chris Titus Tech’s MicroWin

Removes OneDrive (optional)

Deploys ISOs to Ventoy

Installs common benchmarking tools

Provides a GUI launcher

Includes a “Bench Session” mode (HWiNFO + GPU‑Z + 3DMark)

Exports hardware profiles for logging and sharing

BenchKit is designed for:

Overclockers

Hardware testers

Benchmarkers

System builders

Anyone who wants a clean, minimal Windows bench OS

📦 Requirements
You will need:

Windows 10 or 11

PowerShell 7.5 or newer

A Windows 11 ISO (download from Microsoft)

Ventoy USB drive (optional but recommended)

Admin rights to run scripts

📁 Folder Structure
BenchKit expects this layout:

Code
C:\BenchKit\
   BenchKit.ps1
   BenchKit-GUI.ps1
   Build-UniversalISO.ps1
   Deploy-ToVentoy.ps1
   FirstBoot-Optimizer.ps1
   Driver-Helper.ps1
   Bench-Session.ps1
   Remove-OneDrive.ps1
   Modules\
      Detect-Hardware.psm1
   Presets\
      *.ps1 (hardware presets)
   Logs\
   Output\
   BaseISO\
      Win11.iso
🚀 Getting Started
1. Install PowerShell 7
Download from Microsoft:
https://github.com/PowerShell/PowerShell

2. Download BenchKit
Clone the repo:

Code
git clone https://github.com/<your-username>/BenchKit.git
Or download ZIP → extract to:

Code
C:\BenchKit
3. Add your Windows 11 ISO
Place it here:

Code
C:\BenchKit\BaseISO\Win11.iso
4. Launch BenchKit GUI
Run:

Code
pwsh C:\BenchKit\BenchKit-GUI.ps1
🖥️ BenchKit GUI Overview
Build Universal ISO
Detects your hardware → applies correct preset → builds clean ISO.

Run BenchKit
Installs bench tools + applies safe performance tweaks.

Deploy ISOs to Ventoy
Copies all ISOs to your Ventoy USB.

First-Boot Optimizer
Run after installing Windows → applies safe, hardware‑aware tweaks.

Driver Helper
Detects your platform → guides you to correct driver sources.

Start Bench Session
Launches HWiNFO, GPU‑Z, and 3DMark together.

🧹 OneDrive Removal (Optional)
BenchKit includes:

ISO‑level OneDrive removal

Post‑install OneDrive cleaner

Run:

Code
pwsh C:\BenchKit\Remove-OneDrive.ps1
🧪 Bench Session Mode
Launches:

HWiNFO

GPU‑Z

3DMark

Useful for consistent benchmarking.

📝 Export Hardware Profile
BenchKit logs:

CPU

Motherboard

GPU

Vendor

Detected preset

Run:

Code
pwsh C:\BenchKit\Export-Profile.ps1
🧩 Supported Hardware Profiles
BenchKit automatically detects:

Intel Desktop
Z790 Apex Encore

Z590 Apex

ROG Intel

Strix Intel

AMD Desktop
MSI B550 (3600 / 5800X / 5800X3D)

ROG AMD

Strix AMD

Laptops
Normal laptops

Gaming laptops

Fallback
GenericSafe preset

🛑 What BenchKit Does NOT Do
BenchKit does not:

Modify BIOS

Change voltages

Apply unsafe registry edits

Flash firmware

Overclock hardware

BenchKit is safe and focuses only on OS‑level preparation.

🤝 Contributing
See CONTRIBUTING.md for guidelines.

📄 License
BenchKit is released under the MIT License.
See LICENSE for details.

📘 END OF README.md
