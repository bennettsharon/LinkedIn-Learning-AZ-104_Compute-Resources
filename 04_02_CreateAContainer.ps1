#Create a container

New-AzContainerGroup -ResourceGroupName Containers `
-Name mycontainer `
-Image mcr.microsoft.com/windows/servercore/iis:nanoserver `
-OsType Windows -DnsNameLabel az104container-demo-win