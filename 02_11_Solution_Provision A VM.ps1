#Solution:Create a VM

#Variables
$ResourceGroup = "Solution"
$Location = "CanadaCentral"
$VMName = "az104vm2"

#Create a resource group
New-AzResourceGroup -Name $ResourceGroup -Location $Location

#Create a virtual machine
New-AzVm `
    -ResourceGroupName $ResourceGroup `
    -Name $vmname `
    -Location $Location `
    -VirtualNetworkName "az104vm2_Vnet" `
    -SubnetName "az104vm2_Subnet" `
    -SecurityGroupName "az104vm2_NetworkSecurityGroup" `
    -PublicIpAddressName "az104vm2_PublicIpAddress" `
    -ImageName "MicrosoftWindowsServer:WindowsServer:2016-Datacenter-smalldisk:latest"`
    -Openports 443,3389