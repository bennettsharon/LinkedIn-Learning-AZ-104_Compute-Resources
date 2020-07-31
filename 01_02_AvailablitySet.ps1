#Add VM to an AS

New-AzVm `
        -ResourceGroupName "HA" `
        -Name "AZ104PS" `
        -Location "CanadaCentral" `
        -VirtualNetworkName "HA-vnet" `
        -SubnetName "default" `
        -SecurityGroupName "az104ha-nsg" `
        -PublicIpAddressName "az104haps-ip" `
        -AvailabilitySetName "az104" `
        