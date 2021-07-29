$sasToken = Get-Content -Path D:\disk_sas_token

D:\azcopy.exe copy 'D:\packer\output\Virtual Hard Disks\packer-vm.vhd' $sasToken --blob-type PageBlob
