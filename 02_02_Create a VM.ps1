#Create a RG and VM

#Variables
$ResourceGroup = "CreateAndConfigureVmPS"
$Location = "CanadaCentral"
$VMName = "az104ps"

#Create a resource group
New-AzResourceGroup -Name $ResourceGroup -Location $Location

#Create a virtual machine
New-AzVm `
    -ResourceGroupName $ResourceGroup `
    -Name $vmname `
    -Location $Location `
    -VirtualNetworkName "az104vmpsVnet" `
    -SubnetName "az104vmpsSubnet" `
    -SecurityGroupName "az104vmpsNetworkSecurityGroup" `
    -PublicIpAddressName "az104vmpsPublicIpAddress" `
    -OpenPorts 3389

#View the vm
Get-AzVM -ResourceGroupName $resourcegroup -Name $VMName

#View the Resource Group
Get-AzResource -ResourceGroupName $resourcegroup | ft
