#Resize a virtual machine

#Variables
$ResourceGroup = 'CandCVMPortal'
$VMName = 'az104portal'

#List available vm sizes
Get-AzVMSize -ResourceGroupName $resourceGroup -VMName $vmName

#Resize
$vm = Get-AzVM -ResourceGroupName $resourceGroup -VMName $vmName
$vm.HardwareProfile.VmSize = "Standard_DS1_v2"
Update-AzVM -VM $vm -ResourceGroupName $resourceGroup

#If the size is not available then deallocate, resize it and restart it. 