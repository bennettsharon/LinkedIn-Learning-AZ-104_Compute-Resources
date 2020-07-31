#Add a data disk

#Variables
$ResourceGroup = "Solution"
$Location = "CanadaCentral"
$VMName = "az104vm2"
$storageType = 'Premium_LRS'
$dataDiskName = $vmName + '_datadisk3'

#Create the disk

$diskConfig = New-AzDiskConfig -SkuName $storageType -Location $Location -CreateOption Empty -DiskSizeGB 128
$dataDisk1 = New-AzDisk -DiskName $dataDiskName -Disk $diskConfig -ResourceGroupName $ResourceGroup

#Update the vm
$vm = Get-AzVM -Name $VMName -ResourceGroupName $ResourceGroup
$vm = Add-AzVMDataDisk -VM $vm -Name $dataDiskName -CreateOption Attach -ManagedDiskId $dataDisk1.Id -Lun 1
Update-AzVM -VM $vm -ResourceGroupName $ResourceGroup
