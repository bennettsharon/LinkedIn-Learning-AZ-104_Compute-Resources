#Create an image of a vm

#Variables
$vmName = "az104ps"
$rgName = "CreateAndConfigureVmPS"
$location = "CanadaCentral"
$imageName = "az104Server2016Image"

#Stop the vm
Stop-AzVM -ResourceGroupName $rgName -Name $vmName -Force

#Generalize the vm
Set-AzVm -ResourceGroupName $rgName -Name $vmName -Generalized

#Get the vm
$vm = Get-AzVM -Name $vmName -ResourceGroupName $rgName

#Create the image configuration
$image = New-AzImageConfig -Location $location -SourceVirtualMachineId $vm.Id

#Create the image
New-AzImage -Image $image -ImageName $imageName -ResourceGroupName $rgName