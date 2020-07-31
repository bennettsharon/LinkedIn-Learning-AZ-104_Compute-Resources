#Encrypt a disk

#Variables 
$ResourceGroup = 'CreateAndConfigureVMPS'
$vmName = 'az104ps'
$Location = 'CanadaCentral'
$KeyVaultName = 'az104ps'
$KeyVault = Get-AzKeyVault -VaultName $KeyVaultName -ResourceGroupName $ResourceGroup
$diskEncryptionKeyVaultUrl = $KeyVault.VaultUri
$KeyVaultResourceId = $KeyVault.ResourceId

#Create a key vault
New-AzKeyvault -name $KeyVaultName -ResourceGroupName $ResourceGroup `
-Location $Location -EnabledForDiskEncryption

#Enable encryption
$KeyVault = Get-AzKeyVault -VaultName $KeyVaultName -ResourceGroupName $ResourceGroup

Set-AzVMDiskEncryptionExtension -ResourceGroupName $ResourceGroup `
-VMName $vmName `
-DiskEncryptionKeyVaultUrl $KeyVault.VaultUri `
-DiskEncryptionKeyVaultId $KeyVault.ResourceId

#Verify the enryption
Get-AzVmDiskEncryptionStatus -ResourceGroupName $ResourceGroup `
-VMName $vmName

#Disable encryption
Disable-AzVMDiskEncryption -ResourceGroupName $ResourceGroup `
-VMName $vmName