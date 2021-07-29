$global:progressPreference = 'silentlyContinue'
# Build images
cd D:\packer

# Get Start Time
$startDTM = (Get-Date)

# Variables
$template_file="./templates/hv_ubuntu2004_g2.json"
$var_file="./variables/variables_ubuntu2004.json"

packer build --force -var-file="$var_file" "$template_file"

$endDTM = (Get-Date)
Write-Host "[INFO]  - Elapsed Time: $(($endDTM-$startDTM).totalseconds) seconds" -ForegroundColor Yellow

Convert-VHD -Path "D:\packer\output\Virtual Hard Disks\packer-vm.vhdx" -DestinationPath "D:\hv-packer\output\Virtual Hard Disks\packer-vm.vhd" -VHDType Fixed
(Get-VHD 'D:\packer\output\Virtual Hard Disks\packer-vm.vhd').FileSize | Out-File -FilePath D:\disksize
